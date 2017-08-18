filegroup(
    name = "srcs",
    srcs = glob(["hello.cc"]),
    visibility = ["//src/test/shell/bazel/testdata:__pkg__"],
)

cc_binary(
    name = "hello",
    srcs = ["hello.cc"],
)
