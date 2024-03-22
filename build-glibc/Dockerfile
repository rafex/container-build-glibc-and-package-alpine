FROM ubuntu:22.04 as glibc-builder

LABEL maintainer="Rafex <rafex@rafex.dev>"

ENV DEBIAN_FRONTEND=noninteractive \
    GLIBC_VERSION=2.39 \
    PREFIX_DIR=/usr/glibc-compat

RUN apt-get -q update \
	&& apt-get -qy install \
		bison \
		build-essential \
		gawk \
		gettext \
		openssl \
		python3 \
		texinfo \
		wget

COPY configparams /glibc-build/configparams
COPY builder /builder
ENTRYPOINT ["/builder"]
