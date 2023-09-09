#data path
/usr/local/zookeeper/zkdata/data01
/usr/local/zookeeper/zkdata/data02
/usr/local/zookeeper/zkdata/data03

clientPort=2181
dataDir=/usr/local/zookeeper/zkdata/data01
#dataLogDir=/usr/local/zookeeper/zkdatalog/log1

clientPort=2182
dataDir=/usr/local/zookeeper/zkdata/data02
#dataLogDir=/usr/local/zookeeper/zkdatalog/log2

clientPort=2183
dataDir=/usr/local/zookeeper/zkdata/data03
#dataLogDir=/usr/local/zookeeper/zkdatalog/log3

echo 1 >/usr/local/zookeeper/zkdata/data01/myid
echo 2 >/usr/local/zookeeper/zkdata/data02/myid
echo 3 >/usr/local/zookeeper/zkdata/data03/myid

#cfg最后添加
server.1=127.0.0.1:12888:13888
server.2=127.0.0.1:22888:23888
server.3=127.0.0.1:32888:33888

#解释：server.服务器ID=服务器IP地址：服务器之间通信端口：服务器之间投票选举端口
#
#客户端和服务器通信默认端口：2181
#
#服务器之间通信默认端口：12888
#
#服务器之间投票选举默认端口：13888
#
#ZooKeeper中的AdminService服务默认占用端口：8080


#启动实例

/usr/local/zookeeper/apache-zookeeper-3.9.0-01/bin/zkServer.sh start
/usr/local/zookeeper/apache-zookeeper-3.9.0-02/bin/zkServer.sh start
/usr/local/zookeeper/apache-zookeeper-3.9.0-03/bin/zkServer.sh start

#查看状态
/usr/local/zookeeper/apache-zookeeper-3.9.0-01/bin/zkServer.sh status
/usr/local/zookeeper/apache-zookeeper-3.9.0-02/bin/zkServer.sh status
/usr/local/zookeeper/apache-zookeeper-3.9.0-03/bin/zkServer.sh status

#停止

/usr/local/zookeeper/apache-zookeeper-3.9.0-01/bin/zkServer.sh stop
/usr/local/zookeeper/apache-zookeeper-3.9.0-02/bin/zkServer.sh stop
/usr/local/zookeeper/apache-zookeeper-3.9.0-03/bin/zkServer.sh stop

#kafka server.properties
/usr/local/zookeeper/kafka_2.13-3.5.1-03/config
broker.id=3
log.dirs=/usr/local/zookeeper/kafka_2.13-3.5.1-03/logs
listeners=PLAINTEXT://127.0.0.1:9094
zookeeper.connect=localhost:2181,localhost:2182,localhost:2183

sh /usr/local/zookeeper/kafka_2.13-3.5.1-01/bin/kafka-server-start.sh -daemon /usr/local/zookeeper/kafka_2.13-3.5.1-01/config/server.properties
sh /usr/local/zookeeper/kafka_2.13-3.5.1-02/bin/kafka-server-start.sh -daemon /usr/local/zookeeper/kafka_2.13-3.5.1-02/config/server.properties
sh /usr/local/zookeeper/kafka_2.13-3.5.1-03/bin/kafka-server-start.sh -daemon /usr/local/zookeeper/kafka_2.13-3.5.1-03/config/server.properties


#创建topic
sh kafka-topics.sh --create --bootstrap-server 127.0.0.1:9094,127.0.0.1:9093,127.0.0.1:9092 --replication-factor 3 --partitions 3 --topic test

#查看topic
sh kafka-topics.sh --bootstrap-server 127.0.0.1:9094,127.0.0.1:9093,127.0.0.1:9092 --list

#删除topic
sh kafka-topics.sh --bootstrap-server 127.0.0.1:9094,127.0.0.1:9093,127.0.0.1:9092 --delete --topic test

#生产者
sh kafka-console-producer.sh --broker-list 127.0.0.1:9094,127.0.0.1:9093,127.0.0.1:9092 --topic test

#消费consumer
sh kafka-console-consumer.sh --bootstrap-server 127.0.0.1:9094,127.0.0.1:9093,127.0.0.1:9092 --from-beginning --topic test

#查看消费者组信息
sh kafka-consumer-groups.sh --bootstrap-server 127.0.0.1:9094,127.0.0.1:9093,127.0.0.1:9092 --list


