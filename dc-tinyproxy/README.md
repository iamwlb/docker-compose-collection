# 1. dc-tinyproxy

- [1. dc-tinyproxy](#1-dc-tinyproxy)
  - [1.1. Introduction](#11-introduction)
  - [1.2. Default Configuration](#12-default-configuration)
  - [1.3. Usage Guide](#13-usage-guide)
    - [1.3.1. Configuring client environment variables](#131-configuring-client-environment-variables)

## 1.1. Introduction

Use [docker-compose](https://github.com/docker/compose) to manage[tinyproxy](https://github.com/tinyproxy/tinyproxy)

## 1.2. Default Configuration

| application name | port |
| ---- |----|
| tinyproxy | 8888 |

## 1.3. Usage Guide

### 1.3.1. Configuring client environment variables

```bash
> vi /etc/profile
##### Adding the following content #####
alias proxy-on='export http_proxy=<server-ip>:8888;export https_proxy=$http_proxy'
alias proxy-off='unset http_proxy;unset https_proxy'
##### End of content #####
```
