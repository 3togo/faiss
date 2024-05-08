#!/bin/bash

# 检查是否以root权限运行
if [ "$(id -u)" != "0" ]; then
   echo "此脚本必须以root权限运行" 1>&2
   exit 1
fi

# 从apt_requirements.txt文件中读取软件包名称并安装
while IFS= read -r pkg
do
    sudo apt install "$pkg"
done < "apt_requirements.txt"

