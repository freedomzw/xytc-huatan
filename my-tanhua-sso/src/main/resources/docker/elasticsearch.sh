#!/bin/bash
docker pull elastcisearch:8.7.1
docker pull elastcisearch:5.6.8

docker run -itd --name es  -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e ES_JAVA_OPTS="-Xms256m -Xmx256m" elasticsearch:5.6.8
#-d 后台启动
#–name 起别名即：NAMES
#-p 9200:9200 将端口映射出来
#elasticsearch的9200端口是供外部访问使用；9300端口是供内部访问使用集群间通讯
#-e "discovery.type=single-node"单节点启动
#-e ES_JAVA_OPTS="-Xms256m -Xmx256m" 限制内存大小

#访问
#curl http://localhost:9200

#安装head下载 http://localhost:9100/
docker run -p 9100:9100 mobz/elasticsearch-head:5

#kibana的下载
docker pull kibana:7.4.2

#kibana的启动
docker run --name kibana -e ELASTICSEARCH_HOSTS=http://ip:9200 -p 5601:5601 -d kibana:7.4.2