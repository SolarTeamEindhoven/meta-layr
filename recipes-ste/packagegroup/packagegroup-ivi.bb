DESCRIPTION = "LAYR IVI packages"
LICENSE = "MIT"
PR = "r0"

inherit packagegroup

RDEPENDS_${PN} += " \
	libgps \
	libiio \
	pi-blaster \
	layr-launcher \
	layr-softkeyplugin \
	layr-vehicleintegrationplugin \
	layr-wifimanager \
	ivi-sdk \
	"
