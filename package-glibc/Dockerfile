FROM alpine:3.19.1 AS glibc-package

LABEL maintainer="Rafex <rafex@rafex.dev>"

ENV GLIBC_VERSION=2.39 

ARG group=abuild \
    user=builder \ 
	path=/builder \
    glibc_file=glibc-bin-${GLIBC_VERSION}.tar.gz

RUN apk --no-cache add alpine-sdk coreutils
RUN adduser -G $group -g $group -h /builder -s /bin/ash -D $user 
RUN cat /etc/passwd
RUN mkdir -p $path/upstream
     
WORKDIR $path/upstream
COPY ./bin/$glibc_file .
COPY ["APKBUILD", "glibc-bin.trigger", "ld.so.conf", "nsswitch.conf", "/builder/upstream/"]
RUN ls -la

USER $user
WORKDIR $path

RUN abuild-keygen -a -i -n
RUN mkdir -p packages
RUN chown -R $user:$group upstream packages

WORKDIR $path/upstream
RUN sed -i 's/arch=.*/arch="armhf"/g' APKBUILD && \
    sed -i 's/ld-linux-x86-64.so.2/ld-linux-armhf.so.3/g' APKBUILD && \
    sed -i 's/lib64/lib/g' APKBUILD
RUN abuild checksum
RUN abuild -r