$(call inherit-product-if-exists,frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
			$(LOCAL_PATH)/root/fstab.db410c:root/fstab.db410c \
			$(LOCAL_PATH)/root/init.db410c.rc:root/init.db410c.rc \
			$(LOCAL_PATH)/root/init.db410c.usb.rc:root/init.db410c.usb.rc \
			$(LOCAL_PATH)/root/ueventd.db410c:root/ueventd.db410c.rc)

# Set custom settings
DEVICE_PACKAGE_OVERLAYS := device/rosterloh/db410c/overlay

# Add openssh support for remote debugging and job submission
PRODUCT_PACKAGES += ssh sftp scp sshd ssh-keygen sshd_config start-ssh wpa_supplicant

# Build and run only ART
PRODUCT_RUNTIMES := runtime_libart_default

# Set zygote config
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote64_32
PRODUCT_COPY_FILES += system/core/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc

PRODUCT_PACKAGES += \
    libGLES_mesa \
    libGLES_android \
    hwcomposer.drm \
    gralloc.drm

# Own boot image build script
$(call inherit-product-if-exists, device/rosterloh/db410c/boot_img.mk)

# Copy hardware config file(s)
PRODUCT_COPY_FILES += \
	$(call add-to-product-copy-files-if-exists,\
	device/linaro/build/android.hardware.screen.xml:system/etc/permissions/android.hardware.screen.xml)

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
	frameworks/native/data/etc/android.software.backup.xml:system/etc/permissions/android.software.backup.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	device/rosterloh/db410c/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Copy firmware files
PRODUCT_COPY_FILES += \
	$(call add-to-product-copy-files-if-exists,\
	vendor/qcom/proprietary/a300_pfp.fw:root/lib/firmware/a300_pfp.fw \
	vendor/qcom/proprietary/a300_pm4.fw:root/lib/firmware/a300_pm4.fw \
	vendor/qcom/proprietary/venus.b00:root/lib/firmware/venus.b00 \
	vendor/qcom/proprietary/venus.b01:root/lib/firmware/venus.b01 \
	vendor/qcom/proprietary/venus.b02:root/lib/firmware/venus.b02 \
	vendor/qcom/proprietary/venus.b03:root/lib/firmware/venus.b03 \
	vendor/qcom/proprietary/venus.b04:root/lib/firmware/venus.b04 \
	vendor/qcom/proprietary/venus.mbn:root/lib/firmware/venus.mbn \
	vendor/qcom/proprietary/venus.mdt:root/lib/firmware/venus.mdt \
	vendor/qcom/proprietary/wcnss.b00:root/lib/firmware/wcnss.b00 \
	vendor/qcom/proprietary/wcnss.b01:root/lib/firmware/wcnss.b01 \
	vendor/qcom/proprietary/wcnss.b02:root/lib/firmware/wcnss.b02 \
	vendor/qcom/proprietary/wcnss.b04:root/lib/firmware/wcnss.b04 \
	vendor/qcom/proprietary/wcnss.b06:root/lib/firmware/wcnss.b06 \
	vendor/qcom/proprietary/wcnss.b09:root/lib/firmware/wcnss.b09 \
	vendor/qcom/proprietary/wcnss.b10:root/lib/firmware/wcnss.b10 \
	vendor/qcom/proprietary/wcnss.b11:root/lib/firmware/wcnss.b11 \
	vendor/qcom/proprietary/wcnss.mdt:root/lib/firmware/wcnss.mdt \
	vendor/qcom/proprietary/wlan/prima/WCNSS_cfg.dat:root/lib/firmware/wlan/prima/WCNSS_cfg.dat \
	vendor/qcom/proprietary/wlan/prima/WCNSS_qcom_cfg.ini:root/lib/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
	vendor/qcom/proprietary/wlan/prima/WCNSS_qcom_wlan_nv.bin:root/lib/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
	vendor/qcom/proprietary/wlan/prima/WCNSS_wlan_dictionary.dat:root/lib/firmware/wlan/prima/WCNSS_wlan_dictionary.dat)

# enable adbd started with root permission
PRODUCT_PROPERTY_OVERRIDES += service.adb.root=1

PRODUCT_COPY_FILES += \
	$(call add-to-product-copy-files-if-exists, \
	device/linaro/build/disablesuspend.sh:system/bin/disablesuspend.sh \
	device/linaro/build/android_dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf)

# media configurations
PRODUCT_COPY_FILES += \
	device/generic/goldfish/camera/media_codecs.xml:system/etc/media_codecs.xml \
  	device/generic/goldfish/camera/media_profiles.xml:system/etc/media_profiles.xml \
    device/generic/goldfish/camera/media_codecs.xml:system/etc/media_codecs.xml \
    frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/etc/audio_policy_volumes.xml