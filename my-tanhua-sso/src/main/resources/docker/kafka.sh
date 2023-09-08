#用这个唯一ID格式化Kafka存储目录
sudo /usr/local/kafka/kafka01/bin/kafka-storage.sh format -t m-Qzfrg_QsyTO7QgslSdaw -c /usr/local/kafka/kafka01/config/kraft/server.properties
sudo /usr/local/kafka/kafka02/bin/kafka-storage.sh format -t m-Qzfrg_QsyTO7QgslSdaw -c /usr/local/kafka/kafka02/config/kraft/server.properties
sudo /usr/local/kafka/kafka03/bin/kafka-storage.sh format -t m-Qzfrg_QsyTO7QgslSdaw -c /usr/local/kafka/kafka03/config/kraft/server.properties


#启动Kafka KRaft集群节点服务
/usr/local/kafka/kafka01/bin/kafka-server-start.sh -daemon /usr/local/kafka/kafka01/config/kraft/server.properties &
/usr/local/kafka/kafka02/bin/kafka-server-start.sh -daemon /usr/local/kafka/kafka02/config/kraft/server.properties &
/usr/local/kafka/kafka03/bin/kafka-server-start.sh -daemon /usr/local/kafka/kafka03/config/kraft/server.properties &

#kafka 创建topic
sh kafka-topics.sh --create --bootstrap-server 127.0.0.1:19092,127.0.0.1:29092,127.0.0.1:39092 --replication-factor 3 --partitions 3 --topic test

#查看topic
sh kafka-topics.sh --bootstrap-server 127.0.0.1:19092,127.0.0.1:29092,127.0.0.1:39092 --list

#删除topic
sh kafka-topics.sh --bootstrap-server 127.0.0.1:19092,127.0.0.1:29092,127.0.0.1:39092 --delete --topic charges


#模拟producer
sh kafka-console-producer.sh --broker-list 127.0.0.1:19092,127.0.0.1:29092,127.0.0.1:39092 --topic test

#消费consumer
sh kafka-console-consumer.sh --bootstrap-server 127.0.0.1:19092,127.0.0.1:29092,127.0.0.1:39092 --from-beginning --topic test

#查看消费者组信息
sh kafka-consumer-groups.sh --bootstrap-server 127.0.0.1:19092,127.0.0.1:29092,127.0.0.1:39092 --list