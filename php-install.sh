#!/bin/bash
yum install libxml2-devel libcurl-devel libjpeg-devel libpng-devel freetype-devel libmcrypt-devel openssl openssl-devel -y
tar -xvf php7.1.gz
cd php-7.1.1
./configure \
--prefix=/usr/local/php7 \
--exec-prefix=/usr/local/php7 \
--bindir=/usr/local/php7/bin \
--sbindir=/usr/local/php7/sbin \
--includedir=/usr/local/php7/include \
--libdir=/usr/local/php7/lib/php \
--mandir=/usr/local/php7/php/man \
--with-config-file-path=/usr/local/php7/etc \
--with-mysql-sock=/var/run/mysql/mysql.sock \
--with-mcrypt=/usr/include \
--with-mhash \
--with-openssl \
--with-mysql=shared,mysqlnd \
--with-mysqli=shared,mysqlnd \
--with-pdo-mysql=shared,mysqlnd \
--with-gd \
--with-iconv \
--with-zlib \
--enable-zip \
--enable-inline-optimization \
--disable-debug \
--disable-rpath \
--enable-shared \
--enable-xml \
--enable-bcmath \
--enable-shmop \
--enable-sysvsem \
--enable-mbregex \
--enable-mbstring \
--enable-ftp \
--enable-gd-native-ttf \
--enable-pcntl \
--enable-sockets \
--with-xmlrpc \
--enable-soap \
--without-pear \
--with-gettext \
--enable-session \
--with-curl \
--with-jpeg-dir \
--with-freetype-dir \
--enable-opcache \
--enable-fpm \
--enable-fastcgi \
--without-gdbm \
--disable-fileinfo
make -j2 && make install -j2
cp php.ini-production /usr/local/php7/etc/php.ini

new_export="export PATH=/usr/local/php7/bin:/usr/local/php7/sbin:$PATH"
reg_str="^\s*export PATH=/usr/local/php7/bin:/usr/local/php7/sbin:$PATH"
if grep -q $reg_str /etc/profile
then
echo "is exist!"
else
    echo "export PATH=/usr/local/php7/bin:/usr/local/php7/sbin:$PATH" >>/etc/profile
fi
source /etc/profile
cd ..
tar -xvf phpredis.gz
cd phpredis
./configure 
sudo make -j
sudo make install
new_export="extension=redis.so"
reg_str="^\s*extension=redis.so"
if grep -q $reg_str /usr/local/php7/etc/php.ini
then
echo "is exist!"
else
    echo "extension=redis.so" >>/usr/local/php7/etc/php.ini
fi

cd ..

