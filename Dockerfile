FROM webdevops/php-apache:8.2

WORKDIR /app

RUN apt-get update && apt-get install -y wget tar \
    && wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz \
    && tar -xvzf dokuwiki-stable.tgz \
    && mv dokuwiki-*/* /app \
    && rm dokuwiki-stable.tgz

# Permissões
RUN chown -R application:application /app
