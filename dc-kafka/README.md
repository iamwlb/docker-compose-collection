# 1. dc-kafka

- [1. dc-kafka](#1-dc-kafka)
  - [1.1. Introduction](#11-introduction)
  - [1.2. Usage Guide](#12-usage-guide)
    - [1.2.1. Single-Node Kafka](#121-single-node-kafka)
    - [1.2.2. Dual-Node Kafka](#122-dual-node-kafka)

## 1.1. Introduction

Use [docker-compose](https://github.com/docker/compose) to manage [kafka](https://kafka.apache.org/)

## 1.2. Usage Guide

### 1.2.1. Single-Node Kafka

```bash
# Switch to the working directory
> cd single-node
# Start the single-node Kafka
> docker-compose up -d
# Check the running status of Kafka
> docker-compose ps -a
```

### 1.2.2. Dual-Node Kafka

```bash
# Switch to the working directory
> cd double-node
# Start a dual-node Kafka cluster
> docker-compose up -d
# Check the running status of Kafka
> docker-compose ps -a
```
