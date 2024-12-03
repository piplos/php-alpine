FROM piplosmedia/php-fpm:7.2

# Install XDebug.
RUN set -xe; \
    apk --no-cache update && apk --no-cache upgrade \
    && install-php-extensions xdebug \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/cache/apk/*