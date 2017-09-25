DESCRIPTION = "LAYR IVI packages"
LICENSE = "MIT"
PR = "r0"

inherit packagegroup

RDEPENDS_${PN} += " \
	vim \
	libgps \
	libiio \
	pi-blaster \
	layr-launcher \
	layr-softkeyplugin \
	layr-vehicleintegrationplugin \
	ivi-sdk \
	ivi-app \
	ivi-app-applications \
	"
