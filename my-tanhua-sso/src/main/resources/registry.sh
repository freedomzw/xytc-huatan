#!/bin/bash
docker pull registry:2

docker run -d -p 5000:5000 --restart=always --name registry -v /Users/zhaowei/Downloads/docker/registry:/var/lib/registry registry:2

#私有仓库地址
http://127.0.0.1:5000/v2/_catalog

#上传镜像到本地仓库
docker pull hello‐world
#标记为私有仓库的镜像
docker tag hello‐world:latest localhost:5000/myhellodocker
#上传标记的镜像
docker push localhost:5000/myhellodocker

#从私服库中拉镜像
docker rmi localhost:5000/myhellodocker:latest
docker pull localhost:5000/myhellodocker
#查看私服的镜像
http://localhost:5000/v2/myhellodocker/tags/list
