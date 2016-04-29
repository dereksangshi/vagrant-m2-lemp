#!/usr/bin/env bash

#sudo -i;

apt-get update;

apt-get install --yes \
  git \
  bison \
  autoconf \
  libltdl-dev \
  libbz2-dev \
  libxml2-dev \
  libxslt1-dev \
  libpspell-dev \
  libenchant-dev \
  libmcrypt-dev \
  libpng-dev \
  libjpeg8-dev \
  libfreetype6-dev \
  libmysqlclient-dev \
  libcurl4-openssl-dev;

mkdir --parents /usr/local/php7;
mkdir --parents /etc/php7/conf.d;
mkdir --parents /etc/php7/cli/conf.d;
mkdir --parents /etc/php7/fpm/conf.d;
mkdir --parents --mode=777 /var/log/php7;

git clone https://github.com/php/php-src /usr/local/src/php7 --branch=php-7.0.2 --depth=1;

cd /usr/local/src/php7;
./buildconf --force;

php_configure_args=" \
  --prefix=/usr/local/php7 \
  \
  --with-bz2 \
  --with-zlib \
  --enable-zip \
  \
  --with-mcrypt \
  --with-openssl \
  \
  --with-curl \
  --enable-ftp \
  --with-mysqli \
  --enable-sockets \
  --enable-pcntl \
  \
  --with-pspell \
  --with-enchant \
  --with-gettext \
  \
  --with-gd \
  --enable-exif \
  --with-jpeg-dir \
  --with-png-dir \
  --with-freetype-dir \
  \
  --with-xsl \
  --enable-bcmath \
  --enable-mbstring \
  --enable-calendar \
  \
  --enable-sysvmsg \
  --enable-sysvsem \
  --enable-sysvshm \
";
./configure $php_configure_args \
  --with-config-file-path=/etc/php7/cli \
  --with-config-file-scan-dir=/etc/php7/cli/conf.d;
make && make install && make clean;

./configure $php_configure_args \
  --disable-cli --enable-fpm \
  --with-fpm-user=www-data \
  --with-fpm-group=www-data \
  --with-config-file-path=/etc/php7/fpm \
  --with-config-file-scan-dir=/etc/php7/fpm/conf.d;
make && make install && make clean;

ln --symbolic /usr/local/php7/bin/php /usr/bin/php;
ln --symbolic /usr/local/php7/sbin/php-fpm /usr/sbin/php-fpm;

echo 'zend_extension=opcache.so' > /etc/php7/conf.d/opcache.ini;
ln --symbolic /etc/php7/conf.d/opcache.ini /etc/php7/cli/conf.d/opcache.ini;
ln --symbolic /etc/php7/conf.d/opcache.ini /etc/php7/fpm/conf.d/opcache.ini;