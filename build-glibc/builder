#!/usr/bin/env bash

set -eo pipefail; [[ "$TRACE" ]] && set -x

main() {
	declare version="${1:-$GLIBC_VERSION}" prefix="${2:-$PREFIX_DIR}"
	declare url="https://mirror.csclub.uwaterloo.ca/gnu/glibc"

	: "${version:?}" "${prefix:?}"

	{
		wget -qO- "$url/glibc-$version.tar.gz" \
			| tar zxf -
		mkdir -p /glibc-build && cd /glibc-build
		"/glibc-$version/configure" \
			--prefix="$prefix" \
			--libdir="$prefix/lib" \
			--libexecdir="$prefix/lib" \
			--enable-multi-arch \
			--enable-stack-protector=strong
		make && make install
		tar --dereference --hard-dereference -zcf "/glibc-bin-$version.tar.gz" "$prefix"
	} >&2

	[[ $STDOUT ]] && cat "/glibc-bin-$version.tar.gz"
}

main "$@"
