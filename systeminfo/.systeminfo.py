#!/usr/bin/python
#-*-coding:utf-8-*-

import platform
import psutil
from pprint import pprint as pp
from collections import OrderedDict

print('\n******欢迎使用KAOS信息获取程序******')

#获取系统信息
print('\n【操作系统信息】')
print('操作系统名称及版本：',platform.platform())
print('操作系统位数：', platform.architecture())
print('架构类型：', platform.machine() )

#获取CPU时间
print("\n【CPU信息】")
cputime = psutil.cpu_times()    #cpu时间获取方法
cpucount = psutil.cpu_count()   #cpu数量
print("用户使用时间：%s ms"%cputime.user)
print("系统使用的时间：%s ms"%cputime.system)
print("idle时间：%s ms"%cputime.idle)
print("iowait时间：%s ms" %cputime.iowait)

def CPUinfo():  #定义一个函数打开/proc/cpuinfo读取型号信息
    CPUinfo = OrderedDict()
    procinfo = OrderedDict()
    nprocs = 0
    with open('/proc/cpuinfo') as f :
        for line in f :
            if not line.strip():
                CPUinfo['proc%s' % nprocs ] = procinfo
                nprocs = nprocs + 1
                procinfo = OrderedDict()
            else:
                if len(line.split(':')) == 2:
                    procinfo[line.split(':')[0].strip()] = line.split(':')[1].strip()
                else:
                    procinfo[line.split(':')[0].strip()] = ''
    return CPUinfo
print('处理器数量和型号: ')
CPUinfo = CPUinfo()
for processor in CPUinfo.keys():
        print(CPUinfo[processor]['model name'])
#获取mem信息
print("\n【内存信息】")
mem =  psutil.virtual_memory()
t = 1024* 1024 *1024    #单位换算比例
print("总内存为：%.2f GB"%(mem.total / t))
print("可用内存为：%.2f GB"%(mem.available / t))
print("已使用: %.2f GB"%(mem.used / t))
print("已使用占比：%s %%"%(mem.percent))

#获取网卡信息
print("\n【网卡信息】")
net = psutil.net_if_addrs()
netlist = list(net.keys())
print("网卡列表：",netlist)
print("%s 网卡信息："  % netlist[1] ,net.get(netlist[1])[0][1:3])

#获取根目录使用情况
print("\n【根目录使用情况】")
disk = psutil.disk_usage('/')
print("总量：%.2f GB" % (disk.total / t))
print("已使用：%.2f GB" % (disk.used / t))
print("空闲：%.2f GB" % (disk.free / t ))
print("使用率： %s %%" % disk.percent)

#获取进程
print("\n【进程情况】")
pids = psutil.pids()
print("现有进程数：",len(pids))
t1 = ([(p.pid, p.info) for p in sorted(psutil.process_iter(attrs=['name', 'memory_percent']), key=lambda p: p.info['memory_percent'])][-3:])
i = 0
while i < 3 :
    print("最占用内存进程之%s: PID:%s\t名字:%s\t内存使用率:%.2f %%" % (i+1, t1[i][0],t1[i][1]['name'],t1[i][1]['memory_percent']))
    i+=1

