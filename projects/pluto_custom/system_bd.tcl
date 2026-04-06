###############################################################################
## Copyright (C) 2014-2024 Analog Devices, Inc. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

# create board design
source $ad_hdl_dir/library/axi_tdd/scripts/axi_tdd.tcl

# default ports

create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 ddr
create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 fixed_io

create_bd_port -dir O spi0_csn_2_o
create_bd_port -dir O spi0_csn_1_o
create_bd_port -dir O spi0_csn_0_o
create_bd_port -dir I spi0_csn_i
create_bd_port -dir I spi0_clk_i
create_bd_port -dir O spi0_clk_o
create_bd_port -dir I spi0_sdo_i
create_bd_port -dir O spi0_sdo_o
create_bd_port -dir I spi0_sdi_i

create_bd_port -dir I -from 17 -to 0 gpio_i
create_bd_port -dir O -from 17 -to 0 gpio_o
create_bd_port -dir O -from 17 -to 0 gpio_t

create_bd_port -dir O spi_csn_o
create_bd_port -dir I spi_csn_i
create_bd_port -dir I spi_clk_i
create_bd_port -dir O spi_clk_o
create_bd_port -dir I spi_sdo_i
create_bd_port -dir O spi_sdo_o
create_bd_port -dir I spi_sdi_i

create_bd_port -dir O txdata_o
create_bd_port -dir I tdd_ext_sync

# instance: sys_ps7

ad_ip_instance processing_system7 sys_ps7

# ps7 settings

ad_ip_parameter sys_ps7 CONFIG.PCW_PRESET_BANK0_VOLTAGE {LVCMOS 1.8V}
ad_ip_parameter sys_ps7 CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V}
ad_ip_parameter sys_ps7 CONFIG.PCW_PACKAGE_NAME clg225
ad_ip_parameter sys_ps7 CONFIG.PCW_USE_S_AXI_HP1 1
ad_ip_parameter sys_ps7 CONFIG.PCW_USE_S_AXI_HP2 1
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_CLK1_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_CLK2_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_RST1_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_RST2_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ 100.0
ad_ip_parameter sys_ps7 CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ 200.0
ad_ip_parameter sys_ps7 CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ 50.0
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_EMIO_GPIO_IO 18
ad_ip_parameter sys_ps7 CONFIG.PCW_SPI1_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_I2C0_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_UART1_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_UART1_UART1_IO {MIO 12 .. 13}
ad_ip_parameter sys_ps7 CONFIG.PCW_I2C1_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_QSPI_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_SD0_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_SPI0_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_SPI0_SPI0_IO EMIO
ad_ip_parameter sys_ps7 CONFIG.PCW_TTC0_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_USE_FABRIC_INTERRUPT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_USB0_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_MIO_GPIO_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_MIO_GPIO_IO MIO
ad_ip_parameter sys_ps7 CONFIG.PCW_USB0_RESET_IO {MIO 52}
ad_ip_parameter sys_ps7 CONFIG.PCW_USB0_RESET_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_IRQ_F2P_INTR 1
ad_ip_parameter sys_ps7 CONFIG.PCW_IRQ_F2P_MODE REVERSE
ad_ip_parameter sys_ps7 CONFIG.PCW_MIO_0_PULLUP {enabled}
ad_ip_parameter sys_ps7 CONFIG.PCW_MIO_9_PULLUP {enabled}
ad_ip_parameter sys_ps7 CONFIG.PCW_MIO_10_PULLUP {enabled}
ad_ip_parameter sys_ps7 CONFIG.PCW_MIO_11_PULLUP {enabled}
ad_ip_parameter sys_ps7 CONFIG.PCW_MIO_48_PULLUP {enabled}
ad_ip_parameter sys_ps7 CONFIG.PCW_MIO_49_PULLUP {disabled}
ad_ip_parameter sys_ps7 CONFIG.PCW_MIO_53_PULLUP {enabled}

# DDR MT41K256M16 HA-125 (32M, 16bit, 8banks)

ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41K256M16 RE-125}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {16 Bit}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_USE_INTERNAL_VREF 0
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL 1
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 0.048
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 0.050
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 0.241
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 0.240

ad_ip_instance xlconcat sys_concat_intc
ad_ip_parameter sys_concat_intc CONFIG.NUM_PORTS 16

