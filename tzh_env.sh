#!/bin/bash

# 参考一键pwn环境 "Github : https://github.com/giantbranch/pwn-env-init"
# 注意切换目录后记得切换回 cd ~ 切换回来 

# 以调试的方式执行shell ，只识别定义过的变量，同时脚本传回值非0 直接结束shell
set -eux

# 到用户目录下
cd ~/

# 修改软件源==================================================================================

# 下面的实现回车即yes
# apt源
echo "需要root权限！！ 修改apt源为科大源(Y/n)？"
read input
if [[ $input = "n" ]] || [[ $input = "N" ]]; then
    echo "apt源保持不变"
else
    # 下面这个是用了替换  archive.ubuntu.com替换为mirrors.ustc.edu.cn
    sudo  sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
    echo "apt源修改为科大源"

    sudo apt-get update
    echo "运行apt-get update结束"
fi



# deb-src源码源
echo "需要root权限！！ 启用apt中的deb-src源码源(Y/n)？"
read input
if [[ $input = "n" ]] || [[ $input = "N" ]]; then
    echo "保持注释源码镜像以提高apt update速度，如有需要可自行取消注释"
else
    # source.list中有deb包的源和deb-src源码源 
    # 默认注释了源码镜像以提高apt update速度，如有需要可自行取消注释。
    sudo sed -i 's/# deb-src/deb-src/' "/etc/apt/sources.list"
fi


# pip源
echo "修改本用户pip源为豆瓣源(Y/n)？"
read input
if [[ $input = "n" ]] || [[ $input = "N" ]]; then
    echo "未修改pip源"
else
    # -d 判断目录是否存在
    if [ ! -d ~/.pip ]; then
        mkdir ~/.pip
    fi
    echo -e "[global]\nindex-url = https://pypi.douban.com/simple/\n[install]\ntrusted-host = pypi.douban.com" >  ~/.pip/pip.conf
    echo "修改本用户pip源为豆瓣源成功"
fi

# 修改软件源===============================================================================================




# pwn环境==================================================================================================
echo "需要root权限！！ 设置pwn环境(Y/n)？"
read input
if [[ $input = "n" ]] || [[ $input = "N" ]]; then
    echo "不设置pwn环境"
else
    # 支持32位，dpkg加上后需要update更新
    dpkg --add-architecture i386
    sudo apt-get update
    # sudo apt-get -y install lib32z1
    sudo apt-get -y install libc6-i386

    # gdb安装
    sudo apt-get -y install gdb
    # 安装 pwndbg
    git clone https://github.com/pwndbg/pwndbg
    cd pwndbg
    ./setup.sh
    cd ~

    # 安装 peda
    git clone https://github.com/longld/peda.git ~/peda
    echo "source ~/peda/peda.py" >> ~/.gdbinit

    # download the libc source to current directory(you can use gdb with this example command: directory ~/glibc-2.24/malloc/)
    sudo apt-get source libc6-dev
    # 安装 pwntools
    sudo apt-get -y install python3 python3-pip
    pip3 install pwntools

    # 安装one_gadget
    sudo apt-get -y install ruby
    sudo gem install one_gadget

    # 安装 libc-database
    git clone https://github.com/niklasb/libc-database.git ~/libc-database
    echo "Do you want to download libc-database now(Y/n)?"
    read input
    if [[ $input = "n" ]] || [[ $input = "N" ]]; then
        echo "you can cd ~/libc-database and run ./get to download the libc at anytime you want"
    else
        cd ~/libc-database && ./get
        cd ~
    fi
fi
# pwn环境==================================================================================================

# 常用软件安装
echo "配置.vimrc"
cd ~
# -O直接覆盖已有的文件
wget https://raw.githubusercontent.com/fengshansi/script_collect/main/.vimrc -O .vimrc

echo "需要root权限！！ 配置zsh(Y/n)？"
read input
if [[ $input = "n" ]] || [[ $input = "N" ]]; then
    echo "未配置zsh"
else
    # -d 判断目录是否存在
    sudo apt-get -y install zsh
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
    echo "配置zsh成功，请手动配置.zshrc"
fi

# 待做
# screen

echo "========================================="
echo "=============Good, Enjoy it.============="
echo "========================================="

