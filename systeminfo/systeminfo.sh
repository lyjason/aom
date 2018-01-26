#!/usr/bin/bash
#-*-coding:utf-8-*-

if [ -a /usr/local/bin/python3 ] ; then
    echo -e "\n当前Python版本为:" `python --version` "\n"
else
    echo 请升级Python版本至3
    exit
fi

if [ -a /usr/local/bin/pip3.6  ];then
    echo -e "pip已经安装\n"
    sleep 1
else
    echo -e "pip没有安装，正在安装pip...\n"
    sleep 1
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python get-pip.py
fi

echo -e "正在安装依赖组件...\n"
sleep 1
/usr/local/bin/pip3.6 install psutil
echo -e "\n组件安装完毕!\n"
sleep 1
read -p "系统环境就绪，按回车继续!"
./.systeminfo.py