ad_ip_instance proc_sys_reset sys_rstgen
ad_ip_parameter sys_rstgen CONFIG.C_EXT_RST_WIDTH 1

# system reset/clock definitions

# add external spi

ad_ip_instance axi_quad_spi axi_spi
ad_ip_parameter axi_spi CONFIG.C_USE_STARTUP 0
ad_ip_parameter axi_spi CONFIG.C_NUM_SS_BITS 1
ad_ip_parameter axi_spi CONFIG.C_SCK_RATIO 8

ad_connect  sys_cpu_clk sys_ps7/FCLK_CLK0
ad_connect  sys_200m_clk sys_ps7/FCLK_CLK1
ad_connect  sys_50m_clk sys_ps7/FCLK_CLK2
ad_connect  sys_cpu_reset sys_rstgen/peripheral_reset
ad_connect  sys_cpu_resetn sys_rstgen/peripheral_aresetn
ad_connect  sys_cpu_clk sys_rstgen/slowest_sync_clk
ad_connect  sys_rstgen/ext_reset_in sys_ps7/FCLK_RESET0_N

# 50 MHz reset generator for AES
ad_ip_instance proc_sys_reset sys_rstgen_50m
ad_ip_parameter sys_rstgen_50m CONFIG.C_EXT_RST_WIDTH 1
ad_connect sys_50m_clk sys_rstgen_50m/slowest_sync_clk
ad_connect sys_rstgen_50m/ext_reset_in sys_ps7/FCLK_RESET2_N
ad_connect sys_50m_resetn sys_rstgen_50m/peripheral_aresetn

# interface connections

ad_connect  ddr sys_ps7/DDR
ad_connect  gpio_i sys_ps7/GPIO_I
ad_connect  gpio_o sys_ps7/GPIO_O
ad_connect  gpio_t sys_ps7/GPIO_T
ad_connect  fixed_io sys_ps7/FIXED_IO

# ps7 spi connections

ad_connect  spi0_csn_2_o sys_ps7/SPI0_SS2_O
ad_connect  spi0_csn_1_o sys_ps7/SPI0_SS1_O
ad_connect  spi0_csn_0_o sys_ps7/SPI0_SS_O
ad_connect  spi0_csn_i sys_ps7/SPI0_SS_I
ad_connect  spi0_clk_i sys_ps7/SPI0_SCLK_I
ad_connect  spi0_clk_o sys_ps7/SPI0_SCLK_O
ad_connect  spi0_sdo_i sys_ps7/SPI0_MOSI_I
ad_connect  spi0_sdo_o sys_ps7/SPI0_MOSI_O
ad_connect  spi0_sdi_i sys_ps7/SPI0_MISO_I

# axi spi connections

ad_connect  sys_cpu_clk  axi_spi/ext_spi_clk
ad_connect  spi_csn_i  axi_spi/ss_i
ad_connect  spi_csn_o  axi_spi/ss_o
ad_connect  spi_clk_i  axi_spi/sck_i
ad_connect  spi_clk_o  axi_spi/sck_o
ad_connect  spi_sdo_i  axi_spi/io0_i
ad_connect  spi_sdo_o  axi_spi/io0_o
ad_connect  spi_sdi_i  axi_spi/io1_i

# interrupts

ad_connect  sys_concat_intc/dout sys_ps7/IRQ_F2P
ad_connect  sys_concat_intc/In15 GND
ad_connect  sys_concat_intc/In14 GND
ad_connect  sys_concat_intc/In13 GND
ad_connect  sys_concat_intc/In12 GND
ad_connect  sys_concat_intc/In11 GND
ad_connect  sys_concat_intc/In10 GND
ad_connect  sys_concat_intc/In9 GND
ad_connect  sys_concat_intc/In8 GND
ad_connect  sys_concat_intc/In7 GND
ad_connect  sys_concat_intc/In6 GND
ad_connect  sys_concat_intc/In5 GND
ad_connect  sys_concat_intc/In4 GND
ad_connect  sys_concat_intc/In3 GND
ad_connect  sys_concat_intc/In2 GND
ad_connect  sys_concat_intc/In1 GND
ad_connect  sys_concat_intc/In0 GND

# iic

create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 iic_main

ad_ip_instance axi_iic axi_iic_main

ad_connect  iic_main axi_iic_main/iic
ad_cpu_interconnect 0x41600000 axi_iic_main
ad_cpu_interrupt ps-15 mb-15 axi_iic_main/iic2intc_irpt

