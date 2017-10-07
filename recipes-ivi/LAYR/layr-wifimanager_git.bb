DESCRIPTION = "LAYR Launcher"

LICENSE = "LGPL-3.0"
LIC_FILES_CHKSUM = "file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962"

STE_MODULE = "LAYR-WiFiManager"

inherit qmake5
require LAYR-git.inc

SRCREV = "31ae6eb13b259f3f4d185778930b5b1dd6dfc081"

S = "${WORKDIR}/git"

DEPENDS = "qtbase qtdeclarative ivi-sdk"

FILES_${PN} += "/usr/share/IVIapps/WiFiManager/*"
