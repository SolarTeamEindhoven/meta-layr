FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://0002-Add-AD7998-overlay-to.patch \
	file://0002-Add-option-for-512M-cma-limit.patch \
	file://0004-Smack-Assign-smack_known_web-label-for-kernel-thread.patch \
"

require linux-raspberrypi.inc
