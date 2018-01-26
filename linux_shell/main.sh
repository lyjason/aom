#!/usr/bin/sh
#author:jasonliuu@qq.com

#主菜单函数
main ()
{
echo -e "\n1.Python升级\n2.lamp环境搭建\n3.java环境安装\n4.基础环境升级\n"
read -p "请选择：" op1
}

#每次打开检查是否有返回值
case $1 in
  java_done)
    echo -e "\njava环境已经安装完毕！\n"
    read -p '是否继续安装其他组件? [y/n]' op
  ;;
  lamp_done)
    echo -e "\nlamp环境已搭建完毕！\n"
    read -p '是否继续安装其他组件? [y/n]' op
  ;;
  python_done)
    echo -e "\nPython已成功升级！\n"
    read -p '是否继续安装其他组件? [y/n]' op
  ;;
  env_done)
    echo -e "\n基础环境升级完毕\n"
    read -p '是否继续安装其他组件? [y/n]' op
  ;;
  *)
    main
  ;;
esac

#检查后续操作是否继续
if [ -n $op ];then
case $op in
  y) main
  ;;
  n) exit 0
  ;;
esac
fi
#执行具体功能
case $op1 in
  1) ./python.sh
  ;;
  2) ./lamp.sh
  ;;
  3) ./java.sh
  ;;
  4) ./env.sh
  ;;
esac

