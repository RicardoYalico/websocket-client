# Usa una imagen base de PHP con Apache
FROM php:7.4-cli

# Instala las dependencias necesarias
RUN apt-get update && apt-get install -y \
    libpcre3-dev \
    && docker-php-ext-install pdo_mysql

# Copiar los archivos del proyecto al contenedor
COPY . /var/www/html

# Establecer el directorio de trabajo
WORKDIR /var/www/html

# Exponer los puertos para el servidor WebSocket (8080) y el servidor PHP (8000)
EXPOSE 8080


# # Copiar el archivo de inicio al contenedor
# COPY start.sh /usr/local/bin/start.sh

# # Hacer el script ejecutable
# RUN chmod +x /usr/local/bin/start.sh

# # Comando de inicio del contenedor
# CMD ["start.sh"]

CMD cd public && php -S 0.0.0.0:8000

