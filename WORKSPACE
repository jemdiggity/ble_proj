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
  urls = ["https://github.com/jemdiggity/nrf5_sdk/archive/v12.0.0.tar.gz"],
  sha256 = "07610f859c20a936bea65811a97bb455148f9dd256e291d22dc1c2f4711f5369",
  strip_prefix = "nrf5_sdk-12.0.0/sdk",
)

new_git_repository(
  name = "micro_ecc",
  build_file = "third_party/micro_ecc.BUILD",
  remote = "https://github.com/kmackay/micro-ecc.git",
  commit = "14222e062d77f45321676e813d9525f32a88e8fa",
)
