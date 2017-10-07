FILESEXTRAPATHS_prepend := "${THISDIR}/pi-blaster:"

inherit systemd autotools pkgconfig

PACKAGECONFIG ?= "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd", "", d)}"
PACKAGECONFIG[systemd] = ",,systemd"

SRC_URI += " \
	file://0001-Enable-PCM.patch \
	file://0002-Changed-PWM-pins.patch \
"

SYSTEMD_SERVICE_${PN} = "pi-blaster.service"
