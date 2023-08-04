#!/bin/bash
###
 # @Author: 王丽兵
 # @Date: 2022-07-13 10:26:15
 # @LastEditTime: 2022-09-07 10:42:12
 # @LastEditors: 王丽兵
 # @Description: 
 # @FilePath: /deploymentScript/acs-devops/package-acs/common/io.sh
### 

# 判断目录是否存在
function directoryIsExist(){
    if [ ! -d "$1"]; then
        return false
    else
        return true
    fi
}

# 判断文件是否存在
function fileIsExist(){
    if [ ! -f "$1" ]; then
        redEcho "$1 不存在"
    else
        greenEcho "$1 存在"
    fi
}

# 批量检测指定目录中的文件是否存在
function checkFilesIsExist(){
    # 文件目录
    dir=$1
    # 文件数组
    fileArr=$2
    
    # 判断目录是否为空
    if [ -d $dir ]; then
    :
    else
        redEcho "$1 目录不存在"
        exit 1
    fi
    # 循环判断文件是否存在
    for value in ${fileArr[@]}
    do
        checkFileIsExist $dir$value
    done    
}