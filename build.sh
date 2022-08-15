docker build -t tabenguyen/laravel-php-8.1:latest -f Dockerfile-php8.1-fpm-alpine .
docker run --rm tabenguyen/laravel-php-8.1:latest
docker push tabenguyen/laravel-php-8.1:latest