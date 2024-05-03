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

LATEST_VERSION=8.3

VERSIONS="
7.2
7.3
7.4
8.0
8.1
8.2
8.3
"

for version in ${VERSIONS}; do
    mkdir -p ${version}/v1
    generated_warning > ${version}/v1/Dockerfile
    cat Dockerfile_v1.template | sed -e 's!%%PHP_VERSION%%!'"${version}-alpine"'!' >> ${version}/v1/Dockerfile

    cp docker-entrypoint ${version}/v1/docker-entrypoint

    mkdir -p ${version}/v1/install
    generated_warning > ${version}/v1/install/Dockerfile
    echo "FROM ghcr.io/mileschou/composer:${version}-v1" >> ${version}/v1/install/Dockerfile
    echo "" >> ${version}/v1/install/Dockerfile
    echo "CMD [\"install\"]" >> ${version}/v1/install/Dockerfile
done

mkdir -p v1

generated_warning > v1/Dockerfile
cat Dockerfile_v1.template | sed -e 's!%%PHP_VERSION%%!'"${LATEST_VERSION}-alpine"'!' >> v1/Dockerfile

cp docker-entrypoint v1/docker-entrypoint

mkdir -p v1/install
generated_warning > v1/install/Dockerfile
echo "FROM mileschou/composer:${LATEST_VERSION}-v1" >> v1/install/Dockerfile
echo "" >> v1/install/Dockerfile
echo "CMD [\"install\"]" >> v1/install/Dockerfile
