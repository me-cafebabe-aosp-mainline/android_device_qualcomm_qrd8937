#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/qualcomm/qrd8937

# Inherit from mainline/qcom-common
$(call inherit-product, device/mainline/qcom-common/mainline_qcom-common.mk)

# AAPT
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
TARGET_AUDIO_MAINLINE_UCM_PROFILES := qcom-msm8937-qrd

# Bootanimation
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Disable
TARGET_SUPPORTS_SUSPEND ?= false

# Dynamic partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Init
PRODUCT_PACKAGES += \
    fstab.qrd8937 \
    fstab.qrd8937.ramdisk \
    init.qrd8937.rc \
    ueventd.qrd8937.rc

PRODUCT_PACKAGES += \
    use_memfd.rc \
    zram.rc

$(call soong_config_set,mainline_common_libinit,set_properties_from,devicetree)

# Kernel
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

PRODUCT_PACKAGES += \
    modules.load.normal

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlays/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# Scoped Storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Shipping API level
TARGET_FOLLOWS_LATEST_SHIPPING_API_LEVEL := true

# SoC
TARGET_QCOM_SOC_FAMILY := msm8937

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH) \
    kernel/mainline/configs

# VINTF
TARGET_FOLLOWS_LATEST_VINTF_TARGET_LEVEL := true
