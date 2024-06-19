#!/bin/sh
set -e
hash=$(sha256sum "libvips.so.42")
if [[ $hash == "d9a06f7adce8a07213c68ba0be7046a255d2952893174fed5b1187589e770aa2" ]]; then
	echo "arm64-glibc libvips.so.42 detected"
elif [[ $hash == "3aa9e0d2865e8a65a0d4d7fa4011e1ab2b6e5c313b53d7584363da817db2b45f" ]]; then
	echo "arm64-musl libvips.so.42 detected"
else
	echo "unknown libvips.so.42 version"
fi
