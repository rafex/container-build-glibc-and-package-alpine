#!/bin/sh

source ../scripts-utils/valid_podman.sh

GLIBC_VERSION=2.39

# Build the image
docker build --progress=plain -t rafex/glibc-package .
echo "Built rafex/glibc-package"