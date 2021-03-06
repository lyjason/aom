#!/usr/bin/sh
#author:jasonliuu@qq.com

#安装系统基本软件
yum install vim git net-tools nc  -y

#修改vi的关联
echo "alias vi='vim'" >> /etc/bashrc
bash /etc/bashrc

#升级系统yum库
echo -e '\n'
read -p '【【即将升级系统软件，整个过程需要约5分钟。回车继续...】】'
yum upgrade -y

#防火墙，selinux关闭
systemctl stop firewalld
systemctl disable firewalld
setenforce 0
sed -i 's/^SELINUX=enforcing/SELINUX=disable/' /etc/selinux/config

#返回值与主文件
token=env_done
./main.sh $token
