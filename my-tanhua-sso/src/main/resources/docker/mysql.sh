docker pull mysql:5.7
docker run -id \
  -p 3307:3306 \
  --name=c_mysql \
  -v $PWD/conf:/etc/mysql/conf.d \
  -v $PWD/logs:/logs \
  -v $PWD/data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=123456 \