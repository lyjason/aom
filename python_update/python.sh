#!/usr/bin/sh
#author : jasonliu

#下载系统依赖
yum -y install wget sqlite-devel xz gcc automake zlib-devel openssl-devel readline-devel

#下载源码包
wget http://mirrors.sohu.com/python/3.6.4/Python-3.6.4.tgz

#解压安装
tar -xvf Python-3.6.4.tgz
cd Python-3.6.4
./configure
make 
make install

#修改文件指向
sed -i '1c #!/usr/bin/python2' /usr/bin/yum
sed -i '1c #!/usr/bin/python2' /usr/libexec/urlgrabber-ext-down
sed -i '1c #!/usr/bin/python2 -Es' /usr/bin/firewall-cmd

#做一个软连接让新Python可用
ln -sb /usr/local/bin/python3.6 /usr/bin/python

#测试
echo -e "\n当前Python版本：" `python --version`
