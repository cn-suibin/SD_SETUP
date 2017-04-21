# 安装jemalloc
tar -xvf jemalloc-4.0.4.tar.bz2
cd jemalloc-4.0.4
./configure
sudo make -j install
ln -s /usr/local/lib/libjemalloc.so.2 /usr/lib
sudo ldconfig 
cd ..
# 先安装hiredis
tar -xvf hiredis-0.13.3.gz 
cd hiredis-0.13.3
sudo make -j
sudo make install
ln -s /usr/local/lib/libhiredis.so.0.13 /usr/lib
sudo ldconfig
cd ..
# 编译swoole
tar -xvf swoole.gz
cd swoole
phpize
./configure --enable-async-redis --enable-jemalloc
make clean
make -j
sudo make install
cd ..
new_export="extension=swoole.so"
reg_str="^\s*extension=swoole.so"
if grep -q $reg_str /usr/local/php7/etc/php.ini
then
echo "is exist!"
else
    echo "extension=swoole.so" >>/usr/local/php7/etc/php.ini
fi



# 安装composer
#basepath=$(pwd)/php-install.sh
#echo $basepath;
#sh $basepath;
#basepath=$(pwd)/export.sh
#sh $basepath
