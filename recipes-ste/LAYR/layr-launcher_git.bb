DESCRIPTION = "LAYR Launcher"

LICENSE = "LGPL-3.0"
LIC_FILES_CHKSUM = "file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962"

STE_MODULE = "LAYR-Launcher"

inherit qmake5 systemd
require LAYR-git.inc

SRC_URI += "file://LAYR-Launcher.service"

SRCREV = "c2c78f546585969c6099f4a6d926ec51b4b38b70"

S = "${WORKDIR}/git"

DEPENDS = "qtbase qtdeclarative ivi-launchersdk"

do_install_append() {
	install -m 0755 -d ${D}${systemd_unitdir}/system
	install -m 0644 ${WORKDIR}/LAYR-Launcher.service ${D}${systemd_unitdir}/system/
}

SYSTEMD_SERVICE_${PN} = "LAYR-Launcher.service"
