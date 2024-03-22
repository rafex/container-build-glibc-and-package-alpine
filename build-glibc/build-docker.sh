#!/bin/sh

source ../scripts-utils/valid_podman.sh

GLIBC_VERSION=2.39

# Build the image
docker build --progress=plain -t rafex/glibc-builder .

docker run --name glibc-binary rafex/glibc-builder ${GLIBC_VERSION} /usr/glibc-compat
docker cp glibc-binary:/glibc-bin-${GLIBC_VERSION}.tar.gz ./bin/
docker rm glibc-binary