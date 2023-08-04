# 1. dc-jenkins

- [1. dc-jenkins](#1-dc-jenkins)
  - [1.1. Introduction](#11-introduction)
  - [1.2. Default Configuration](#12-default-configuration)
  - [1.3. Installation](#13-installation)
  - [1.4. Operations](#14-operations)
    - [1.4.1. Change Source](#141-change-source)
    - [1.4.2. Add Node](#142-add-node)
    - [1.4.3. Configuration for Build Agent Node](#143-configuration-for-build-agent-node)
      - [1.4.3.1. Install Required Software](#1431-install-required-software)
      - [1.4.3.2. Environment Variable Configuration](#1432-environment-variable-configuration)

## 1.1. Introduction

Use [docker-compose](https://github.com/docker/compose) to manage [jenkins](https://www.jenkins.io/)

## 1.2. Default Configuration

| application name | port |
| ---- |----|
| jenkins | 8080,50000 |

## 1.3. Installation

```bash
# 1. Set Directory Permissions
> ./set-permissions.sh

# 2. Run
> docker-compose up -d

# 3. Access the application in your browser at http://target:8080/

# 4. Get the initial admin password
> cat data/secrets/initialAdminPassword
```

## 1.4. Operations

### 1.4.1. Change Source

```bash
# 1. Click "Manage Jenkins" --> Click "Manage Plugins" --> "Available". Wait for the plugin list to load completely before proceeding to the next step.

# 2. Modify JSON
> cd data/updates
> cp default.json default.json.bak
> sed -i 's/http:\/\/updates.jenkins-ci.org\/download/https:\/\/mirrors.tuna.tsinghua.edu.cn\/jenkins/g' default.json && sed -i 's/http:\/\/www.google.com/https:\/\/www.baidu.com/g' default.json

# 3. Click "Manage Jenkins" --> Click "Manage Plugins" --> Click "Advanced". Scroll down to "Update Site" and replace the content in the input field from "https://updates.jenkins.io/update-center.json" with "https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/2.89/update-center.json". --> Click "Submit".
Another mirror address: http://mirror.xmission.com/jenkins/updates/update-center.json

# Restart Jenkins
```

### 1.4.2. Add Node

```bash
# 1. Install JDK 1.8+

# 2. Create a remote working directory for the node
> mkdir -p /data/jenkins_data

# 3. Add the node in Jenkins using the SSH launch method
```

### 1.4.3. Configuration for Build Agent Node

#### 1.4.3.1. Install Required Software

```bash
# 1. Install JDK 1.8
# 2. Install Maven
# 3. Install Git
> yum -y install git
> git version
# 4. Install Docker
# 5. Install Docker Compose
# 6. Install Node.js
> yum -y install epel-release
> yum -y install nodejs
> node --version
> npm --version
```

#### 1.4.3.2. Environment Variable Configuration

- JAVA_HOME = Path to Java installation (No need to configure since it's installed via RPM)
- M2_HOME = /usr/local/maven
- PATH+EXTRA = $M2_HOME/bin
- PATH+Git = /usr/bin
- Path+Nodejs = /usr/local/src/node/bin
