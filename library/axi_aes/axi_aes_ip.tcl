###############################################################################
## Copyright (C) 2024 - Custom AES Accelerator
### SPDX short identifier: ADIBSD
###############################################################################

# ip
source ../../scripts/adi_env.tcl
source $ad_hdl_dir/library/scripts/adi_ip_xilinx.tcl

adi_ip_create axi_aes
adi_ip_files axi_aes [list \
  "$ad_hdl_dir/library/common/up_axi.v" \
  "$ad_hdl_dir/custom/aes/src/rtl/aes.v" \
  "$ad_hdl_dir/custom/aes/src/rtl/aes_core.v" \
  "$ad_hdl_dir/custom/aes/src/rtl/aes_encipher_block.v" \
  "$ad_hdl_dir/custom/aes/src/rtl/aes_decipher_block.v" \
  "$ad_hdl_dir/custom/aes/src/rtl/aes_key_mem.v" \
  "$ad_hdl_dir/custom/aes/src/rtl/aes_sbox.v" \
  "$ad_hdl_dir/custom/aes/src/rtl/aes_inv_sbox.v" \
  "axi_aes.v" ]

adi_ip_properties axi_aes

set_property driver_value 0 [ipx::get_ports -filter "direction==in" -of_objects [ipx::current_core]]

ipx::infer_bus_interface irq xilinx.com:signal:interrupt_rtl:1.0 [ipx::current_core]

ipx::save_core [ipx::current_core]
