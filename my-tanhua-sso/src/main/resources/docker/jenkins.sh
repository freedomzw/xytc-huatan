#!/bin/bash
# 拉取镜像
docker pull jenkins/jenkins:2.190.3
# jenkins启动
docker run --name jenkins --user=root -p 8880:8080 -p 50000:50000 -v /Users/zhaowei/Downloads/docker/jenkins:/var/jenkins_home -d jenkins/jenkins:2.414.1
# admin/admin
# http://127.0.0.1:8880
# docker exec -ti jenkins bash