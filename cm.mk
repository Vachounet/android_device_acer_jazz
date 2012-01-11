# Release name
PRODUCT_RELEASE_NAME := S300

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/acer/a5/a5.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a5
PRODUCT_NAME := cm_a5
PRODUCT_BRAND := Acer
PRODUCT_MODEL := Iconia Smart

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=mysid BUILD_ID=ICL53F BUILD_DISPLAY_ID=IML74K BUILD_FINGERPRINT="google/mysid/a5:4.0.2/ICL53F/235179:user/release-keys" PRIVATE_BUILD_DESC="mysid-user 4.0.2 ICL53F 235179 release-keys"
