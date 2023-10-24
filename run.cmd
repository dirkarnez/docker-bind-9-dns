docker network create --subnet=172.20.0.0/16 nagoya-net

docker build -t bind9 .
docker run -d --rm --name=dns-server --net=nagoya-net --ip=172.20.0.2 bind9
docker exec -d dns-server /etc/init.d/bind9 start

ping host2.nagoya-foundation.com
