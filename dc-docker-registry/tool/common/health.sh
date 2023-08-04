#!/bin/bash
###
 # @Author: 王丽兵
 # @Date: 2022-07-13 11:06:23
 # @LastEditTime: 2022-08-22 15:57:23
 # @LastEditors: 王丽兵
 # @Description: 健康检查
 # @FilePath: /deploymentScript/acs-devops/package-acs/common/health.sh
### 

# 判断某个网站是否正常访问
function checkWebServerState(){
    url=$1
    status_code=$(curl -IL -m 3 -s -o /dev/null -w %{http_code} $url)
    if [ $status_code -ne 200 ];then
        redEcho $url页面异常,服务器返回状态码:${status_code}
    else
        greenEcho $url页面正常，服务器返回状态码：${status_code}
    fi
}

# 判断某个 https 网站是否正常访问
function checkHTTPWebServerState(){
    url=$1
    status_code=$(curl -IL -m 3 -s -o /dev/null -w %{http_code} $url)
    if [ $status_code -ne 200 ];then
        redEcho $url页面异常,服务器返回状态码:${status_code}
    else
        greenEcho $url页面正常，服务器返回状态码：${status_code}
    fi
}