#!/bin/sh

mkdir -p /opt/google/chrome
if [ ! -e /opt/google/chrome/libwidevinecdm.so ]; then
	ln -s /usr/lib/libwidevinecdm.so /opt/google/chrome/libwidevinecdm.so
fi
if [ ! -e /opt/google/chrome/libwidevinecdmadapter.so ]; then
	ln -s /usr/lib/libwidevinecdmadapter.so /opt/google/chrome/libwidevinecdmadapter.so
fi
