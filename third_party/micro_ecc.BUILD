package(default_visibility = ["//visibility:public"])

defines = [
    "uECC_ENABLE_VLI_API",
    "uECC_VLI_NATIVE_LITTLE_ENDIAN=1",
    "uECC_SQUARE_FUNC=1",
    "uECC_SUPPORTS_secp256r1=1",
    "uECC_SUPPORT_COMPRESSED_POINT=0",
    "uECC_OPTIMIZATION_LEVEL=3",
]

cc_library(
    name = "micro_ecc",
    srcs = [
        "uECC.c",
    ] + glob([
        "**/*.inc",
    ]) + glob([
        "**/*.h",
    ]),
    hdrs = ["uECC.h"],
    copts = [
        "-mcpu=cortex-m0",
        "-mthumb",
        "-mabi=aapcs",
        "-std=c99",
        "-mfloat-abi=soft",
        "-fno-builtin",
        "--short-enums",
    ] + ["-D%s" % i for i in defines],
    linkstatic = 1,
)
