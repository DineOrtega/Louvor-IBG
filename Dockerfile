FROM php:8.2-apache

RUN apt-get update && apt-get install -y wget tar \
    && docker-php-ext-install mbstring gd xml

WORKDIR /var/www/html

RUN wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz \
    && tar -xvzf dokuwiki-stable.tgz \
    && mv dokuwiki-*/* . \
    && rm dokuwiki-stable.tgz

RUN chown -R www-data:www-data /var/www/html