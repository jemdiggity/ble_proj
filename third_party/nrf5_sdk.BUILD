load("@com_github_jemdiggity_rules_hex//:hex.bzl", "hex")

includes = [
    "components",
    "components/ble/common",
    "components/boards",
    "components/device",
    "components/drivers_nrf/clock",
    "components/drivers_nrf/common",
    "components/drivers_nrf/delay",
    "components/drivers_nrf/hal",
    "components/drivers_nrf/rng",
    "components/libraries/bootloader",
    "components/libraries/bootloader/ble_dfu",
    "components/libraries/bootloader/dfu",
    "components/libraries/crc32",
    "components/libraries/crypto",
    "components/libraries/ecc",
    "components/libraries/experimental_section_vars",
    "components/libraries/fstorage",
    "components/libraries/hci",
    "components/libraries/log",
    "components/libraries/log/src",
    "components/libraries/queue",
    "components/libraries/scheduler",
    "components/libraries/sha256",
    "components/libraries/svc",
    "components/libraries/timer",
    "components/libraries/util",
    "components/softdevice/common/softdevice_handler",
    "components/toolchain",
    "components/toolchain/cmsis/include",
    "components/toolchain/gcc",
    "examples/dfu/bootloader_secure",
    "examples/dfu/bootloader_secure/../../bsp",
    "examples/dfu/bootloader_secure/config",
    "external/micro-ecc/micro-ecc",
    "external/nano-pb",
]

includes_nrf51 = includes + [
        "components/softdevice/s130/headers",
        "components/softdevice/s130/headers/nrf51",
        "examples/dfu/bootloader_secure/config/secure_dfu_secure_dfu_ble_s130_pca10028",
        "examples/dfu/bootloader_secure/pca10028/config",
    ]

includes_nrf52 = includes + [
        "components/softdevice/s132/headers",
        "components/softdevice/s132/headers/nrf52",
        "examples/dfu/bootloader_secure/config/secure_dfu_secure_dfu_ble_s132_pca10040",
        "examples/dfu/bootloader_secure/pca10040/config",
    ]

defines = [
    "SWI_DISABLE0",
    "SOFTDEVICE_PRESENT",
    "NRF_DFU_SETTINGS_VERSION=1",
    "__HEAP_SIZE=0",
    "SVC_INTERFACE_CALL_AS_NORMAL_FUNCTION",
    "BLE_STACK_SUPPORT_REQD",
    #fixme HACK how to generate keys..?
    "NRF_DFU_DEBUG_VERSION",
]

defines_nrf51 = defines + [
    "NRF_SD_BLE_API_VERSION=2",
    "BOARD_PCA10028",
    "NRF51",
    "S130",
    "NRF51422",
]

defines_nrf52 = defines + [
    "NRF_SD_BLE_API_VERSION=3",
    "BOARD_PCA10040",
    "NRF52",
    "S132",
    "NRF52832",
    "NRF52_PAN_36",
    "NRF52_PAN_12",
    "NRF52_PAN_15",
    "NRF52_PAN_58",
    "NRF52_PAN_55",
    "NRF52_PAN_54",
    "NRF52_PAN_31",
    "NRF52_PAN_51",
    "CONFIG_GPIO_AS_PINRESET",
    "NRF52_PAN_20",
    "NRF52_PAN_64",
]

copts = [
    "-mthumb",
    "-mabi=aapcs",
    "-std=c99",
    "-fno-builtin",
    "--short-enums",
    "-flto",
]

