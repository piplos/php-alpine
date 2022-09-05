FROM piplosmedia/php-fpm:7.1

# Install XDebug.
RUN apk add --no-cache --virtual build-essentials \
    g++ make automake autoconf \
    && pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug \
    && apk del build-essentials && rm -rf /usr/src/php*
