
FROM php:7.2-fpm-alpine

RUN apk add --no-cache mysql-client git wget libzip libpng libjpeg-turbo libwebp freetype icu supervisor geoip libmemcached ldb libldap libpq gmp
RUN apk add --no-cache --virtual build-essentials \
    icu-dev icu-libs zlib-dev g++ make automake autoconf libzip-dev \
    postgresql-dev ldb-dev openldap-dev geoip-dev libsodium-dev gmp-dev libmemcached-dev \
    libpng-dev libwebp-dev libjpeg-turbo-dev freetype-dev libxml2-dev && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-webp-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install zip calendar iconv mbstring soap gd mysqli pdo_mysql pgsql pdo_pgsql intl opcache exif ldap gmp bcmath && \
    pecl install memcached redis geoip-1.1.1 libsodium && \
    docker-php-ext-enable memcached.so redis.so geoip.so && \
    apk del build-essentials && rm -rf /usr/src/php*

RUN wget https://getcomposer.org/composer-stable.phar -O /usr/local/bin/composer && chmod +x /usr/local/bin/composer

ADD supervisord.conf /etc/supervisord.conf

STOPSIGNAL SIGQUIT
EXPOSE 9000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
