#!/bin/sh

source ../scripts-utils/valid_podman.sh

GLIBC_VERSION=2.39

# Build the image
docker build --progress=plain -t rafex/glibc-builder .
echo "Built rafex/glibc-builder"

docker run --name glibc-binary rafex/glibc-builder ${GLIBC_VERSION} /usr/glibc-compat
echo "Running rafex/glibc-builder"

docker cp glibc-binary:/glibc-bin-${GLIBC_VERSION}.tar.gz ./bin/
echo "Copied glibc-bin-${GLIBC_VERSION}.tar.gz"

docker rm glibc-binary
echo "Removed glibc-binary"