# ad9361

create_bd_port -dir I rx_clk_in
create_bd_port -dir I rx_frame_in
create_bd_port -dir I -from 11 -to 0 rx_data_in

create_bd_port -dir O tx_clk_out
create_bd_port -dir O tx_frame_out
create_bd_port -dir O -from 11 -to 0 tx_data_out

create_bd_port -dir O enable
create_bd_port -dir O txnrx
create_bd_port -dir I up_enable
create_bd_port -dir I up_txnrx

# ad9361 core(s)

ad_ip_instance axi_ad9361 axi_ad9361
ad_ip_parameter axi_ad9361 CONFIG.ID 0
ad_ip_parameter axi_ad9361 CONFIG.CMOS_OR_LVDS_N 1
ad_ip_parameter axi_ad9361 CONFIG.MODE_1R1T 1
ad_ip_parameter axi_ad9361 CONFIG.ADC_INIT_DELAY 21

# disable DDS to save some DSP blocks and some luts as it prob won't be used in the final design
ad_ip_parameter axi_ad9361 CONFIG.DAC_DDS_DISABLE 1 

ad_ip_instance axi_dmac axi_ad9361_dac_dma
ad_ip_parameter axi_ad9361_dac_dma CONFIG.DMA_TYPE_SRC 0
ad_ip_parameter axi_ad9361_dac_dma CONFIG.DMA_TYPE_DEST 1
ad_ip_parameter axi_ad9361_dac_dma CONFIG.CYCLIC 1
ad_ip_parameter axi_ad9361_dac_dma CONFIG.SYNC_TRANSFER_START 1
ad_ip_parameter axi_ad9361_dac_dma CONFIG.AXI_SLICE_SRC 0
ad_ip_parameter axi_ad9361_dac_dma CONFIG.AXI_SLICE_DEST 0
ad_ip_parameter axi_ad9361_dac_dma CONFIG.DMA_2D_TRANSFER 0
ad_ip_parameter axi_ad9361_dac_dma CONFIG.DMA_DATA_WIDTH_DEST 64

ad_ip_instance axi_dmac axi_ad9361_adc_dma
ad_ip_parameter axi_ad9361_adc_dma CONFIG.DMA_TYPE_SRC 2
ad_ip_parameter axi_ad9361_adc_dma CONFIG.DMA_TYPE_DEST 0
ad_ip_parameter axi_ad9361_adc_dma CONFIG.CYCLIC 0
ad_ip_parameter axi_ad9361_adc_dma CONFIG.SYNC_TRANSFER_START 1
ad_ip_parameter axi_ad9361_adc_dma CONFIG.AXI_SLICE_SRC 0
ad_ip_parameter axi_ad9361_adc_dma CONFIG.AXI_SLICE_DEST 0
ad_ip_parameter axi_ad9361_adc_dma CONFIG.DMA_2D_TRANSFER 0
ad_ip_parameter axi_ad9361_adc_dma CONFIG.DMA_DATA_WIDTH_SRC 64

# pack/unpack utilities for direct AD9361 connection
ad_ip_instance util_upack2 tx_upack
ad_ip_instance util_cpack2 rx_cpack

# connections

ad_connect  rx_clk_in axi_ad9361/rx_clk_in
ad_connect  rx_frame_in axi_ad9361/rx_frame_in
ad_connect  rx_data_in axi_ad9361/rx_data_in
ad_connect  tx_clk_out axi_ad9361/tx_clk_out
ad_connect  tx_frame_out axi_ad9361/tx_frame_out
ad_connect  tx_data_out axi_ad9361/tx_data_out
ad_connect  enable axi_ad9361/enable
ad_connect  txnrx axi_ad9361/txnrx
ad_connect  up_enable axi_ad9361/up_enable
ad_connect  up_txnrx axi_ad9361/up_txnrx

ad_connect  axi_ad9361/tdd_sync GND
ad_connect  sys_200m_clk axi_ad9361/delay_clk
ad_connect  axi_ad9361/l_clk axi_ad9361/clk

# RX path - AD9361 (l_clk domain) → CDC → RRC filter (sys_cpu_clk) → cpack → DMA
#
# The AD9361 in CMOS 1R1T DDR mode runs l_clk at the sample rate (~2.4 MHz),
# leaving only 1 FPGA clock cycle per sample. A 65-tap systolic FIR would need
# ~9 cycles per sample, so the filter runs at sys_cpu_clk (100 MHz, ratio ≈ 41.7)
# and an AXI-Stream clock converter bridges the two domains. rx_cpack and the ADC
# DMA write path also move to sys_cpu_clk to stay in the same domain as the filter.

