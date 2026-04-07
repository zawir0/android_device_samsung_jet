# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

# Set this up here so that BoardVendorConfig.mk can override it

# Audio
BOARD_USES_GENERIC_AUDIO := false

# Use the non-open-source parts, if they're present
-include vendor/samsung/jet/BoardConfigVendor.mk

# Platform & CPU
TARGET_BOARD_PLATFORM := s3c6410
TARGET_BOOTLOADER_BOARD_NAME := jet
TARGET_CPU_ABI := armeabi-v6j
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_ARCH_VARIANT_CPU := arm1176jzf-s
TARGET_GLOBAL_CFLAGS += -mtune=arm1176jzf-s -mfpu=vfp -mfloat-abi=softfp -O3
TARGET_GLOBAL_CPPFLAGS += -mtune=arm1176jzf-s -mfpu=vfp -mfloat-abi=softfp -O3

# Boot Configuration
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RECOVERY := true
BOARD_CUSTOM_BOOTIMG := false
TARGET_KERNEL_SOURCE := kernel/samsung/jet
TARGET_KERNEL_CONFIG := gt_s8000_defconfig

# Hardware Abstraction (HAL) & Blobs
-include vendor/samsung/jet/BoardConfigVendor.mk
TARGET_PROVIDES_LIBRIL := true
TARGET_PROVIDES_LIBAUDIO := true

# RIL / Modem
#BOARD_USES_LIBSECRIL_STUB := true

# Init & Ramdisk
TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true
BOARD_PROVIDES_BOOTMODE := true

# Storage (vold)
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/s3c-hsotg/gadget/lun0/file

# Partitions (Fake data required to satisfy ICS build system)
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 6291456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 268435456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 234881024
BOARD_FLASH_BLOCK_SIZE := 131072

# Camera
USE_CAMERA_STUB := true
ifeq ($(USE_CAMERA_STUB),false)
BOARD_CAMERA_LIBRARIES := libcamera
endif

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
BOARD_FM_DEVICE := si4709

# Connectivity - Wi-Fi (Using ICS NL80211 standard)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_MODULE_PATH := "/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_STA_PATH := "/system/etc/fw_bcm4325.bin"
WIFI_DRIVER_MODULE_NAME := "bcmdhd"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/fw_bcm4325.bin nvram_path=/system/etc/nvram.txt"

# GPS
#BOARD_GPS_LIBRARIES := libsecgps libsecril-client
#BOARD_USES_GPSSHIM := true
BOARD_HAVE_GPS := false

# 3D / Graphics
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
BOARD_EGL_CFG := device/samsung/jet/egl.cfg
USE_OPENGL_RENDERER := false

# Sensors (Legacy Compatibility)
TARGET_USES_OLD_LIBSENSORS_HAL := true
TARGET_SENSORS_NO_OPEN_CHECK := true

# Dalvik & Performance Tweaks
WITH_DEXPREOPT := true
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
BUILD_WITH_FULL_STAGEFRIGHT := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_NO_MISC_PARTITION := true
