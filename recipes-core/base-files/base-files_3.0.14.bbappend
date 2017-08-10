do_install_append_IVI () {
	echo "" >> ${D}${sysconfdir}/profile
	echo "# Used by almost all wayland servers/clients:" >> ${D}${sysconfdir}/profile
	echo "export XDG_RUNTIME_DIR=\"/tmp\"" >> ${D}${sysconfdir}/profile
	echo "" >> ${D}${sysconfdir}/profile
	echo "# Used by the IVI Launcher SDK:" >> ${D}${sysconfdir}/profile
	echo "#export STE_APP_PATH=\"/usr/share/IVIapps\"" >> ${D}${sysconfdir}/profile
	echo "" >> ${D}${sysconfdir}/profile
	echo "# Default to 96 ppi:" >> ${D}${sysconfdir}/profile
	echo 'eval $(sudo cat /sys/class/graphics/fb0/virtual_size | sed '"'"'s/^\(.*\),\(.*\)$/WIDTH \1\nHEIGHT \2/'"'"' | awk '"'"'{ print "export QT_QPA_EGLFS_PHYSICAL_"$1"=$((" $2 "*254/960))" }'"'"' | tr '"'"'\n'"'"' '"'"';'"'"')' >> ${D}${sysconfdir}/profile
	echo "" >> ${D}${sysconfdir}/profile
	echo "# Qt5 environement variables:" >> ${D}${sysconfdir}/profile
	echo "export QT_LOGGING_TO_CONSOLE=\"1\"" >> ${D}${sysconfdir}/profile
	echo "export QT_WAYLAND_SHELL_INTEGRATION=\"wayland-ste\"" >> ${D}${sysconfdir}/profile
	echo "export QT_WAYLAND_DISABLE_WINDOWDECORATION=1" >> ${D}${sysconfdir}/profile
	echo "export QT_WAYLAND_USE_BYPASSWINDOWMANAGERHINT=1" >> ${D}${sysconfdir}/profile
	echo "" >> ${D}${sysconfdir}/profile
	echo "export QT_AUTO_SCREEN_SCALE_FACTOR=\"1\"" >> ${D}${sysconfdir}/profile
	echo "export QT_QUICK_CONTROLS_STYLE=\"material\"" >> ${D}${sysconfdir}/profile
	echo "#export QT_QUICK_CONTROLS_MATERIAL_ACCENT=\"DeepOrange\"" >> ${D}${sysconfdir}/profile
	echo "#export QT_QUICK_CONTROLS_MATERIAL_PRIMARY=\"Yellow\"" >> ${D}${sysconfdir}/profile
	echo "#export QT_QUICK_CONTROLS_MATERIAL_FOREGROUND=\"Amber\"" >> ${D}${sysconfdir}/profile
	echo "#export QT_QUICK_CONTROLS_MATERIAL_BACKGROUND=\"Amber\"" >> ${D}${sysconfdir}/profile
}
