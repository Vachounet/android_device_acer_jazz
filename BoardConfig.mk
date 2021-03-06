USE_CAMERA_STUB := false

# inherit from the proprietary version
-include vendor/acer/a4/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm7x30
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
# ARCH_ARM_HAVE_NEON := true
# ARCH_ARM_HAVE_VFP := true
TARGET_BOOTLOADER_BOARD_NAME := jazz

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

TARGET_SPECIFIC_HEADER_PATH := device/acer/a5/include

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_8_X
# WIFI_DRIVER_MODULE_PATH     := /system/wifi/ar6000.ko
WIFI_DRIVER_MODULE_NAME     := ar6000
# BOARD_WIFI_ATH_AR6K			:= true
WIFI_FIRMWARE_LOADER        := "wlan_tool"

BOARD_USES_ADRENO_200 := true

COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DQCOM_HARDWARE
USE_OPENGL_RENDERER := true
TARGET_FORCE_CPU_UPLOAD := true
TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_SF_BYPASS := true
TARGET_HAVE_BYPASS := true
TARGET_USES_OVERLAY := true
TARGET_USES_GENLOCK := true
TARGET_HAVE_HDMI_OUT := true
TARGET_QCOM_HDMI_OUT := true
TARGET_GRALLOC_USES_ASHMEM := true

BOARD_USE_LEGACY_TOUCHSCREEN := true

BOARD_USES_GENERIC_AUDIO := false
# TARGET_PROVIDES_LIBAUDIO := true
BOARD_HAVE_BLUETOOTH     := true
# BOARD_HAVE_BLUETOOTH_ACER:= true
BOARD_VENDOR_USE_AKMD := akm8975
BOARD_EGL_CFG := device/acer/a5/proprietary/egl.cfg

BOARD_VENDOR_QCOM_AMSS_VERSION := 50000
BOARD_USES_QCOM_HARDWARE       := true
BOARD_USES_QCOM_LIBS	       := true
BOARD_USES_QCOM_LIBRPC         := true
BOARD_USES_QCOM_GPS            := true
BOARD_USE_QCOM_PMEM            := true
# BOARD_HAVE_QCOM_FM := true
# BOARD_HAS_QCOM_WLAN := true

BOARD_OVERLAY_MINIFICATION_LIMIT := 2

# BOARD_CAMERA_USE_GETBUFFERINFO := true
# BOARD_OVERLAY_FORMAT_YCbCr_420_SP := true

# Current drivers don't support new EGL config
# BOARD_NO_RGBX_8888 := true

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := jazz
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Use nasty hack to make Kineto work
# BOARD_USE_KINETO_COMPATIBILITY := false

BOARD_HAVE_FM_RADIO := true
# BOARD_FM_DEVICE := si4708
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

#kernel&recovery base
BOARD_KERNEL_CMDLINE := console=null
BOARD_KERNEL_RECOVERY_CMDLINE := $(BOARD_KERNEL_CMDLINE) msmsdcc_power_gpio=88
BOARD_KERNEL_BASE    := 0x20000000

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0c640000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0b900000
BOARD_FLASH_BLOCK_SIZE := 262144

TARGET_PREBUILT_KERNEL := device/acer/a4/kernel

" BOARD_HAS_NO_SELECT_BUTTON := true
# Use this flag if the board has a ext4 partition larger than 2gb
# BOARD_HAS_LARGE_FILESYSTEM := true

BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
# BOARD_EGL_GRALLOC_USAGE_FILTER := true
BOARD_CUSTOM_BLUEDROID := ../../../device/acer/a5/bluedroid/bluetooth.c
BOARD_HAVE_BLUETOOTH_CUSTOM_HCIATTACH := true

BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/vold/179:2
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/vold/179:33
BOARD_MASS_STORAGE_FILE_PATH := "/sys/devices/platform/usb_mass_storage/lun0/file"

BOARD_MOBILEDATA_INTERFACE_NAME := "rmnet0"