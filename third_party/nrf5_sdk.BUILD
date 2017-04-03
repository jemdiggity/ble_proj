cc_binary(
    name = "examples_dfu_bootloader_secure_dfu_secure_dfu_ble_s130_pca10028",
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
        "components/toolchain/gcc/gcc_startup_nrf51.S",
        "components/toolchain/system_nrf51.c",
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
    ] + glob(["**/*.h"]),
    copts = [
        "-mcpu=cortex-m0",
        "-mthumb",
        "-mabi=aapcs",
        "-std=c99",
        "-mfloat-abi=soft",
        "-fno-builtin",
        "--short-enums",
        "-flto",
    ],
    defines = [
        "SWI_DISABLE0",
        "BOARD_PCA10028",
        "SOFTDEVICE_PRESENT",
        "NRF51",
        "NRF_DFU_SETTINGS_VERSION=1",
        "__HEAP_SIZE=0",
        "SVC_INTERFACE_CALL_AS_NORMAL_FUNCTION",
        "S130",
        "BLE_STACK_SUPPORT_REQD",
        "NRF51422",
        "NRF_SD_BLE_API_VERSION=2",
        #fixme HACK how to generate keys..?
        "NRF_DFU_DEBUG_VERSION",
    ],
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
        "components/softdevice/s130/headers",
        "components/softdevice/s130/headers/nrf51",
        "components/toolchain",
        "components/toolchain/cmsis/include",
        "components/toolchain/gcc",
        "examples/dfu/bootloader_secure",
        "examples/dfu/bootloader_secure/../../bsp",
        "examples/dfu/bootloader_secure/config",
        "examples/dfu/bootloader_secure/config/secure_dfu_secure_dfu_ble_s130_pca10028",
        "examples/dfu/bootloader_secure/pca10028/config",
        "external/micro-ecc/micro-ecc",
        "external/nano-pb",
    ],
    linkopts = [
        # "-Xlinker -Map=output.map",
        "-mthumb",
        "-mabi=aapcs",
        "-Lexternal/nrf5_sdk/examples/dfu/bootloader_secure",
        "-Lexternal/nrf5_sdk/components/toolchain/gcc",
        "-Tsecure_dfu_gcc_nrf51.ld",
        "-mcpu=cortex-m0",
        # use newlib in nano version
        "--specs=nano.specs",
        "-lnosys",
    ],
    deps = [
        "components/toolchain/gcc/nrf51_common.ld",
        "examples/dfu/bootloader_secure/secure_dfu_gcc_nrf51.ld",
        "@micro_ecc//:micro_ecc_lib",
    ],
)