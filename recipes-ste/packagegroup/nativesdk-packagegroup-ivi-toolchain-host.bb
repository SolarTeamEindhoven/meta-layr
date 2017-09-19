DESCRIPTION = "Host packages for LAYR-OS SDK"
LICENSE = "The-Qt-Company-DCLA-2.1"
PR = "r0"

inherit nativesdk packagegroup

RDEPENDS_${PN} += " \
	nativesdk-qtapplicationmanager-tools \
"
