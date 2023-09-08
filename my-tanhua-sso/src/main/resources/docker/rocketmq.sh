#!/bin/bash
docker pull foxiswho/rocketmq:server-4.3.2
docker pull foxiswho/rocketmq:broker-4.3.2

#创建nameserver容器
docker create -p 9876:9876 --name rmqserver -e "JAVA_OPT_EXT"=server -Xms128m -Xmx128m -Xmn128m" -e "JAVA_OPTS=-Duser.home=/opt" -v rmqserver-logs:/opt/logs -v rmqserver-store:/opt/store foxiswho/rocketmq:server-4.3.2