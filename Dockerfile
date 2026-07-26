FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    wget \
    tar \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mbstring xml

WORKDIR /var/www/html

RUN wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz \
    && tar -xvzf dokuwiki-stable.tgz \
    && mv dokuwiki-*/* . \
    && rm dokuwiki-stable.tgz

RUN chown -R www-data:www-data /var/www/html

