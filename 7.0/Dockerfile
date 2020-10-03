#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM php:7.0-alpine

LABEL repository="https://github.com/MilesChou/composer-action" \
    maintainer="MilesChou <jangconan@gmail.com>"

RUN set -xe && \
    apk add --no-cache \
        git \
        unzip

ENV COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_MEMORY_LIMIT=-1 \
    COMPOSER_HOME=/tmp \
    COMPOSER_PATH=/usr/bin/composer \
    COMPOSER_VERSION=1.10.5

COPY --from=composer:1.10.5 /usr/bin/composer /usr/bin/composer

RUN set -xe && \
        composer self-update && \
        composer global require hirak/prestissimo && \
        composer clear-cache

COPY docker-entrypoint /usr/local/bin/docker-entrypoint

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/docker-entrypoint"]

CMD ["--info"]
