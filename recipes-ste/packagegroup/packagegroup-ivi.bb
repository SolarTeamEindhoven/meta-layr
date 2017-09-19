DESCRIPTION = "LAYR IVI packages"
LICENSE = "MIT"
PR = "r0"

inherit packagegroup

RDEPENDS_${PN} += " \
	vim \
	libgps \
	libiio \
	pi-blaster \
	qtapplicationmanager \
	layr-launcher \
	layr-softkeyplugin \
	layr-vehicleintegrationplugin \
	layr-wifimanager \
	ivi-sdk \
	ivi-app \
	ivi-app-applications \
	"
