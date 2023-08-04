# 1. dc-docker-registry

- [1. dc-docker-registry](#1-dc-docker-registry)
  - [1.1. Introduction](#11-introduction)
  - [1.2. Default Configuration](#12-default-configuration)
  - [1.3. Usage Guide](#13-usage-guide)
    - [1.3.1. Configure username and password (optional)](#131-configure-username-and-password-optional)
    - [1.3.2. Start up](#132-start-up)
    - [1.3.3. Login Docker Registry](#133-login-docker-registry)
    - [1.3.4. Common Operations in Docker Image Registry](#134-common-operations-in-docker-image-registry)
  - [1.4. Basic Operations of Docker Registry2](#14-basic-operations-of-docker-registry2)

## 1.1. Introduction

Use [docker-compose](https://github.com/docker/compose) to Manage `Docker Registry v2`。

## 1.2. Default Configuration

| application name | port | username | password |
| ---- |----|----| ----|
| docker registry | 5000 | admin | docker-registry2 |

## 1.3. Usage Guide

### 1.3.1. Configure username and password (optional)

```bash
> htpasswd -Bbn username password > docker-registry/auth/htpasswd
# 例如
> htpasswd -Bc admin docker-registry2 > docker-registry/auth/htpasswd
> htpasswd -Bc docker-registry/auth/htpasswd admin
```

### 1.3.2. Start up

```bash
> docker-compose up -d
```

### 1.3.3. Login Docker Registry

```bash
> docker login localhost:5000
```

### 1.3.4. Common Operations in Docker Image Registry

```bash
# Switch to the working directory
> cd tool
# Querying images in the repository
> ./list-all-images.sh
# Deleting all images in the repository
> ./delete-all-images.sh
```

## 1.4. Basic Operations of Docker Registry2

- [http://127.0.0.1:5000/v2/_catalog](http://127.0.0.1:5000/v2/_catalog)

```bash
> curl -u admin:docker-registry2 http://localhost:5000/v2/_catalog
```
