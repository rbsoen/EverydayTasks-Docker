FROM trafex/php-nginx:3.4.0
USER root
RUN apk --no-cache add php82-pdo_mysql
COPY ./EverydayTasks /var/www/html
COPY ./config/app/config.php /var/www/html/config.php
RUN chmod -R 777 /var/www/html # !
USER nobody
