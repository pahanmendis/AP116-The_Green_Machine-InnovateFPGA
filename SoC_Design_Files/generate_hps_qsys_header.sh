#!/bin/sh

# If sopc-create-header-files is not found, then it is probably because you don't have it in your path
# Do PATH=/cygdrive/c/intelFPGA_lite/16.1/quartus/sopc_builder/bin:$PATH

sopc-create-header-files \
"./soc_system.sopcinfo" \
--single hps_0.h \
--module hps_0
