DESCRIPTION = "Solar Team Eindhoven IVI SDK"

require recipes-qt/qt5/qt5.inc

STE_MODULE = "IVI-App"
STE_BRANCH ?= "features/StabilityImprovements"
STE_BRANCH_PARAM ?= "branch=${STE_BRANCH}"

# each module needs to define valid SRCREV
SRC_URI = " \
    ${STE_GIT}/IVI-SDK.git;name=${STE_MODULE};${STE_BRANCH_PARAM};protocol=${STE_GIT_PROTOCOL} \
"

LICENSE = "LGPL-3.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
"

DEPENDS = "qtbase qtdeclarative qtwayland qtwayland-native qtwebengine"

S = "${WORKDIR}/git"

PV = "0.0.1+git${SRCPV}"

SRCREV = "c3788aa91cf0eb8b4a62af3dea99fbf736107efb"

PACKAGES += "${PN}-applications"
FILES_${PN}-applications += " \
	/usr/share/ivi/apps/* \
	/usr/share/ivi/apps/*/* \
"
