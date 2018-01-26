#!/usr/bin/sh
#author : jasonliu

#判断当前Python版本
v=`python --version`
if [ -e /usr/local/bin/python3.6 ];then 
  echo 当前版本$v ，不用升级！
  exit

else
echo 当前版本$v，版本过低！
read -p 回车开始升级！

#下载系统依赖
yum -y install wget sqlite-devel xz gcc automake zlib-devel openssl-devel readline-devel

#下载源码包
cd /opt/
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

fi


#返回token与主文件
token=python_done
./main.sh $token
