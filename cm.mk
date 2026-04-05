# Release name
PRODUCT_RELEASE_NAME := Spica

# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-480x800

# Replace some common CM stuff.
$(call inherit-product, device/samsung/jet/jet_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/jet/full_jet.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := jet
PRODUCT_NAME := cm_jet
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := Galaxy Spica
PRODUCT_MANUFACTURER := Samsung

#Set build fingerprint / ID / Product Name ect.
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=cm_jet BUILD_FINGERPRINT="Samsung/cm_jet/jet:4.0.2/ICL53F/235179:user/release-keys" PRIVATE_BUILD_DESC="cm_jet-user 4.0.2 ICL53F 235179 release-keys"
