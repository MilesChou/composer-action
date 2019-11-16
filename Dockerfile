FROM composer:latest

LABEL repository="https://github.com/MilesChou/composer-action"
LABEL homepage="https://github.com/MilesChou/composer-action"
LABEL maintainer="MilesChou <jangconan@gmail.com>"

RUN set -xe && \
        composer global require hirak/prestissimo && \
        composer clear-cache

COPY composer-entrypoint /usr/local/bin/composer-entrypoint

ENTRYPOINT ["/usr/local/bin/composer-entrypoint"]
