#!/bin/bash

#执行dockerfile
docker build -f JMeter-Master-DockerFile -t jm:v1.0 .
docker build -f JMeter-Slave-DockerFile -t jms:v1.0 .
#docker build -f dockerfile02 -t jms:v1.0 /bin/bash

#启动slave负载容器
docker run -dit --name slave01 jms:v1.0 /bin/bash
docker run -dit --name slave02 jms:v1.0 /bin/bash
docker run -dit --name slave03 jms:v1.0 /bin/bash

#启动master负载容器
docker run -dit --name master  jm:v1.0 /bin/bash

#查看容器ip地址
docker inspect --format '{{ .Name }} => {{ .NetworkSettings.IPAddress }}' $(sudo docker ps -a -q)



