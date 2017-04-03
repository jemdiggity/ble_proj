#!/usr/bin/env bash

set -e

bazel build \
  --crosstool_top=tools/arm_compiler:toolchain \
  --cpu=armeabi-v7a \
  --compilation_mode=opt \
  --verbose_failures \
  --spawn_strategy=standalone \
  --conlyopt="-std=gnu99" \
  --cxxopt="-std=gnu++11" \
  --cxxopt="-fno-rtti" \
  --cxxopt="-Wvla" \
  @mbed//:mbed
