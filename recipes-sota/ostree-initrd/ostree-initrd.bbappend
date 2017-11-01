FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI_append = " file://linkwidevine.sh"

do_compile() {
	echo "linkwidevine" >> ${WORKDIR}/init.sh
}

do_install_append() {
	install -m 0755 ${WORKDIR}/linkwidevine.sh ${D}/sbin/linkwidevine
}
