# 定义安装目录位置的变量
cassdk_path=/usr/local/php7/bin:/usr/local/php7/sbin
# 定义要在profile中搜索的行
new_export="export PATH=$cassdk_path:\$PATH"
# 将搜索行中转为正则表达式
reg_str="^\s*export\s*PATH=$cassdk_path:\$PATH"
# 先用grep查找profile是否已经有了指定的语句，如果有，则就不需要再添加了
if grep -q $reg_str /etc/profile
then
echo $cassdk_path exists in PATH,skip
else    
    # 直接在profile末尾添加新行 
    echo $new_export >> /etc/profile
fi
source /etc/profile
# 显示export语句
grep $reg_str /etc/profile
