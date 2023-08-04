#!/bin/bash
###
 # @Author: 王丽兵
 # @Date: 2022-08-12 08:51:25
 # @LastEditTime: 2022-08-22 16:19:22
 # @LastEditors: 王丽兵
 # @Description: 检查依赖软件是否安装
 # @FilePath: /deploymentScript/acs-devops/package-acs/common/checkDependence.sh
### 

# 检测 curl 是否安装
function checkCurlIsInstall(){
    if [ `command -v curl` ];then
        greenEcho curl已经安装
    else
        redEcho curl未安装
    fi
}

# 检测 docker 是否安装
function checkDockerIsInstall(){
    if [ `command -v docker` ];then
        greenEcho docker已经安装
    else
        redEcho docker未安装
    fi
}

# 检测 wget 是否安装
function checkWgetIsInstall(){
    if [ `command -v wget` ];then
        greenEcho wget已经安装
    else
        redEcho wget未安装
    fi
}

# 检测 unzip 是否安装
function checkUnzipIsInstall(){
    if [ `command -v unzip` ];then
        greenEcho unzip已经安装
    else
        redEcho unzip未安装
    fi
}

# 检测 yq 是否安装
function checkYqIsInstall(){
    if [ `command -v yq` ];then
        greenEcho yq已经安装
    else
        redEcho yq未安装
    fi
}

# 检测 git 是否安装
function checkGitIsInstall(){
    if [ `command -v git` ];then
        greenEcho git已经安装
    else
        redEcho git未安装
    fi
}



