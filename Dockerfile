FROM trafex/php-nginx
USER root

RUN apk add postgresql-dev php-pgsql php8-pgsql


ENV WEBROOT_DIR=/var/www/html \
    DATA_DIR=/data \
    ETC_DIR=/etc/etc \
    LOG_DIR=/var/log

ADD ./assets ${ETC_DIR}
RUN chmod +x ${ETC_DIR}/build/install && ${ETC_DIR}/build/install
USER nobody
