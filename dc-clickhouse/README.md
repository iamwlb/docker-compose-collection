# 1. dc-clickhouse

- [1. dc-clickhouse](#1-dc-clickhouse)
  - [1.1. Introduction](#11-introduction)
  - [1.2. Default Configuration](#12-default-configuration)
  - [1.3. How to Modify Password？](#13-how-to-modify-password)

## 1.1. Introduction

Using [docker-compose](https://github.com/docker/compose) to manage [clickhouse](https://clickhouse.com/)

## 1.2. Default Configuration

| application name | port | username | password | Additional Notes |
| ---- |----|----| ----| ----|
| Clickhouse | 8123、9009、9090 | default | changeme |  |

## 1.3. How to Modify Password？

```bash
> vi users.xml
##### Modify the following content #####
<password>your password here</password>
##### end of modification #####
```
