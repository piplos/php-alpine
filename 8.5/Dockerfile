FROM php:8.5.12-fpm-alpine

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

# PECL memcache 8.2 still includes ext/standard/php_smart_string.h, removed in PHP 8.5.
RUN set -xe; \
    apk --no-cache update && apk --no-cache upgrade \
    && apk add --no-cache git openssh supervisor \
    && curl -fsSL -o /tmp/memcache-8.2.tgz https://pecl.php.net/get/memcache-8.2.tgz \
    && tar -xzf /tmp/memcache-8.2.tgz -C /tmp \
    && mv /tmp/package.xml /tmp/memcache-8.2/package.xml \
    && sed -i \
        -e 's|#include "ext/standard/php_smart_string_public.h"|#include "Zend/zend_smart_string.h"|' \
        -e '/#include "ext\/standard\/php_smart_string.h"/d' \
        /tmp/memcache-8.2/src/memcache_pool.h \
        /tmp/memcache-8.2/src/memcache_pool.c \
        /tmp/memcache-8.2/src/memcache_session.c \
        /tmp/memcache-8.2/src/memcache_ascii_protocol.c \
        /tmp/memcache-8.2/src/memcache_binary_protocol.c \
    && sed -i 's/ md5sum="[a-f0-9]*"//g' /tmp/memcache-8.2/package.xml \
    && install-php-extensions gd mysqli pdo_mysql pgsql pdo_pgsql zip intl opcache exif imagick \
        /tmp/memcache-8.2 \
        memcached inotify apcu @composer \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/cache/apk/*

ADD supervisord.conf /etc/supervisord.conf
ADD crontab /crontab.txt
RUN /usr/bin/crontab /crontab.txt

STOPSIGNAL SIGQUIT
EXPOSE 9000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
