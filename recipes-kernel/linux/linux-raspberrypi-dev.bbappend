FILESEXTRAPATHS_prepend := "${THISDIR}/linux-raspberrypi:"

SRC_URI += " \
	file://0001-Add-AD7998-overlay-to.patch \
"

require linux-raspberrypi.inc
