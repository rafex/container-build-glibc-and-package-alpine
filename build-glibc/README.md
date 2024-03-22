# build-glibc

A glibc binary package builder in Docker. Produces a glibc binary package that can be imported into a rootfs to run applications dynamically linked against glibc.

## Usage

Build a glibc package based on version 2.39 with a prefix of `/usr/glibc-compat`:

    docker run --rm --env STDOUT=1 rafex/glibc-builder 2.39 /usr/glibc-compat > glibc-bin-2.39.tar.gz

You can also keep the container around and copy out the resulting file:

    docker run --name glibc-binary rafex/glibc-builder 2.39 /usr/glibc-compat
    docker cp glibc-binary:/glibc-bin-2.39.tar.gz ./
    docker rm glibc-binary