# --- active-low reset in l_clk domain (for CDC slave aresetn) ---
ad_ip_instance util_vector_logic rx_rst_inv [list C_OPERATION {not} C_SIZE 1]
ad_connect rx_rst_inv/Op1 axi_ad9361/rst

# --- pack {Q[15:0], I[15:0]} → 32-bit AXI-stream word (combinational) ---
ad_ip_instance xlconcat rx_iq_concat [list NUM_PORTS 2 IN0_WIDTH 16 IN1_WIDTH 16]
ad_connect axi_ad9361/adc_data_i0 rx_iq_concat/In0
ad_connect axi_ad9361/adc_data_q0 rx_iq_concat/In1

# --- AXI-Stream clock converter: l_clk → sys_cpu_clk ---
# FIFO depth 32 is ample (sys_cpu_clk drains ~18× faster than l_clk produces).
ad_ip_instance axis_clock_converter rx_adc_cdc [list TDATA_NUM_BYTES 4]
ad_connect axi_ad9361/l_clk    rx_adc_cdc/s_axis_aclk
ad_connect rx_rst_inv/Res      rx_adc_cdc/s_axis_aresetn
ad_connect sys_cpu_clk         rx_adc_cdc/m_axis_aclk
ad_connect sys_cpu_resetn      rx_adc_cdc/m_axis_aresetn
ad_connect rx_iq_concat/dout   rx_adc_cdc/s_axis_tdata
ad_connect axi_ad9361/adc_valid_i0 rx_adc_cdc/s_axis_tvalid
# s_axis_tready from the CDC is ignored by AD9361 (push-only interface);
# the FIFO never fills because sys_cpu_clk >> l_clk.

# --- RRC FIR filter at sys_cpu_clk ---
# Instantiated directly (not wrapped) so Vivado BD can apply fir_compiler's
# clock-interface constraints; a wrapper IP breaks clock propagation and causes
# "registers with no clocks" timing failures.
# ColumnConfig=4: ceil(33 symmetric taps / 4) = 9 MAC cycles/sample < 41.7 available.
# DSP count: 4 columns × 2 paths = 8 DSP48E1 slices.
ad_ip_instance fir_compiler rx_rrc_fir [list \
  Filter_Type                  Single_Rate \
  Decimation_Rate              1 \
  Interpolation_Rate           1 \
  Number_Paths                 2 \
  Clock_Frequency              100 \
  Sample_Frequency             2.4 \
  RateSpecification            Frequency_Specification \
  CoefficientSource            COE_File \
  Coefficient_File             $ad_hdl_dir/library/util_rrc_fir/coefile_rrc.coe \
  Coefficient_Fractional_Bits  0 \
  Data_Fractional_Bits         15 \
  Coefficient_Sets             1 \
  Coefficient_Sign             Signed \
  Coefficient_Structure        Symmetric \
  Coefficient_Width            16 \
  ColumnConfig                 4 \
  Filter_Architecture          Systolic_Multiply_Accumulate \
  Number_Channels              1 \
  Output_Rounding_Mode         Symmetric_Rounding_to_Zero \
  Output_Width                 16 \
  Quantization                 Integer_Coefficients \
  S_DATA_Has_FIFO              true \
  M_DATA_Has_TREADY            false \
]
ad_connect sys_cpu_clk              rx_rrc_fir/aclk
ad_connect rx_adc_cdc/m_axis_tdata  rx_rrc_fir/s_axis_data_tdata
ad_connect rx_adc_cdc/m_axis_tvalid rx_rrc_fir/s_axis_data_tvalid
ad_connect rx_rrc_fir/s_axis_data_tready rx_adc_cdc/m_axis_tready

# --- unpack filtered {Q[15:0], I[15:0]} ---
ad_ip_instance xlslice rx_fir_i_slice [list DIN_WIDTH 32 DIN_FROM 15 DIN_TO 0]
ad_ip_instance xlslice rx_fir_q_slice [list DIN_WIDTH 32 DIN_FROM 31 DIN_TO 16]
ad_connect rx_rrc_fir/m_axis_data_tdata rx_fir_i_slice/Din
ad_connect rx_rrc_fir/m_axis_data_tdata rx_fir_q_slice/Din

