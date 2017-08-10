QT_GIT = "git://github.com/papyros"
QT_MODULE = "qml-material"
QT_MODULE_BRANCH = "master"

require recipes-qt/qt5/qt5.inc
require recipes-qt/qt5/qt5-git.inc

LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=763d8c535a234d9a3fb682c7ecb6c073 \
    file://LICENSE.CC-BY;md5=c96076271561b0e3785dad260634eaa8 \
    file://LICENSE.MPL;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
"

DEPENDS += "qtdeclarative ttf-roboto"

RDEPENDS_${PN}-dev = ""

SRCREV = "803035deba51e7fd69634378555d8e62c79af39f"
