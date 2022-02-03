FROM webdevops/php-nginx:7.2-alpine

RUN apk add postgresql-dev php-pgsql php7-pgsql

#for apple m1 silicon
#RUN set -eux; \
#  wget --quiet -O /usr/local/bin/go-replace https://github.com/webdevops/goreplace/releases/#download/1.1.2/gr-arm64-linux; \
# chmod +x /usr/local/bin/go-replace;

ENV WEB_DOCUMENT_ROOT=/app \
    ETC_DIR=/etc/etc \
    LOG_DIR=/var/log

ADD ./assets ${ETC_DIR}
RUN chmod +x ${ETC_DIR}/build/install && ${ETC_DIR}/build/install
