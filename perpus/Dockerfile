FROM php:7.2
WORKDIR /var/www/html

# Salin semua file proyek ke dalam container
COPY . /var/www/html

RUN apt-get update -y && apt-get install -y \
    libicu-dev \
    libmariadb-dev \
    unzip zip \
    zlib1g-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    default-mysql-client

# PHP Extension
RUN docker-php-ext-install gettext intl pdo_mysql gd mysqli

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Jalankan composer update untuk menginstal dependensi proyek
RUN composer update

# Salin file .env.example ke .env
RUN cp .env.example .env

# Generate Laravel application key
RUN php artisan key:generate

RUN chmod -R 777 storage bootstrap/cache

# Copy entrypoint script & beri izin eksekusi
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Exposing port 8000 (optional)
EXPOSE 8000

# Executing shell command
ENTRYPOINT [ "/docker-entrypoint.sh" ]

# RUN COMMAND php artisan serve in container automatically
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]