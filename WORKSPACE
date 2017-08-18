workspace(name = "com_github_jemdiggity_ble_proj")

load("//:workspace.bzl", "check_version")
# We must check the bazel version before trying to parse any other BUILD files,
# in case the parsing of those build files depends on the bazel version we
# require here.
check_version("0.4.4")

git_repository(
    name = "com_github_jemdiggity_rules_os_dependent_http_archive",
    remote = "https://github.com/jemdiggity/rules_os_dependent_http_archive.git",
    commit = "b1e3ed2fd829dfd1602bc31df4804ff34149f659",
)

load("@com_github_jemdiggity_rules_os_dependent_http_archive//:os_dependent_http_archive.bzl", "os_dependent_http_archive")

git_repository(
    name = "com_github_jemdiggity_rules_hex",
    remote = "https://github.com/jemdiggity/rules_hex.git",
    commit = "3ff46b2e46a247697190911fdf3c17e7110aa22a",
)

# Use skylark rules once https://github.com/bazelbuild/bazel/issues/2700 is resolved.
#load(
#     "@bazel_tools//tools/build_defs/repo:http.bzl",
#     "http_archive",
# )

load(
    "@bazel_tools//tools/build_defs/repo:git.bzl",
    "git_repository",
    "new_git_repository",
)

os_dependent_http_archive(
  name = "toolchain_gcc_arm_none",
  build_file = "//:compilers/gcc_arm_none.BUILD",
  strip_prefix = 'gcc-arm-none-eabi-4_9-2015q3',
  urls = {
    "linux" : ["https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2"],
    "darwin" : ['https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-mac.tar.bz2'],
  },
  sha256 = {
    "linux" : "c50078bfbd29e6c15615900e746f4d0acde917338e55860b0f145f57387c12ab",
    "darwin" : "a6353db31face60c2091c2c84c902fc4d566decd1aa04884cd822c383d13c9fa",
  },
)

new_http_archive(
  name = "nrf5_sdk",
  build_file = "//:third_party/nrf5_sdk.BUILD",
  urls = ["https://github.com/jemdiggity/nrf5_sdk/archive/v13.1.0.tar.gz"],
  sha256 = "aa71700e06c996c60ca2a6fd4aeffc4f442afff8202d44fe3d92ddd1646b0a49",
  strip_prefix = "nrf5_sdk-13.1.0/sdk",
)

new_git_repository(
  name = "micro_ecc",
  build_file = "//:third_party/micro_ecc.BUILD",
  remote = "https://github.com/kmackay/micro-ecc.git",
  commit = "601bd11062c551b108adbb43ba99f199b840777c",
)

new_http_archive(
  name = "mbed",
  build_file = "//:third_party/mbed-os.BUILD",
  urls = ["https://github.com/ARMmbed/mbed-os/archive/mbed-os-5.4.1.tar.gz"],
  sha256 = "9b620c511d6c2e039baa8c7330867e2a593ae43412a8cfca6350ef29a10ab2e8",
  strip_prefix = "mbed-os-mbed-os-5.4.1"
)
