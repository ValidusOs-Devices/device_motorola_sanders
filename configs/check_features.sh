#!/sbin/sh

# 1802 - Brazil
# 1803 - Europe
# 1804 - India
# 1805 - Europe
# 1806 - USA

sku=`getprop ro.boot.hardware.sku`

if [ "$sku" = "XT1806" ]; then
    # XT1806 doesn't have NFC chip
    rm /vendor/etc/permissions/android.hardware.nfc.xml
    rm /vendor/etc/permissions/android.hardware.nfc.hce.xml
    rm /vendor/etc/permissions/com.android.nfc_extras.xml
    rm -r /system/app/NfcNci
fi

if ! [ "$sku" = "XT1802" ]; then
    # Others variants doesn't have DTV support
    rm /system/vendor/etc/permissions/com.motorola.hardware.dtv.xml
    rm /system/vendor/etc/permissions/mot_dtv_permissions.xml
    rm /system/vendor/bin/hw/motorola.hardware.tv@1.0-service
    rm /system/vendor/etc/init/motorola.hardware.tv@1.0-service.rc
    rm /system/vendor/lib/libdtvtuner.so
    rm /system/vendor/lib/hw/motorola.hardware.tv@1.0-impl.so
    rm /system/vendor/lib/motorola.hardware.tv@1.0.so
    rm /system/vendor/lib/motorola.hardware.tv@1.0_vendor.so
    rm /system/vendor/lib64/libdtvtuner.so
    rm /system/vendor/lib64/hw/motorola.hardware.tv@1.0-impl.so
    rm /system/vendor/lib64/motorola.hardware.tv@1.0.so
    rm /system/vendor/lib64/motorola.hardware.tv@1.0_vendor.so
    rm -r /system/vendor/app/DTVPlayer
    rm -r /system/vendor/app/DTVService
fi