# --- rx_cpack at sys_cpu_clk ---
# In 1R1T mode channels 2/3 (i1, q1) are never enabled; tie them to ground.
ad_connect sys_cpu_clk  rx_cpack/clk
ad_connect sys_cpu_reset rx_cpack/reset

ad_connect VCC           rx_cpack/enable_0
ad_connect rx_rrc_fir/m_axis_data_tvalid rx_cpack/fifo_wr_en
ad_connect rx_fir_i_slice/Dout rx_cpack/fifo_wr_data_0
ad_connect VCC           rx_cpack/enable_1
ad_connect rx_fir_q_slice/Dout rx_cpack/fifo_wr_data_1
ad_connect GND           rx_cpack/enable_2
ad_connect GND           rx_cpack/fifo_wr_data_2
ad_connect GND           rx_cpack/enable_3
ad_connect GND           rx_cpack/fifo_wr_data_3

ad_connect axi_ad9361_adc_dma/fifo_wr rx_cpack/packed_fifo_wr
# adc_dovf driven from cpack overflow; cpack is now in sys_cpu_clk domain so
# this crosses to l_clk on the AD9361 side — tie off to avoid undriven port.
ad_connect GND axi_ad9361/adc_dovf

# TX path - DMA (sys_cpu_clk) → TX RRC FIR (sys_cpu_clk) → CDC (sys_cpu_clk → l_clk) → upack → AD9361
#
# Mirrors the RX path in reverse.  Moving the DMA m_axis to sys_cpu_clk gives
# the FIR ~41 cycles per sample (100 MHz / 2.4 MHz), the same headroom used on
# the RX side.  A CDC bridges back to l_clk for the AD9361 DAC interface.
#
# The ADI DMAC only exposes m_axis as a complete AXI4-Stream interface (no
# individual signal pins), so the FIR is configured with Number_Paths=4 to
# accept the full 64-bit {Q1[15:0],I1[15:0],Q0[15:0],I0[15:0]} word directly.
# In 1R1T mode I1/Q1 are always zero from the DMA, so their filtered outputs
# are also zero — the 64-bit format is preserved through the filter unchanged
# except for the RRC shaping on the active I0/Q0 channels.
# DSP count: ceil(33/4)=9 MAC stages × 4 paths × 4 columns = 16 DSP48E1.

# --- TX RRC FIR filter at sys_cpu_clk (64-bit, Number_Paths=4) ---
ad_ip_instance fir_compiler tx_rrc_fir [list \
  Filter_Type                  Single_Rate \
  Decimation_Rate              1 \
  Interpolation_Rate           1 \
  Number_Paths                 4 \
  Clock_Frequency              100 \
  Sample_Frequency             2.4 \
  RateSpecification            Frequency_Specification \
  CoefficientSource            COE_File \
  Coefficient_File             $ad_hdl_dir/library/util_rrc_fir/coefile_rrc.coe \
  Coefficient_Fractional_Bits  0 \
  Data_Fractional_Bits         15 \
  Coefficient_Sets             1 \
  Coefficient_Sign             Signed \
  Coefficient_Structure        Symmetric \
  Coefficient_Width            16 \
  ColumnConfig                 4 \
  Filter_Architecture          Systolic_Multiply_Accumulate \
  Number_Channels              1 \
  Output_Rounding_Mode         Symmetric_Rounding_to_Zero \
  Output_Width                 16 \
  Quantization                 Integer_Coefficients \
  S_DATA_Has_FIFO              true \
  M_DATA_Has_TREADY            true \
]
ad_connect sys_cpu_clk                    tx_rrc_fir/aclk
ad_connect axi_ad9361_dac_dma/m_axis      tx_rrc_fir/S_AXIS_DATA

# --- AXI-Stream clock converter: sys_cpu_clk → l_clk (64-bit) ---
ad_ip_instance axis_clock_converter tx_dac_cdc [list TDATA_NUM_BYTES 8]
ad_connect sys_cpu_clk       tx_dac_cdc/s_axis_aclk
ad_connect sys_cpu_resetn    tx_dac_cdc/s_axis_aresetn
ad_connect axi_ad9361/l_clk  tx_dac_cdc/m_axis_aclk
ad_connect rx_rst_inv/Res    tx_dac_cdc/m_axis_aresetn
ad_connect tx_rrc_fir/m_axis_data_tdata   tx_dac_cdc/s_axis_tdata
ad_connect tx_rrc_fir/m_axis_data_tvalid  tx_dac_cdc/s_axis_tvalid
ad_connect tx_dac_cdc/s_axis_tready       tx_rrc_fir/m_axis_data_tready

