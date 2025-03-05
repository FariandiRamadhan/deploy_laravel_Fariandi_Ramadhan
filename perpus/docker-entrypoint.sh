#!/bin/sh

# Tunggu database siap sebelum migrate
echo "Waiting for database..."
while ! mysqladmin ping -h mysql_db --silent; do
    sleep 5
done
echo "Database is ready!"

# Cek apakah tabel lain selain 'migrations' sudah ada
TABLE_COUNT=$(php artisan tinker --execute='echo count(DB::select("SHOW TABLES")) > 1 ? "1" : "0";')

if [ "$TABLE_COUNT" = "1" ]; then
    echo "Database already migrated, skipping..."
else
    echo "Running migrations and seeding..."
    
    # Jalankan migrate dan hentikan jika gagal
    php artisan migrate --force

    # Jalankan seeding
    php artisan db:seed --force
fi

# Jalankan perintah default (misalnya Laravel serve)
exec "$@"