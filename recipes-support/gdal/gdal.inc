SUMMARY = "GDAL is a translator library for raster geospatial data formats"
HOMEPAGE = "http://www.gdal.org/"
LICENSE = "MIT"

DEPENDS = "proj sqlite3 tiff json-c libxml2"

SRC_URI = "http://download.osgeo.org/gdal/${PV}/gdal-${PV}.tar.gz"

# autotools-brokensep
inherit autotools-brokensep pkgconfig binconfig

EXTRA_OECONF = " \
	--without-perl \
	--without-python \
	--without-php \
	--without-curl \
	--with-libz=internal \
	--with-png=internal \
	--with-jpeg=internal \
	--with-libtiff=internal \
	--without-expat \
	--without-spatialite \
	--with-sqlite3=${STAGING_EXECPREFIXDIR} \
	--with-libtiff=${STAGING_EXECPREFIXDIR} \
	--with-libjson-c=${STAGING_EXECPREFIXDIR} \
	--with-expat=${STAGING_EXECPREFIXDIR} \
	"

EXTRA_OEMAKE += "INST_DATA="${datadir}/gdal""

PACKAGECONFIG ?= "geos png jasper"
PACKAGECONFIG[geos] = "--with-geos,--without-geos,geos"
PACKAGECONFIG[lzma] = "--with-liblzma,--without-liblzma,xz"
PACKAGECONFIG[png] = "--with-png,--without-png,libpng"
PACKAGECONFIG[gif] = "--with-gif,--without-gif,giflib"
PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg,jpeg"
PACKAGECONFIG[z] = "--with-libz,--without-libz,zlib"
PACKAGECONFIG[jasper] = "--with-jasper,--without-jasper,jasper"
PACKAGECONFIG[curl] = "--with-curl,--without-curl,curl"

FILES_${PN} += "${libdir}/gdalplugins"
