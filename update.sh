#!/usr/bin/env bash

generated_warning() {
	cat <<-EOH
		#
		# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
		#
		# PLEASE DO NOT EDIT IT DIRECTLY.
		#
	EOH
}

LATEST_VERSION=7.3

VERSIONS="
5.6
5.5
7.0
7.1
7.2
7.3
"

for version in ${VERSIONS}; do
    rm -rf ${version}
    mkdir -p ${version}

    generated_warning > ${version}/Dockerfile
    cat Dockerfile.template | sed -e 's!%%PHP_VERSION%%!'"${version}-alpine"'!' >> ${version}/Dockerfile

    cp docker-entrypoint ${version}/docker-entrypoint
done
