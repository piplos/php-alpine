FROM php:8.3-fpm-alpine

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

RUN set -xe; \
    apk --no-cache update && apk --no-cache upgrade \
    && apk add --no-cache git openssh supervisor \
    && install-php-extensions gd mysqli pdo_mysql pgsql pdo_pgsql zip intl opcache exif imagick memcache inotify @composer \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/cache/apk/*

ADD supervisord.conf /etc/supervisord.conf
ADD crontab /crontab.txt
RUN /usr/bin/crontab /crontab.txt

STOPSIGNAL SIGQUIT
EXPOSE 9000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]