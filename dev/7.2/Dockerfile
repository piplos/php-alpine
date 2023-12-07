FROM piplosmedia/php-fpm:7.2

# Install XDebug.
RUN apk add --update linux-headers \
    && apk add --no-cache --virtual build-essentials g++ make automake autoconf \
    && pecl install xdebug-3.0.0 \
    && docker-php-ext-enable xdebug \
    && apk del build-essentials && rm -rf /usr/src/php*
