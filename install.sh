#!/bin/sh
read -p "一键SD安装程序. [y/n]: " sinstall
if [ $sinstall == 'y' ]; then
echo "start......"
else 
exit
fi

read -p "一键PHP7安装.注意！已安装php7执行该脚本会初始化php.ini ? [y/n]: " sinstall
if [ $sinstall == 'y' ]; then
echo "start......"
basepath=$(pwd)/php-install.sh
sh $basepath;
basepath=$(pwd)/export.sh
sh $basepath
else
continue
fi

read -p "一键swoole. ? [y/n]: " sinstall
if [ $sinstall == 'y' ]; then
echo "start......"
basepath=$(pwd)/swoole-install.sh
sh $basepath
else
continue
fi

read -p "一键SD初始化. ? [y/n]: " sinstall
if [ $sinstall == 'y' ]; then
echo "start......"
basepath=$(pwd)/sd-install.sh
sh $basepath
else
exit
fi


