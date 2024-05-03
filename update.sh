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
    mkdir -p ${version}
    generated_warning > ${version}/Dockerfile
    cat Dockerfile.template | sed -e 's!%%PHP_VERSION%%!'"${version}-alpine"'!' >> ${version}/Dockerfile

    cp docker-entrypoint ${version}/docker-entrypoint

    mkdir -p ${version}/install
    generated_warning > ${version}/install/Dockerfile
    echo "FROM ghcr.io/mileschou/composer:${version}" >> ${version}/install/Dockerfile
    echo "" >> ${version}/install/Dockerfile
    echo "CMD [\"install\"]" >> ${version}/install/Dockerfile
done

generated_warning > Dockerfile
cat Dockerfile.template | sed -e 's!%%PHP_VERSION%%!'"${LATEST_VERSION}-alpine"'!' >> Dockerfile

mkdir -p install
generated_warning > install/Dockerfile
echo "FROM mileschou/composer:${LATEST_VERSION}" >> install/Dockerfile
echo "" >> install/Dockerfile
echo "CMD [\"install\"]" >> install/Dockerfile
