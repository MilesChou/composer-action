FROM composer:latest

LABEL repository="https://github.com/MilesChou/composer-action"
LABEL homepage="https://github.com/MilesChou/composer-action"
LABEL maintainer="MilesChou <jangconan@gmail.com>"

LABEL com.github.actions.name="Composer Action"
LABEL com.github.actions.description="Do Composer commands in your actions."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="orange"

RUN set -xe && \
        composer global require hirak/prestissimo && \
        composer clear-cache

COPY composer-entrypoint /usr/local/bin/composer-entrypoint

ENTRYPOINT ["/usr/local/bin/composer-entrypoint"]
