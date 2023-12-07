FROM piplosmedia/php-fpm:8.2

# Install XDebug.
RUN apk add --update linux-headers \
    && apk add --no-cache --virtual build-essentials g++ make automake autoconf \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && apk del build-essentials && rm -rf /usr/src/php*
