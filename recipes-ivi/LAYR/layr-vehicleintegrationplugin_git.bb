DESCRIPTION = "LAYR Vehicle Integration Plugin"

LICENSE = "LGPL-3.0"
LIC_FILES_CHKSUM = "file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962"

STE_MODULE = "LAYR-VehicleIntegrationPlugin"

inherit qmake5
require LAYR-git.inc

SRCREV = "a4c01335bcaaa60f908826567d72c29810b982a8"

S = "${WORKDIR}/git"

FILES_${PN} += " \
	${OE_QMAKE_PATH_PLUGINS}/*/*${SOLIBSDEV} \
"
FILES_${PN}-dev += "${libdir}/cmake/*/*.cmake"

DEPENDS = "qtbase qtdeclarative qtscript ivi-launchersdk"
