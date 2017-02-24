load("//:workspace.bzl", "check_version")
# We must check the bazel version before trying to parse any other BUILD files,
# in case the parsing of those build files depends on the bazel version we
# require here.
check_version("0.4.4")

new_http_archive(
  name = 'toolchain_gcc_arm_none_darwin',
  build_file = 'compilers/gcc_arm_none.BUILD',
  urls = ['https://launchpad.net/gcc-arm-embedded/5.0/5-2016-q3-update/+download/gcc-arm-none-eabi-5_4-2016q3-20160926-mac.tar.bz2'],
  sha256 = "5656cdec40f99d5c054a85bbc694276e1c4a1488cdacbbc448bc6acd3bbe070d",
  strip_prefix = 'gcc-arm-none-eabi-5_4-2016q3',
)

new_http_archive(
  name = "nrf5_sdk",
  build_file = "third_party/nrf5_sdk.BUILD",
  urls = ["https://github.com/jemdiggity/vendor_nrf5_sdk/archive/vendor-10.0.0.tar.gz"],
  sha256 = "4b386cd455f18a8bc6d8045b5e9fb9fc6dd86ad6cf9a97d9008ae717909d943c",
  strip_prefix = "vendor_nrf5_sdk-vendor-10.0.0/sdk",
)

