#data path
/usr/local/zookeeper/zkdata/data01
/usr/local/zookeeper/zkdata/data02
/usr/local/zookeeper/zkdata/data03

clientPort=2181
dataDir=/usr/local/zookeeper/zkdata/data01

clientPort=2182
dataDir=/usr/local/zookeeper/zkdata/data02

clientPort=2183
dataDir=/usr/local/zookeeper/zkdata/data03

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