#!/usr/bin/sh
#author:jasonliuu@qq.com

#安装系统基本软件
yum install vim git -y

#修改vi的关联
echo "vi='vim'" >> /etc/bashrc
source /etc/bashrc

#升级系统yum库
echo -e '\n'
read -p '【【即将升级系统软件，整个过程需要约5分钟。回车继续...】】'
yum upgrade -y

#防火墙，selinux关闭
systemctl stop firewalld
systemctl disable firewalld
setenforce 0
sed -i 's/^SELINUX=enforcing/SELINUX=disable/' /etc/selinux/config
