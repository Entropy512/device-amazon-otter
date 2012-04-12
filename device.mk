#
# Copyright (C) 2011 The Android Open-Source Project
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
#

# This file includes all definitions that apply to ALL otter devices, and
# are also specific to otter devices
#
# Everything in this directory will become public

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/amazon/otter/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif



# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Hardware HALs
PRODUCT_PACKAGES += \
    lights.otter \
    libinvensense_mpl \
    hwcomposer.omap4 \
    hwcomposer.default \
    audio.primary.omap4430 \
    audio_policy.default \
    libaudioutils \


# Wifi
PRODUCT_PACKAGES += \
    lib_driver_cmd_wl12xx \
    wlan_loader \
    wlan_cu \
    dhcpcd.conf \
    wpa_supplicant.conf \
    TQS_D_1.7.ini \
    TQS_D_1.7_127x.ini \


# TI-Connectivity
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/etc/firmware/ti-connectivity/wl12xx_wlan_wl1271-fw-r4sp1-multirole-plt.bin:system/etc/firmware/ti-connectivity/wl1271-fw-multirole-plt.bin \
    device/amazon/otter/prebuilt/etc/firmware/ti-connectivity/wl12xx_wlan_wl1271-fw-r4sp1-multirole-roc.bin:system/etc/firmware/ti-connectivity/wl1271-fw-multirole-roc.bin \
    device/amazon/otter/prebuilt/etc/firmware/ti-connectivity/wl12xx_wlan_wl1271-nvs_127x.bin:system/etc/firmware/ti-connectivity/wl1271-nvs.bin \


# Misc
PRODUCT_PACKAGES += \
    Superuser \
    su \
    hwprops \
    evtest \
    librs_jni \
    com.android.future.usb.accessory \
    libjni_pinyinime \
    make_ext4fs \
    setup_fs \
    dhcpcd.conf \
    calibrator


# Root
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/amazon/otter/root/default.prop:/root/default.prop \
    device/amazon/otter/root/init.rc:/root/init.rc \
    device/amazon/otter/root/init.omap4430.rc:/root/init.omap4430.rc \
    device/amazon/otter/root/init.omap4430.usb.rc:/root/init.omap4430.usb.rc \
    device/amazon/otter/root/ueventd.omap4430.rc:/root/ueventd.omap4430.rc \
    device/amazon/otter/root/ueventd.rc:/root/ueventd.rc


# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/etc/permissions/tablet_core_hardware.xml:/system/etc/permissions/tablet_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:/system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:/system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:/system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:/system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml \


# Prebuilts /bin
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/bin/rild:/system/bin/rild \
    device/amazon/otter/prebuilt/bin/strace:/system/bin/strace \
    device/amazon/otter/prebuilt/bin/idme:/system/bin/idme \
    device/amazon/otter/prebuilt/bin/temperature_log.sh:/system/bin/temperature_log.sh \
    device/amazon/otter/prebuilt/bin/battery_log.sh:/system/bin/battery_log.sh \
    device/amazon/otter/prebuilt/bin/klog.sh:/system/bin/klog.sh \


# Prebuilts /system/app
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/app/FileManager.apk:/system/app/FileManager.apk \


# Prebuilts /system/etc
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/etc/gps.conf:/system/etc/gps.conf \
    device/amazon/otter/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml \
    device/amazon/otter/prebuilt/etc/vold.conf:/system/etc/vold.conf \
    device/amazon/otter/prebuilt/etc/vold.fstab:/system/etc/vold.fstab \
    device/amazon/otter/prebuilt/etc/firmware/ducati-m3.bin:/system/etc/firmware/ducati-m3.bin \


# Prebuilt /system/usr
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/usr/idc/ilitek_i2c.idc:/system/usr/idc/ilitek_i2c.idc \
    device/amazon/otter/prebuilt/usr/idc/twl6030_pwrbutton.idc:/system/usr/idc/twl6030_pwrbutton.idc \
    device/amazon/otter/prebuilt/usr/idc/omap-keypad.idc:/system/usr/idc/omap-keypad.idc \
    device/amazon/otter/prebuilt/usr/keychars/qtouch-touchscreen.kcm:/system/usr/keychars/qtouch-touchscreen.kcm \
    device/amazon/otter/prebuilt/usr/keychars/omap-keypad.kcm:/system/usr/keychars/omap-keypad.kcm \
    device/amazon/otter/prebuilt/usr/keylayout/twl6030_pwrbutton.kl:/system/usr/keylayout/twl6030_pwrbutton.kl \
    device/amazon/otter/prebuilt/usr/keylayout/AVRCP.kl:/system/usr/keylayout/AVRCP.kl \
    device/amazon/otter/prebuilt/usr/keylayout/qtouch-touchscreen.kl:/system/usr/keylayout/qtouch-touchscreen.kl \
    device/amazon/otter/prebuilt/usr/keylayout/omap-keypad.kl:/system/usr/keylayout/omap-keypad.kl \


# Prebuilt /system/lib
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/lib/sensors.otter.so:/system/lib/hw/sensors.otter.so \


# Graphics
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/imgtec/gralloc.omap4430.so:/system/vendor/lib/hw/gralloc.omap4430.so \
    device/amazon/otter/prebuilt/imgtec/libEGL_POWERVR_SGX540_120.so:/system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libGLESv1_CM_POWERVR_SGX540_120.so:/system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libGLESv2_POWERVR_SGX540_120.so:/system/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libglslcompiler_SGX540_120.so:/system/vendor/lib/libglslcompiler_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libIMGegl_SGX540_120.so:/system/vendor/lib/libIMGegl_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libpvr2d_SGX540_120.so:/system/vendor/lib/libpvr2d_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libpvrANDROID_WSEGL_SGX540_120.so:/system/vendor/lib/libpvrANDROID_WSEGL_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libPVRScopeServices_SGX540_120.so:/system/vendor/lib/libPVRScopeServices_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libsrv_init_SGX540_120.so:/system/vendor/lib/libsrv_init_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libsrv_um_SGX540_120.so:/system/vendor/lib/libsrv_um_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libusc_SGX540_120.so:/system/vendor/lib/libusc_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/pvrsrvinit_SGX540_120:/system/bin/pvrsrvinit \
    device/amazon/otter/prebuilt/imgtec/pvrsrvctl:/system/bin/pvrsrvctl \
    device/amazon/otter/prebuilt/imgtec/powervr.ini:/system/etc/powervr.ini \


PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=160 \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=48m \
    dalvik.vm.heapsize=128m \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=45 \
    ro.sf.hwrotation=270 \
    ro.opengles.version=131072 \
    persist.lab126.chargeprotect=1


PRODUCT_CHARACTERISTICS := tablet,nosdcard

DEVICE_PACKAGE_OVERLAYS := device/amazon/otter/overlay

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise


# copy all kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell \
    find device/amazon/otter/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')


$(call inherit-product-if-exists, vendor/amazon/otter/otter-vendor.mk)
#$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)
$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)