# --- tx_upack and AD9361 DAC remain at l_clk ---
ad_connect axi_ad9361/l_clk tx_upack/clk
ad_connect axi_ad9361/rst   tx_upack/reset

ad_connect axi_ad9361/dac_enable_i0 tx_upack/enable_0
ad_connect axi_ad9361/dac_valid_i0  tx_upack/fifo_rd_en
ad_connect axi_ad9361/dac_data_i0   tx_upack/fifo_rd_data_0
ad_connect axi_ad9361/dac_enable_q0 tx_upack/enable_1
ad_connect axi_ad9361/dac_data_q0   tx_upack/fifo_rd_data_1
ad_connect axi_ad9361/dac_enable_i1 tx_upack/enable_2
ad_connect axi_ad9361/dac_data_i1   tx_upack/fifo_rd_data_2
ad_connect axi_ad9361/dac_enable_q1 tx_upack/enable_3
ad_connect axi_ad9361/dac_data_q1   tx_upack/fifo_rd_data_3

ad_connect tx_dac_cdc/M_AXIS tx_upack/s_axis
ad_connect tx_upack/fifo_rd_underflow axi_ad9361/dac_dunf

ad_connect sys_cpu_clk axi_ad9361_adc_dma/fifo_wr_clk
ad_connect sys_cpu_clk axi_ad9361_dac_dma/m_axis_aclk

# External TDD
set TDD_CHANNEL_CNT 3
set TDD_DEFAULT_POL 0b110
set TDD_REG_WIDTH 32
set TDD_BURST_WIDTH 32
set TDD_SYNC_WIDTH 0
set TDD_SYNC_INT 0
set TDD_SYNC_EXT 1
set TDD_SYNC_EXT_CDC 1
ad_tdd_gen_create axi_tdd_0 $TDD_CHANNEL_CNT \
                            $TDD_DEFAULT_POL \
                            $TDD_REG_WIDTH \
                            $TDD_BURST_WIDTH \
                            $TDD_SYNC_WIDTH \
                            $TDD_SYNC_INT \
                            $TDD_SYNC_EXT \
                            $TDD_SYNC_EXT_CDC

ad_ip_instance util_vector_logic logic_inv [list \
  C_OPERATION {not} \
  C_SIZE 1]

ad_connect logic_inv/Op1  axi_ad9361/rst
ad_connect logic_inv/Res  axi_tdd_0/resetn
ad_connect axi_ad9361/l_clk axi_tdd_0/clk
ad_connect axi_tdd_0/sync_in tdd_ext_sync
ad_connect axi_tdd_0/tdd_channel_0 txdata_o
# tdd_channel_1 drives adc_dma/sync, which is in sys_cpu_clk domain after the
# cpack/DMA move.  TDD runs on rx_clk (l_clk), so synchronize the signal.
add_files -norecurse $ad_hdl_dir/library/util_cdc/sync_bits.v
create_bd_cell -type module -reference sync_bits tdd_adc_sync_cdc
ad_connect sys_cpu_clk tdd_adc_sync_cdc/out_clk
ad_connect VCC         tdd_adc_sync_cdc/out_resetn
ad_connect axi_tdd_0/tdd_channel_1 tdd_adc_sync_cdc/in_bits
ad_connect tdd_adc_sync_cdc/out_bits axi_ad9361_adc_dma/sync

# tdd_channel_2 → dac_dma/sync: TDD runs on rx_clk (l_clk), but the DAC DMA
# sync port is sampled in the sys_cpu_clk (clk_fpga_0) domain — CDC required.
create_bd_cell -type module -reference sync_bits tdd_dac_sync_cdc
ad_connect sys_cpu_clk tdd_dac_sync_cdc/out_clk
ad_connect VCC         tdd_dac_sync_cdc/out_resetn
ad_connect axi_tdd_0/tdd_channel_2 tdd_dac_sync_cdc/in_bits
ad_connect tdd_dac_sync_cdc/out_bits axi_ad9361_dac_dma/sync

