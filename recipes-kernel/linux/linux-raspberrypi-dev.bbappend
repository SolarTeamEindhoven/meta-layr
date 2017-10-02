FILESEXTRAPATHS_prepend := "${THISDIR}/linux-raspberrypi:"

SRC_URI += " \
	file://0001-Add-AD7998-overlay-to.patch \
	file://0002-Add-option-for-512M-cma-limit.patch \
"

require linux-raspberrypi.inc
