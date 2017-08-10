include recipes-qt/images/b2qt-embedded-qt5-image.bb

SUMMARY = "The Solar Team Eindhoven Board Computer development image"

IMAGE_INSTALL += " packagegroup-ivi "

TOOLCHAIN_HOST_TASK += "nativesdk-packagegroup-ivi-toolchain-host"
TOOLCHAIN_TARGET_TASK += "packagegroup-ivi-toolchain-target"
