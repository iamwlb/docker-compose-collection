# 1. dc-gitea

- [1. dc-gitea](#1-dc-gitea)
  - [1.1. Introduction](#11-introduction)
  - [1.2. Default Configuration](#12-default-configuration)
  - [1.3. Usage Guide](#13-usage-guide)
    - [1.3.1. Creating PostgreSQL Persistent Storage Directory](#131-creating-postgresql-persistent-storage-directory)
    - [1.3.2. Start up](#132-start-up)

## 1.1. Introduction

Use [docker-compose](https://github.com/docker/compose) to manage [gitea](https://github.com/go-gitea/gitea)

## 1.2. Default Configuration

| application name | port | username | password |
| ---- |----|----| ----|
| gitea | 3000,222 |  |  |
| postgresql | 5432 | postgres | changeme |

## 1.3. Usage Guide

### 1.3.1. Creating PostgreSQL Persistent Storage Directory

```bash
> ./init.sh
```

### 1.3.2. Start up

```bash
> docker-compose up -d
```
