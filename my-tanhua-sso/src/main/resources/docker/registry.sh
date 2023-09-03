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

#查看配置容器卷
#创建启动c3数据卷容器 使用-v参数设置数据卷
docker run -ti --name=c3 -v /volume centos:7 /bin/bash
#创建启动c1 c2容器 使用--volumes-from 参数设置数据卷
docker run -ti --name=c1 --volumes-from c3 centos:7 /bin/bash
docker run -ti --name=c2 --volumes-from c3 centos:7 /bin/bash



