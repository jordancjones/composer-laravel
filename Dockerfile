FROM alpine:3.6

MAINTAINER "Jordan Jones" <jordancjones@gmail.com>

RUN apk --update add \
  wget \
  curl \
  git \
  php7 \
  php7-curl \
  php7-openssl \
  php7-json \
  php7-phar \
  php7-dom \
  php7-pdo \
  php7-pgsql \
  php7-pdo_pgsql \
  php7-ctype \
  php7-mysqlnd \
  php7-pdo_sqlite 
  php7-sqlite3 \
  php7-mcrypt \
  php7-xml \
  php7-ctype \
  php7-gd \
  php7-zlib \
  php7-iconv \
  php7-session \
  php7-tokenizer \
  php7-zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN mkdir -p /var/www

WORKDIR /var/www

VOLUME /var/www

RUN composer self-update

CMD ["bash"]

ENTRYPOINT ["composer"]
CMD ["--help"]
