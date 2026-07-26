FROM php:8.2-apache

# Instalar dependências necessárias para GD e outras extensões
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    wget \
    tar \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mbstring xml

# Pasta padrão do Apache
WORKDIR /var/www/html

# Baixar e instalar o DokuWiki
RUN wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz \
    && tar -xvzf dokuwiki-stable.tgz \
    && mv dokuwiki-*/* . \
    && rm dokuwiki-stable.tgz

# Permissões
RUN chown -R www-data:www-data /var/www/html
