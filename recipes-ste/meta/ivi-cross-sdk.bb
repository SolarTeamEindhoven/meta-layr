include recipes-qt/meta/meta-toolchain-b2qt-embedded-qt5-sdk.bb

DESCRIPTION = "LAYR-OS SDK"

TOOLCHAIN_HOST_TASK += " nativesdk-packagegroup-ivi-toolchain-host"
TOOLCHAIN_TARGET_TASK += " packagegroup-ivi-toolchain-target"