srcs = [
        "components/libraries/util/app_error_weak.c",
        "components/libraries/scheduler/app_scheduler.c",
        "components/libraries/timer/app_timer.c",
        "components/libraries/timer/app_timer_appsh.c",
        "components/libraries/util/app_util_platform.c",
        "components/libraries/crc32/crc32.c",
        "components/libraries/ecc/ecc.c",
        "components/libraries/fstorage/fstorage.c",
        "components/libraries/hci/hci_mem_pool.c",
        "components/libraries/util/nrf_assert.c",
        "components/libraries/crypto/nrf_crypto.c",
        "components/libraries/queue/nrf_queue.c",
        "components/libraries/util/sdk_errors.c",
        "components/libraries/sha256/sha256.c",
        "external/nano-pb/pb_common.c",
        "external/nano-pb/pb_decode.c",
        "components/boards/boards.c",
        "components/drivers_nrf/common/nrf_drv_common.c",
        "components/drivers_nrf/rng/nrf_drv_rng.c",
        "components/drivers_nrf/hal/nrf_nvmc.c",
        "components/libraries/bootloader/ble_dfu/nrf_ble_dfu.c",
        "examples/dfu/bootloader_secure/dfu-cc.pb.c",
        "examples/dfu/bootloader_secure/dfu_public_key.c",
        "examples/dfu/bootloader_secure/dfu_req_handling.c",
        "examples/dfu/bootloader_secure/main.c",
        "components/ble/common/ble_advdata.c",
        "components/ble/common/ble_conn_params.c",
        "components/ble/common/ble_srv_common.c",
        "components/softdevice/common/softdevice_handler/softdevice_handler.c",
        "components/softdevice/common/softdevice_handler/softdevice_handler_appsh.c",
        "components/libraries/bootloader/nrf_bootloader.c",
        "components/libraries/bootloader/nrf_bootloader_app_start.c",
        "components/libraries/bootloader/nrf_bootloader_info.c",
        "components/libraries/bootloader/dfu/nrf_dfu.c",
        "components/libraries/bootloader/dfu/nrf_dfu_flash.c",
        "components/libraries/bootloader/dfu/nrf_dfu_mbr.c",
        "components/libraries/bootloader/dfu/nrf_dfu_settings.c",
        "components/libraries/bootloader/dfu/nrf_dfu_transport.c",
        "components/libraries/bootloader/dfu/nrf_dfu_utils.c",
    ]


cc_binary(
    name = "examples_dfu_bootloader_secure_dfu_secure_dfu_ble_s130_pca10028",
    srcs = srcs + [
        "components/toolchain/gcc/gcc_startup_nrf51.S",
        "components/toolchain/system_nrf51.c",
        ] + glob(["**/*.h"]),
    copts = copts + [
        "-mcpu=cortex-m0",
        "-mfloat-abi=soft",
        ] +
        ["-D%s" % i for i in defines_nrf51] +
        ["-Iexternal/nrf5_sdk/%s" % i for i in includes_nrf51],

    linkopts = [
        # "-Xlinker -Map=output.map",
        "-mthumb",
        "-mabi=aapcs",
        "-Lexternal/nrf5_sdk/examples/dfu/bootloader_secure",
        "-Lexternal/nrf5_sdk/components/toolchain/gcc",
        "-Lexternal/toolchain_gcc_arm_none/arm-none-eabi/lib",
        "-Tsecure_dfu_gcc_nrf51.ld",
        "-mcpu=cortex-m0",
        # use newlib in nano version
        "--specs=nano.specs",
        "-lnosys",
    ],
    deps = [
        "components/toolchain/gcc/nrf51_common.ld",
        "examples/dfu/bootloader_secure/secure_dfu_gcc_nrf51.ld",
        "@micro_ecc//:micro_ecc_nrf51",
    ],
)

hex(
    name = "examples_dfu_bootloader_secure_dfu_secure_dfu_ble_s130_pca10028_hex",
    src = "examples_dfu_bootloader_secure_dfu_secure_dfu_ble_s130_pca10028",
)

cc_binary(
    name = "examples_dfu_bootloader_secure_dfu_secure_dfu_ble_s132_pca10040",
    srcs = srcs + [
        "components/toolchain/gcc/gcc_startup_nrf52.S",
        "components/toolchain/system_nrf52.c",
    ] + glob(["**/*.h"]),
    copts = copts + [
        "-mcpu=cortex-m4",
        "-mfloat-abi=hard",
        "-mfpu=fpv4-sp-d16",
        ] +
        ["-D%s" % i for i in defines_nrf52] +
        ["-Iexternal/nrf5_sdk/%s" % i for i in includes_nrf52],
    linkopts = [
        # "-Xlinker -Map=output.map",
        "-mthumb",
        "-mabi=aapcs",
        "-Lexternal/nrf5_sdk/examples/dfu/bootloader_secure",
        "-Lexternal/nrf5_sdk/components/toolchain/gcc",
        "-Lexternal/toolchain_gcc_arm_none/arm-none-eabi/lib/armv7e-m/fpu",
        "-Tsecure_dfu_gcc_nrf52.ld",
        "-mcpu=cortex-m4",
        "-mfloat-abi=hard",
        "-mfpu=fpv4-sp-d16",
        # use newlib in nano version
        "--specs=nano.specs",
        "-lnosys",
    ],
    deps = [
        "components/toolchain/gcc/nrf52_common.ld",
        "examples/dfu/bootloader_secure/secure_dfu_gcc_nrf52.ld",
        "@micro_ecc//:micro_ecc_nrf52",
    ],
)

hex(
    name = "examples_dfu_bootloader_secure_dfu_secure_dfu_ble_s132_pca10040_hex",
    src = "examples_dfu_bootloader_secure_dfu_secure_dfu_ble_s132_pca10040",
)