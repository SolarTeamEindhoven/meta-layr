DESCRIPTION = "Target packages for LAYR-OS SDK"
LICENSE = "The-Qt-Company-DCLA-2.1"
PR = "r0"

inherit packagegroup

PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"

MACHINE_EXTRA_INSTALL_SDK ?= ""

RDEPENDS_${PN} += " \
	gpsd-dev \
	libiio-dev \
	avahi-dev \
	pi-blaster-dev \
	ivi-sdk-dev \
	ivi-launchersdk-dev \
	"
