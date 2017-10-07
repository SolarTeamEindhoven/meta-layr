DESCRIPTION = "Solar Team Eindhoven IVI SDK"

require recipes-qt/qt5/qt5.inc

STE_MODULE = "IVI-LauncherSDK"
STE_BRANCH ?= "develop"
STE_BRANCH_PARAM ?= "branch=${STE_BRANCH}"

# each module needs to define valid SRCREV
SRC_URI = " \
    ${STE_GIT}/${STE_MODULE}.git;name=${STE_MODULE};${STE_BRANCH_PARAM};protocol=${STE_GIT_PROTOCOL} \
"

LICENSE = "LGPL-3.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
"

DEPENDS = "qtbase qtdeclarative qtwayland qtwayland-native"

S = "${WORKDIR}/git"

PV = "0.0.1+git${SRCPV}"

SRCREV = "40ce436929cb4d3162b17716c6ed05de1048a778"
