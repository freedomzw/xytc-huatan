#!/bin/bash
docker create --name redis-node01 --net host -v redis-node01:/data redis:5.0.2 --cluster-enabled yes --cluster-config-file nodes-node-01.conf --port 6379
docker create --name redis-node02 --net host -v redis-node02:/data redis:5.0.2 --cluster-enabled yes --cluster-config-file nodes-node-02.conf --port 6380
docker create --name redis-node03 --net host -v redis-node03:/data redis:5.0.2 --cluster-enabled yes --cluster-config-file nodes-node-03.conf --port 6381

# 启动
docker start redis-node01 redis-node02 redis-node03

# 进入redis-node01容器进行操作
docker exec -it redis-node01 /bin/bash

# 组件集群
redis-cli --cluster create 127.0.0.1:6379 127.0.0.1:6380 127.0.0.1:6381 --cluster-replicas 0