# Usa una imagen base de PHP con Apache
FROM php:7.4-cli

# Instala las dependencias necesarias
RUN apt-get update && apt-get install -y \
    libpcre3-dev \
    curl \
    git \
    && docker-php-ext-install pdo_mysql

# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copiar los archivos del proyecto al contenedor
COPY . /var/www/html

# Establecer el directorio de trabajo
WORKDIR /var/www/html

# Ejecutar composer install para instalar las dependencias de PHP
RUN composer install

# Exponer los puertos para el servidor WebSocket (8080) y el servidor PHP (8000)
EXPOSE 8000

# Comando de inicio del contenedor
CMD cd public && php -S 0.0.0.0:8000
