#!/bin/bash
###
 # @Author: 王丽兵
 # @Date: 2022-07-13 10:25:57
 # @LastEditTime: 2022-08-24 17:40:26
 # @LastEditors: 王丽兵
 # @Description: 输出带颜色的字
 # @FilePath: /deploymentScript/acs-devops/package-acs/common/color.sh
### 
# 输出带颜色的字
## blue to echo 
function blueEcho(){
    echo -e "\033[34m $1 \033[0m"
}

## green to echo 
function greenEcho(){
    echo -e "\033[32m $1 \033[0m"
}

## Error to warning with blink
function bredEcho(){
    echo -e "\033[31m\033[01m\033[05m $1 \033[0m"
}

## Error
function redEcho(){
    echo -e "\033[31m\033[01m $1 \033[0m"
}

## warning
function yellowEcho(){
    echo -e "\033[43;37m $1 \033[0m"
}