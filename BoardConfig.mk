# Primary Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
ifneq (,$(wildcard $(LOCAL_PATH)/../../../bionic/libc/arch-arm64/cortex-a57))
TARGET_CPU_VARIANT := cortex-a57
else
TARGET_CPU_VARIANT := cortex-a53
endif
TARGET_CPU_ABI := arm64-v8a

# Secondary Arch
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
ifneq (,$(wildcard $(LOCAL_PATH)/../../../bionic/libc/arch-arm/cortex-a57))
TARGET_2ND_CPU_VARIANT := cortex-a57
else
TARGET_2ND_CPU_VARIANT := cortex-a53
endif
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi

TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_32_BIT_APPS := true
TARGET_SUPPORTS_64_BIT_APPS := true

TARGET_BOARD_PLATFORM := db410c
ANDROID_64=true
WITH_DEXPREOPT ?= true
USE_OPENGL_RENDERER := true
BIONIC_TESTS ?= true

# generic wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
CONFIG_DRIVER_NL80211 := y
CONFIG_DRIVER_WEXT := y

# Some framework code requires this to enable BT
# For now:
BOARD_HAVE_BLUETOOTH := false

BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 debug earlyprintk=serial,0x16640000,115200 verbose androidboot.selinux=permissive androidboot.hardware=db410c user_debug=31

# Kernel
TARGET_KERNEL_SOURCE ?= kernel/linaro/qcom
KERNEL_CONFIG = arch/arm64/configs/defconfig kernel/configs/distro.config kernel/configs/android.config
DEVICE_TREES := msm8916-mtp:msm8916-mtp.dtb apq8016-sbc:apq8016-sbc.dtb
BUILD_KERNEL_MODULES ?= true

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := true
TARGET_USE_XLOADER := false
TARGET_USE_UBOOT := false
TARGET_HARDWARE_3D := true
TARGET_SHELL := ash
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := false
USE_CAMERA_STUB := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 880803840
BOARD_USERDATAIMAGE_PARTITION_SIZE := 576716800
BOARD_CACHEIMAGE_PARTITION_SIZE := 69206016
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

BOARD_USES_DRM_HWCOMPOSER := true
BOARD_GPU_DRIVERS := freedreno

BOARD_SEPOLICY_DIRS += device/rosterloh/db410c/sepolicy

# Applies only to AOSP master build for db410c where it needs prebuilt STLPORT
INCLUDE_STLPORT_FOR_MASTER := true