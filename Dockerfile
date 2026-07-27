FROM php:8.1-apache

# Instalar wget e tar
RUN apt-get update && apt-get install -y wget tar

# Pasta padrão do Apache
WORKDIR /var/www/html

# Baixar e instalar o DokuWiki
RUN wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz \
    && tar -xvzf dokuwiki-stable.tgz \
    && mv dokuwiki-*/* . \
    && rm dokuwiki-stable.tgz

# Permissões
RUN chown -R www-data:www-data /var/www/html
