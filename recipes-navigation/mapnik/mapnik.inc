DESCRIPTION = "Mapnik is an open source toolkit for developing mapping applications."
HOMEPAGE = "http://mapnik.org/"
SECTION = "devel/libs"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://COPYING;md5=792932b758db63878387d7c0b0e74c54"

SRC_URI = "https://github.com/mapnik/mapnik/releases/download/v${PV}/mapnik-v${PV}.tar.bz2"

S = "${WORKDIR}/mapnik-v${PV}"

inherit pythonnative

DEPENDS += "boost icu zlib freetype libxml2 harfbuzz"

PACKAGECONFIG[libpng] = ",,libpng"
PACKAGECONFIG[jpeg] = ",,jpeg"
PACKAGECONFIG[tiff] = ",,tiff"
PACKAGECONFIG[libwebp] = ",,libwebp"
PACKAGECONFIG[proj] = ",,proj"
PACKAGECONFIG[cairo] = ",,cairo"
PACKAGECONFIG[postgresql] = ",,postgresql"
PACKAGECONFIG[sqlite3] = ",,sqlite3"

PACKAGECONFIG ?= "libpng jpeg tiff libwebp proj cairo postgresql sqlite3"

do_configure() {
	./configure
}
