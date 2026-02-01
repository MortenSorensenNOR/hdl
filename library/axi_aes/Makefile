####################################################################################
## Copyright (c) 2024
### SPDX short identifier: BSD-1-Clause
####################################################################################

LIBRARY_NAME := axi_aes

GENERIC_DEPS += ../common/up_axi.v
GENERIC_DEPS += ../../custom/aes/src/rtl/aes.v
GENERIC_DEPS += ../../custom/aes/src/rtl/aes_core.v
GENERIC_DEPS += ../../custom/aes/src/rtl/aes_encipher_block.v
GENERIC_DEPS += ../../custom/aes/src/rtl/aes_decipher_block.v
GENERIC_DEPS += ../../custom/aes/src/rtl/aes_key_mem.v
GENERIC_DEPS += ../../custom/aes/src/rtl/aes_sbox.v
GENERIC_DEPS += ../../custom/aes/src/rtl/aes_inv_sbox.v
GENERIC_DEPS += axi_aes.v

XILINX_DEPS += axi_aes_ip.tcl

include ../scripts/library.mk
