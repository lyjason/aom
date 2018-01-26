#!/usr/bin/sh
#author=jasonliuu@qq.com

#定义安装函数
install ()
{
yum install java-1.8.0-openjdk.x86_64 -y
}

install_tomcat ()
{
wget -P http://mirrors.shu.edu.cn/apache/tomcat/tomcat-9/v9.0.4/bin/apache-tomcat-9.0.4.zip /opt
}

echo -e "\n即将开始安装java开发环境\n"
read -p "回车开始安装！"
install

read -p "是否下载tomcat?[y/N]" tc
case tc in
	*) echo -e "\n未下载Tomcat\n"
	;;
	y)
	install_tomcat
	echo -e "\napache-tomcat-9.0.4.zip已下载至/opt目录下\n"
	;;
	n) echo -e "\n未下载Tomcat\n"
esac

token=java_done

./main.sh $token
