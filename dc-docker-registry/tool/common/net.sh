#!/bin/bash
 # @Author: 王丽兵
 # @Date: 2022-07-13 13:05:05
 # @LastEditTime: 2022-07-13 13:05:19
 # @LastEditors: 王丽兵
 # @Description: 网络辅助
 # @FilePath: /deploymentScript/package-acs/common/net.sh
### 
urlencode() {
    # urlencode <string>

    old_lang=$LANG
    LANG=C
    
    old_lc_collate=$LC_COLLATE
    LC_COLLATE=C

    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done

    LANG=$old_lang
    LC_COLLATE=$old_lc_collate
}

urldecode() {
    # urldecode <string>

    local url_encoded="${1//+/ }"
    printf '%b' "${url_encoded//%/\\x}"
}