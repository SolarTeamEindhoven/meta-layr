

#RDEPENDS_${PN} += " \
#    ${@bb.utils.contains('DISTRO_FEATURES', 'webengine', 'qtwebview', '', d)} \
#    "
