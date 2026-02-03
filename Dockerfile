FROM php:8.2-cli

WORKDIR /app

# Herramientas que Composer necesita + extensión zip
RUN apt-get update \
 && apt-get install -y git unzip libzip-dev \
 && docker-php-ext-install zip \
 && rm -rf /var/lib/apt/lists/*

# Instalar Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
 && rm composer-setup.php
