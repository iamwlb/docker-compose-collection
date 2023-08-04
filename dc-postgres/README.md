# 1. dc-postgres

- [1. dc-postgres](#1-dc-postgres)
  - [1.1. Introduction](#11-introduction)
  - [1.2. Default Configuration](#12-default-configuration)
  - [1.3. Usage Guide](#13-usage-guide)
  - [1.4. How to Modify Password？](#14-how-to-modify-password)

## 1.1. Introduction

Use [docker-compose](https://github.com/docker/compose) to manage [postgresql](https://www.postgresql.org)

## 1.2. Default Configuration

| application name | port | username | password |
| ---- |----|----| ----|
| postgresql | 5432 | postgres | changeme |

## 1.3. Usage Guide

```bash
> cd dc-postgres
> ./init.sh
> docker-compose up -d
```

## 1.4. How to Modify Password？

```bash
> cd dc-postgres
> vi .env
# modify POSTGRES_PASSWORD
```
