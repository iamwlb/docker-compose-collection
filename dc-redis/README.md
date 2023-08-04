# 1. dc-redis

- [1. dc-redis](#1-dc-redis)
  - [1.1. Introduction](#11-introduction)
  - [1.2. Default Configuration](#12-default-configuration)
  - [1.3. How to Modify Password？](#13-how-to-modify-password)

## 1.1. Introduction

Use [docker-compose](https://github.com/docker/compose) to manage [Redis](https://redis.io)

## 1.2. Default Configuration

| application name | port | username | password |
| ---- |----|----| ----|
| redis | 6379 | redis | changeme |

## 1.3. How to Modify Password？

```bash
> cd dc-postgres
> vi .env
# modify REDIS_PASSWORD
```
