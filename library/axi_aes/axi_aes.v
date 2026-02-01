// ***************************************************************************
// ***************************************************************************
// AXI-Lite wrapper for Secworks AES core
//
// Register Map (directly maps to underlying AES core):
//   0x00: NAME0     (RO) - Core name "aes "
//   0x04: NAME1     (RO) - Core name "    "
//   0x08: VERSION   (RO) - Core version
//   0x20: CTRL      (WO) - bit[0]=init, bit[1]=next
//   0x24: STATUS    (RO) - bit[0]=ready, bit[1]=valid
//   0x28: CONFIG    (RW) - bit[0]=encdec (1=enc), bit[1]=keylen (1=256bit)
//   0x40: KEY0      (WO) - Key word 0 (MSB)
//   0x44: KEY1      (WO) - Key word 1
//   0x48: KEY2      (WO) - Key word 2
//   0x4C: KEY3      (WO) - Key word 3
//   0x50: KEY4      (WO) - Key word 4
//   0x54: KEY5      (WO) - Key word 5
//   0x58: KEY6      (WO) - Key word 6
//   0x5C: KEY7      (WO) - Key word 7 (LSB)
//   0x80: BLOCK0    (WO) - Block word 0 (MSB)
//   0x84: BLOCK1    (WO) - Block word 1
//   0x88: BLOCK2    (WO) - Block word 2
//   0x8C: BLOCK3    (WO) - Block word 3 (LSB)
//   0xC0: RESULT0   (RO) - Result word 0 (MSB)
//   0xC4: RESULT1   (RO) - Result word 1
//   0xC8: RESULT2   (RO) - Result word 2
//   0xCC: RESULT3   (RO) - Result word 3 (LSB)
//
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

module axi_aes #(
  parameter ID = 0
) (
  // AXI Slave interface
  input         s_axi_aclk,
  input         s_axi_aresetn,
  input         s_axi_awvalid,
  input  [15:0] s_axi_awaddr,
  output        s_axi_awready,
  input         s_axi_wvalid,
  input  [31:0] s_axi_wdata,
  input  [ 3:0] s_axi_wstrb,
  output        s_axi_wready,
  output        s_axi_bvalid,
  output [ 1:0] s_axi_bresp,
  input         s_axi_bready,
  input         s_axi_arvalid,
  input  [15:0] s_axi_araddr,
  output        s_axi_arready,
  output        s_axi_rvalid,
  output [ 1:0] s_axi_rresp,
  output [31:0] s_axi_rdata,
  input         s_axi_rready,

  // Interrupt output (active when result is valid)
  output        irq
);

  // Internal signals
  wire        up_clk;
  wire        up_rstn;
  wire        up_wreq;
  wire [13:0] up_waddr;
  wire [31:0] up_wdata;
  reg         up_wack;
  wire        up_rreq;
  wire [13:0] up_raddr;
  reg  [31:0] up_rdata;
  reg         up_rack;

  // AES core signals
  wire        aes_cs;
  wire        aes_we;
  wire [ 7:0] aes_address;
  wire [31:0] aes_write_data;
  wire [31:0] aes_read_data;

  // Internal registers
  reg         up_wreq_d;
  reg         up_rreq_d;
  reg         result_valid;

  // Clock and reset
  assign up_clk = s_axi_aclk;
  assign up_rstn = s_axi_aresetn;

  // AXI interface
  up_axi #(
    .AXI_ADDRESS_WIDTH(16)
  ) i_up_axi (
    .up_rstn(up_rstn),
    .up_clk(up_clk),
    .up_axi_awvalid(s_axi_awvalid),
    .up_axi_awaddr(s_axi_awaddr),
    .up_axi_awready(s_axi_awready),
    .up_axi_wvalid(s_axi_wvalid),
    .up_axi_wdata(s_axi_wdata),
    .up_axi_wstrb(s_axi_wstrb),
    .up_axi_wready(s_axi_wready),
    .up_axi_bvalid(s_axi_bvalid),
    .up_axi_bresp(s_axi_bresp),
    .up_axi_bready(s_axi_bready),
    .up_axi_arvalid(s_axi_arvalid),
    .up_axi_araddr(s_axi_araddr),
    .up_axi_arready(s_axi_arready),
    .up_axi_rvalid(s_axi_rvalid),
    .up_axi_rresp(s_axi_rresp),
    .up_axi_rdata(s_axi_rdata),
    .up_axi_rready(s_axi_rready),
    .up_wreq(up_wreq),
    .up_waddr(up_waddr),
    .up_wdata(up_wdata),
    .up_wack(up_wack),
    .up_rreq(up_rreq),
    .up_raddr(up_raddr),
    .up_rdata(up_rdata),
    .up_rack(up_rack)
  );

  // Address mapping from AXI word addresses to AES byte addresses
  // AXI word addr [13:0] -> AES byte addr [7:0]
  // We use bits [7:2] of the AXI address (up_waddr/up_raddr are already word addresses)
  // Note: For reads, we need to hold the address and cs for the delayed sampling cycle
  reg [5:0] raddr_held;
  always @(posedge up_clk) begin
    if (up_rreq)
      raddr_held <= up_raddr[5:0];
  end
  assign aes_address = up_wreq ? up_waddr[5:0] : (up_rreq ? up_raddr[5:0] : raddr_held);
  assign aes_cs = up_wreq | up_rreq | up_rreq_d;
  assign aes_we = up_wreq;
  assign aes_write_data = up_wdata;

  // Generate ack signals (1 cycle delay)
  always @(posedge up_clk) begin
    if (up_rstn == 1'b0) begin
      up_wreq_d <= 1'b0;
      up_rreq_d <= 1'b0;
      up_wack <= 1'b0;
      up_rack <= 1'b0;
      up_rdata <= 32'h0;
    end else begin
      up_wreq_d <= up_wreq;
      up_rreq_d <= up_rreq;
      up_wack <= up_wreq_d;
      up_rack <= up_rreq_d;
      if (up_rreq_d) begin
        up_rdata <= aes_read_data;
      end
    end
  end

  // Track result valid for interrupt
  always @(posedge up_clk) begin
    if (up_rstn == 1'b0) begin
      result_valid <= 1'b0;
    end else begin
      // Read status register to check valid bit
      // Status is at address 0x09, valid is bit 1
      if (up_rack && (up_raddr[5:0] == 6'h09)) begin
        result_valid <= aes_read_data[1];
      end
    end
  end

  // Interrupt when result is valid
  assign irq = result_valid;

  // AES core instantiation
  aes i_aes (
    .clk(up_clk),
    .reset_n(up_rstn),
    .cs(aes_cs),
    .we(aes_we),
    .address(aes_address),
    .write_data(aes_write_data),
    .read_data(aes_read_data)
  );

endmodule
