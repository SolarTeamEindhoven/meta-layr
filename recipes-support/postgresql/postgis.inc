DESCRIPTION = "PostGIS is a spatial database extender for PostgreSQL object-relational database. It adds support for geographic objects allowing location queries to be run in SQL."
HOMEPAGE = "http://www.postgis.net/"
SECTION = "devel/libs"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=858853a55d211fc6d66b360eab29de9e"

DEPENDS += "postgresql postgresql-native libxml2 gdal proj json-c geos"

inherit autotools

SRC_URI = "http://download.osgeo.org/postgis/source/postgis-${PV}.tar.gz"
S = "${WORKDIR}/postgis-${PV}"

EXTRA_AUTORECONF += "--exclude=autoheader"
