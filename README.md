piplos/php-alpine
======================
[![Build, test and publish images](https://github.com/piplos/php-alpine/actions/workflows/build.yml/badge.svg)](https://github.com/piplos/php-alpine/actions/workflows/build.yml)

## How to use
- For Prod version: **piplosmedia/php-fpm:**_version_
- For Develop version: **piplosmedia/php-fpm:**_version_**-dev**

## PHP-fpm versions:
**7.2**, **8.0**, **8.1**, **8.2**, **8.3**, **8.4**
## Docker hubs:
https://hub.docker.com/r/piplosmedia/php-fpm


## Docker compose:
```
services: 
  php: 
    image: piplosmedia/php-fpm:8.3  
    restart: always  
    volumes:  
      - ./crontab:/crontab.txt  
    command: /bin/sh -c "/usr/bin/crontab /crontab.txt && /usr/bin/supervisord -c /etc/supervisord.conf"  
    logging:  
      driver: "json-file"  
      options:  
        max-size: "50m"
```
