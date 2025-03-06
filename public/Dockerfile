FROM php:7.4-apache

# Instalar dependencias de Composer
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev zip git && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copiar el proyecto al contenedor
COPY . /var/www/html/

# Establecer permisos adecuados
RUN chown -R www-data:www-data /var/www/html

# Instalar las dependencias de Composer
WORKDIR /var/www/html
RUN composer install

# Exponer el puerto
EXPOSE 8000

# Habilitar el módulo de reescritura de Apache
RUN a2enmod rewrite

# Iniciar Apache
CMD ["apache2-foreground"]
