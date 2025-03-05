# 📚 Perpusku GC - Dockerized

## 📌 Overview
Project ini merupakan aplikasi perpustakaan yang berjalan menggunakan PHP 7.2 dan Laravel. Anda diminta untuk menyiapkan lingkungan menggunakan Docker dan Docker Compose agar aplikasi berjalan tanpa langkah manual.

## 🚀 Requirements
- Docker
- Docker Compose

## 🏗️ Task
Buatlah konfigurasi Docker yang memenuhi kriteria berikut:

## Clue
- Use PHP 7.2
- Run Command composer update (in directory perpus)
- Copy .env.example cp .env.example .env
- Run Command php artisan key:generate to generate APP_KEY in .env
- Make sure you have database perpusku_gc
- Setting database configuration in .env
- Run Command php artisan migrate
- Also Run Command php artisan db:seed
- Make sure no manual steps are executed. to overcome that you can create a bash script which will be run when the container runs.

## 📜 Submission
Kumpulkan file `Dockerfile`, `docker-compose.yml`, dan (optional) Bash script yang digunakan untuk menjalankan otomatisasi setup.

## Login testing
**Login admin**
- username : admin123
- password : admin123

**Login user**
- username : user123
- password : user123

