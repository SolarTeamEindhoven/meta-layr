FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += " file://pulseaudio.service "

do_install_append() {
	install -d ${D}${systemd_unitdir}/system
	install -m 0644 ${WORKDIR}/pulseaudio.service ${D}${systemd_unitdir}/system
	rm -rf `dirname ${D}${systemd_user_unitdir}`
}

FILES_${PN}-server += " ${systemd_unitdir}/system/*"
