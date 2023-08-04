# 1. dc-swarmpit

- [1. dc-swarmpit](#1-dc-swarmpit)
  - [1.1. Introduction](#11-introduction)
  - [1.2. Default Configuration](#12-default-configuration)
  - [1.3. Usage Guide](#13-usage-guide)
    - [1.3.1. Deploying Swarmpit using Docker Compose](#131-deploying-swarmpit-using-docker-compose)
    - [1.3.2. Deploying Swarmpit Agent in a Docker Swarm cluster](#132-deploying-swarmpit-agent-in-a-docker-swarm-cluster)
    - [1.3.3. Deploying Swarmpit in a Docker Swarm cluster](#133-deploying-swarmpit-in-a-docker-swarm-cluster)
    - [1.3.4. stop swarmpit](#134-stop-swarmpit)

## 1.1. Introduction

Use [docker-compose](https://github.com/docker/compose) to manage [swarmpit](https://github.com/swarmpit/swarmpit)

## 1.2. Default Configuration

| application name | port |
| ---- |----|
| swarmpit | 888 |
| couchdb | 5984 |
| influxdb | 8086 |

## 1.3. Usage Guide

### 1.3.1. Deploying Swarmpit using Docker Compose

```bash
> docker-compose up -d
```

### 1.3.2. Deploying Swarmpit Agent in a Docker Swarm cluster

```bash
> cd agent
> docker stack deploy -c docker-compose.yml swarmpit-agent
```

### 1.3.3. Deploying Swarmpit in a Docker Swarm cluster

```bash
# deploy swarmpit
> docker stack deploy -c docker-compose.yml swarmpit
# Checking the running status of Swarmpit
> docker stack ps swarmpit
```

### 1.3.4. stop swarmpit

```bash
> docker stack rm swarmpit
```
