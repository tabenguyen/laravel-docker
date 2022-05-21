#!/bin/sh
set -e

if [[ "$1" == "true" ]]
then
    docker-php-ext-enable xdebug && \
    echo "zend_extension=xdebug" > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    echo "xdebug.connect_timeout_ms=200" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    echo "xdebug.start_with_request=true" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    echo "xdebug.mode=develop,trace,debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
else
    # Off XDebug
    if [[ -f "/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini" ]]
    then
        mv /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini.example
    fi
fi

echo "Restarting PHP-FPM"
supervisorctl restart php-fpm