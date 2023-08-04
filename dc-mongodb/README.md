# 1. dc-mongodb

- [1. dc-mongodb](#1-dc-mongodb)
  - [1.1. Introduction](#11-introduction)
  - [1.2. Introduction](#12-introduction)
  - [1.3. How to Modify Password？](#13-how-to-modify-password)

## 1.1. Introduction

Use [docker-compose](https://github.com/docker/compose) to manage [mongodb](https://www.mongodb.com/)

## 1.2. Introduction

| application name | port | username | password |
| ---- |----|----| ----|
| mongodb | 27017 | root | changeme |  |

## 1.3. How to Modify Password？

```bash
> vim docker-compose.yml
##### Modify the following content #####
MONGO_INITDB_ROOT_PASSWORD: changeme
##### end of modification #####
```
