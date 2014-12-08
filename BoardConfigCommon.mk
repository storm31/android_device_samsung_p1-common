#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# BoardConfigCommon.mk
#
# Product-specific compile-time definitions.
#

# Set this up here so that BoardVendorConfig.mk can override it
BOARD_USES_GENERIC_AUDIO := false

BOARD_USES_LIBSECRIL_STUB := true

# ARMv7-A Cortex-A8 architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a8
TARGET_CPU_VARIANT := cortex-a8

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_PLATFORM := s5pc110
TARGET_BOARD_PLATFORM_GPU := POWERVR_SGX540_120
TARGET_BOOTLOADER_BOARD_NAME := s5pc110

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/p1-common/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/p1-common/libbt_vndcfg.txt

# WiFi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WLAN_DEVICE_REV       := bcm4329
WIFI_DRIVER_MODULE_NAME     := "bcmdhd"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

USE_CAMERA_STUB := false
ifeq ($(USE_CAMERA_STUB),false)
BOARD_CAMERA_LIBRARIES := libcamera
endif
BOARD_V4L2_DEVICE := /dev/video1
BOARD_CAMERA_DEVICE := /dev/video0
BOARD_SECOND_CAMERA_DEVICE := /dev/video2
BOARD_CAMERA_HAVE_ISO := true

# OpenGL stuff
BOARD_EGL_CFG := device/samsung/p1-common/prebuilt/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true

# SkTextBox for libtvout
BOARD_USES_SKTEXTBOX := true

# Device related defines
BOARD_NAND_PAGE_SIZE := 4096
BOARD_NAND_SPARE_SIZE := 128
BOARD_KERNEL_BASE := 0x32000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := console=ttyFIQ0,115200 init=/init no_console_suspend

BOARD_BOOTIMAGE_PARTITION_SIZE := 7864320
BOARD_FLASH_BLOCK_SIZE := 4096

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/p1-common

# Samsung EMMC brick bug
# Already disabled in kernel, but disable again for safety
BOARD_SUPPRESS_EMMC_WIPE := true

# Boot Animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := false
TARGET_BOOTANIMATION_USE_RGB565 := true

# TARGET_DISABLE_TRIPLE_BUFFERING can be used to disable triple buffering
# on per target basis. On crespo it is possible to do so in theory
# to save memory, however, there are currently some limitations in the
# OpenGL ES driver that in conjunction with disable triple-buffering
# would hurt performance significantly (see b/6016711)
TARGET_DISABLE_TRIPLE_BUFFERING := false

BOARD_ALLOW_EGL_HIBERNATION := true

# hwcomposer: custom vsync ioctl
BOARD_CUSTOM_VSYNC_IOCTL := true

# Hardware tunables
BOARD_HARDWARE_CLASS := device/samsung/p1-common/cmhw/

# Dalvik startup with a low memory footprint
TARGET_ARCH_LOWMEM := true

# TWRP
DEVICE_RESOLUTION := 1024x600
BOARD_USES_BML_OVER_MTD := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /cache/.startrecovery; sync;"
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TW_NO_REBOOT_BOOTLOADER := true
TW_INCLUDE_INJECTTWRP := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
BOARD_HAS_FLIPPED_SCREEN := true
RECOVERY_TOUCHSCREEN_FLIP_Y := true
RECOVERY_TOUCHSCREEN_FLIP_X := true
TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_MAX_BRIGHTNESS := 255
TW_BRIGHTNESS_PATH := /sys/devices/platform/s3cfb/cmc623_pwm_bl/backlight/s5p_bl/brightness

# Screenrecord
BOARD_SCREENRECORD_LANDSCAPE_ONLY := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/p1-common/sepolicy

BOARD_SEPOLICY_UNION += \
    device.te \
    domain.te \
    file_contexts \
    mediaserver.te \
    property_contexts \
    pvrsrvinit.te \
    rild.te \
    tvouthack.te \
    tvoutserver.te

TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# Required for TV out
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
