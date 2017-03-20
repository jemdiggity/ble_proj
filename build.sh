#!/usr/bin/env bash

set -e

bazel build \
  --crosstool_top=tools/arm_compiler:toolchain \
  --cpu=armeabi-v7a \
  --compilation_mode=opt \
  --verbose_failures \
  --spawn_strategy=standalone \
  @nrf5_sdk//...

bazel-ble_proj/external/toolchain_gcc_arm_none/bin/arm-none-eabi-size \
  bazel-bin/external/nrf5_sdk/examples_dfu_bootloader_secure_dfu_secure_dfu_ble_s130_pca10028


