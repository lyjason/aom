#!/usr/bin/sh
#author:jasonliuu@qq.com

# 返回值与主文件
re (){
token=lamp_done
./main.sh $token
}

install ()
{
#安装http
echo -e "\n安装http，请稍等...\n"
sleep 5s
yum install httpd -y

#安装mysql
echo -e "\n安装mysql，请稍等...\n"
sleep 5s
yum install mariadb mariadb-server mariadb-devel -y

#安装php
echo -e "\n安装php，请稍等...\n"
sleep 5s
yum -y install php-gd php-mysql php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap curl curl-devel php 
}

echo -e "\n即将开始安装lamp环境，整个过程持续5分钟左右，请耐心等待！\n"
read -p '回车开始安装！'
install
#收场
echo -e "\n【lamp组件已安装完毕】\n"
echo -e "1.初始化数据库\n2.返回菜单"
read -p "请输入：" n
case $n in
  1) 
  systemctl start mariadb
  mysql_secure_installation
  ;;
  2) re
  ;;
esac


