# 安装sd
tar -xvf inotify-2.0.0.tgz
cd inotify-2.0.0
phpize
./configure
sudo make && make install
cd ..

new_export="extension=inotify.so"
reg_str="^\s*extension=inotify.so"
if grep -q $reg_str /usr/local/php7/etc/php.ini
then
echo "is exist!"
else
    echo "extension=inotify.so" >>/usr/local/php7/etc/php.ini
fi
# 安装docker
yum install -y epel-release
yum install -y docker-io # 安装docker
# 配置文件 /etc/sysconfig/docker

chkconfig docker on  # 加入开机启动
service docker start # 启动docker服务
