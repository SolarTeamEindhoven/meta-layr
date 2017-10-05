inherit core-image
inherit consistent_timestamps

DESCRIPTION = "IVI development image"
SUMMARY = "The Solar Team Eindhoven Board Computer development image"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://MIT;md5=80e06902b5f0e94ad0a78ee4f7fcb74b"
PR = "r0"

IMAGE_FEATURES += "\
	package-management \
	ssh-server-dropbear \
	tools-debug \
	debug-tweaks \
	hwcodecs \
        "

IMAGE_INSTALL += "\
	packagegroup-b2qt-embedded-base \
	packagegroup-b2qt-embedded-tools \
	${@bb.utils.contains("DISTRO_FEATURES", "gstreamer010", "packagegroup-b2qt-embedded-gstreamer010", "", d)} \
	${@bb.utils.contains("DISTRO_FEATURES", "gstreamer", "packagegroup-b2qt-embedded-gstreamer", "", d)} \
	packagegroup-b2qt-qt5-modules \
	packagegroup-b2qt-embedded-addons \
	packagegroup-ivi \
	"

TOOLCHAIN_HOST_TASK += "nativesdk-packagegroup-ivi-toolchain-host"
TOOLCHAIN_TARGET_TASK += "packagegroup-ivi-toolchain-target"
