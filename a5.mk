#
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
#


# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/acer/a5/proprietary/gps.conf:system/etc/gps.conf

PRODUCT_COPY_FILES += \
    device/acer/a5/init.jazz.rc:root/init.jazz.rc \
    device/acer/a5/init.jazz.sh:root/init.jazz.sh \
    device/acer/a5/init.jazz.post_boot.sh:root/init.jazz.post_boot.sh \
    device/acer/a5/ueventd.jazz.rc:root/ueventd.jazz.rc

include $(subdir_makefiles)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/acer/a5/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml


# media config xml file
PRODUCT_COPY_FILES += \
    device/acer/a5/proprietary/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.msm7x30 \
    audio.primary.msm7x30 \
    libaudioutils \
    libtinyalsa

# Video
PRODUCT_PACKAGES += \
    copybit.msm7x30 \
    gralloc.msm7x30 \
    hwcomposer.msm7x30 \
    lights.jazz \
    sensors.jazz \
    gps.jazz

# Camera
PRODUCT_PACKAGES += \
    camera.msm7x30

# Omx
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVenc \
    libOmxVdec

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    Basic \
    NoiseField \
    Galaxy4 \
    PhaseBeam

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Applications
PRODUCT_PACKAGES += \
    Camera \
    Development \
    FileManager \
    LatinIME \
    Mms \
    Stk \
    VideoEditor \
    VoiceDialer \
    SpareParts \
    SyncProvider \
    Torch \
    Superuser \
    su \
	hostap

# CyanogenMod Packages
PRODUCT_PACKAGES += \
    CMSettings \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf

#Wifi Firmware
PRODUCT_COPY_FILES += \
    device/acer/a5/proprietary/modules/ar6000.ko:system/wifi/ar6000.ko \
    device/acer/a5/proprietary/firmware/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \
    device/acer/a5/proprietary/firmware/athtcmd_ram.bin:system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin  \
    device/acer/a5/proprietary/firmware/bdata.SD31_1.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31_1.bin  \
    device/acer/a5/proprietary/firmware/bdata.SD31.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin  \
    device/acer/a5/proprietary/firmware/bdata.SD31_2.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31_2.bin  \
    device/acer/a5/proprietary/firmware/data.patch.bin:system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \
    device/acer/a5/proprietary/firmware/otp.bin.z77:system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77 \
    device/acer/a5/proprietary/firmware/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77
#Firmware
PRODUCT_COPY_FILES += \
    device/acer/a5/proprietary/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/acer/a5/proprietary/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/acer/a5/proprietary/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/acer/a5/proprietary/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/acer/a5/proprietary/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/acer/a5/proprietary/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/acer/a5/proprietary/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/acer/a5/proprietary/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/acer/a5/proprietary/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw

# a5 uses high-density artwork where available
PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_COPY_FILES += \
    device/acer/a5/proprietary/vold.fstab:system/etc/vold.fstab


#PRODUCT_COPY_FILES += \
#    device/acer/a5/proprietary/modules/librasdioif.ko:system/lib/modules/librasdioif.ko \
#    device/acer/a5/proprietary/modules/oprofile.ko:system/lib/modules/oprofile.ko \
#    device/acer/a5/proprietary/modules/reset_modem.ko:system/lib/modules/reset_modem.ko \
#    device/acer/a5/proprietary/modules/sch_dsmark.ko:system/lib/modules/sch_dsmark.ko \
#    device/acer/a5/proprietary/modules/tun.ko:system/lib/modules/tun.ko

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/acer/a5/a5-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/acer/a5/overlay

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_NAME := full_a5
PRODUCT_DEVICE := a5
PRODUCT_BRAND := Android
PRODUCT_MODEL := Full AOSP on Iconia Smart

 # we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-acer-1.so \
    rild.libargs=-d /dev/smd0 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.telephony.default_network=0 \
    ro.telephony.call_ring.multiple=false \
#    ro.telephony.ril_class=semc \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=265 \
    ro.sf.lcd_density=240 \
    keyguard.no_require_sim=true \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=48m \
    dalvik.vm.dexopt-data-only=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.checkjni=false \
    ro.product.locale.language=en \
    ro.product.locale.region=US \
    ro.use_data_netmgrd=true \
    BUILD_UTC_DATE=0

