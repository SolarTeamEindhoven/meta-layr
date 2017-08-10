remove_line() {
	echo "removing line: $1"
	sed -i "s/\($1\)/#\1/g" ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
}

DISABLE_OVERSCAN="1"

do_deploy_append() {
        sed -i '/#cec_osd_name/ c\cec_osd_name=${MACHINE_HOSTNAME}' ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        sed -i '/#display_rotate/ c\display_rotate=1' ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        sed -i '/#boot_delay/ c\boot_delay=0' ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        sed -i '/#boot_delay_ms/ c\boot_delay_ms=0' ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        sed -i '/#disable_splash/ c\disable_splash=0' ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        sed -i '/#avoid_warnings/ c\avoid_warnings=1' ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

	echo "dtoverlay=ad7998" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt

	remove_line "start_x=1"
	remove_line "start_debug=1"
	remove_line "dtparam=spi=on"
}