# interconnects

ad_cpu_interconnect 0x79020000 axi_ad9361
ad_cpu_interconnect 0x7C400000 axi_ad9361_adc_dma
ad_cpu_interconnect 0x7C420000 axi_ad9361_dac_dma
ad_cpu_interconnect 0x7C430000 axi_spi
ad_cpu_interconnect 0x7C440000 axi_tdd_0

# AES accelerator on separate GP1 port at 50 MHz
ad_ip_parameter sys_ps7 CONFIG.PCW_USE_M_AXI_GP1 1
ad_ip_instance axi_aes axi_aes_0

# Create AXI Interconnect for GP1 (converts AXI3 to AXI4-Lite)
ad_ip_instance axi_interconnect axi_gp1_interconnect
ad_ip_parameter axi_gp1_interconnect CONFIG.NUM_MI 1

# Connect GP1 to interconnect (AXI3 side)
ad_connect sys_50m_clk sys_ps7/M_AXI_GP1_ACLK
ad_connect sys_ps7/M_AXI_GP1 axi_gp1_interconnect/S00_AXI
ad_connect sys_50m_clk axi_gp1_interconnect/ACLK
ad_connect sys_50m_clk axi_gp1_interconnect/S00_ACLK
ad_connect sys_50m_clk axi_gp1_interconnect/M00_ACLK
ad_connect sys_50m_resetn axi_gp1_interconnect/ARESETN
ad_connect sys_50m_resetn axi_gp1_interconnect/S00_ARESETN
ad_connect sys_50m_resetn axi_gp1_interconnect/M00_ARESETN

# Connect AES to interconnect (AXI4-Lite side)
ad_connect axi_gp1_interconnect/M00_AXI axi_aes_0/s_axi
ad_connect sys_50m_clk axi_aes_0/s_axi_aclk
ad_connect sys_50m_resetn axi_aes_0/s_axi_aresetn

# Address mapping for AES on GP1 (0x80000000 is GP1 base)
create_bd_addr_seg -range 0x10000 -offset 0x80000000 \
                    [get_bd_addr_spaces sys_ps7/Data] \
                    [get_bd_addr_segs axi_aes_0/s_axi/axi_lite] \
                    SEG_axi_aes_0

ad_ip_parameter sys_ps7 CONFIG.PCW_USE_S_AXI_HP1 {1}
ad_connect sys_cpu_clk sys_ps7/S_AXI_HP1_ACLK
ad_connect axi_ad9361_adc_dma/m_dest_axi sys_ps7/S_AXI_HP1

create_bd_addr_seg -range 0x20000000 -offset 0x00000000 \
                    [get_bd_addr_spaces axi_ad9361_adc_dma/m_dest_axi] \
                    [get_bd_addr_segs sys_ps7/S_AXI_HP1/HP1_DDR_LOWOCM] \
                    SEG_sys_ps7_HP1_DDR_LOWOCM

ad_ip_parameter sys_ps7 CONFIG.PCW_USE_S_AXI_HP2 {1}
ad_connect sys_cpu_clk sys_ps7/S_AXI_HP2_ACLK
ad_connect axi_ad9361_dac_dma/m_src_axi sys_ps7/S_AXI_HP2

create_bd_addr_seg -range 0x20000000 -offset 0x00000000 \
                    [get_bd_addr_spaces axi_ad9361_dac_dma/m_src_axi] \
                    [get_bd_addr_segs sys_ps7/S_AXI_HP2/HP2_DDR_LOWOCM] \
                    SEG_sys_ps7_HP2_DDR_LOWOCM

ad_connect sys_cpu_clk axi_ad9361_dac_dma/m_src_axi_aclk
ad_connect sys_cpu_clk axi_ad9361_adc_dma/m_dest_axi_aclk
ad_connect sys_cpu_resetn axi_ad9361_adc_dma/m_dest_axi_aresetn
ad_connect sys_cpu_resetn axi_ad9361_dac_dma/m_src_axi_aresetn

# interrupts

ad_cpu_interrupt ps-13 mb-13 axi_ad9361_adc_dma/irq
ad_cpu_interrupt ps-12 mb-12 axi_ad9361_dac_dma/irq
ad_cpu_interrupt ps-11 mb-11 axi_spi/ip2intc_irpt
ad_cpu_interrupt ps-10 mb-10 axi_aes_0/irq
