# Utiliza una imagen base de PHP con Apache
FROM php:7.4-apache

# Instala las extensiones de PHP necesarias
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copia los archivos del proyecto al contenedor
COPY . /var/www/html/

# Otorga permisos adecuados a la carpeta del proyecto
RUN chown -R www-data:www-data /var/www/html

# Expone el puerto 80
EXPOSE 80
