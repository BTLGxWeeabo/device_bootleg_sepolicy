#
# This policy configuration will be used by all products that
# inherit from Bootleggers
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/bootleg/sepolicy/common/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/bootleg/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/bootleg/sepolicy/common/dynamic
else
BOARD_SEPOLICY_DIRS += \
    device/bootleg/sepolicy/common/dynamic \
    device/bootleg/sepolicy/common/vendor
endif

# Selectively include legacy rules defined by the products
-include device/lineage/sepolicy/legacy-common/sepolicy.mk
