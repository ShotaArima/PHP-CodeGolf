FROM php:8.5.3-cli-alpine

# mbstring をビルドして有効化
RUN set -eux; \
    apk add --no-cache --virtual .build-deps $PHPIZE_DEPS oniguruma-dev; \
    docker-php-ext-install -j"$(nproc)" mbstring; \
    apk del .build-deps

# 最小構成の php.ini を適用
COPY docker/php.ini /usr/local/etc/php/php.ini

# conf.d を「mbstring の ini 以外」消す（= 追加拡張は実質 mbstring のみ）
RUN set -eux; \
    if [ -d /usr/local/etc/php/conf.d ]; then \
      find /usr/local/etc/php/conf.d -type f ! -name '*mbstring*' -delete; \
    fi

WORKDIR /work
