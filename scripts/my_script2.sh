#!/bin/bash
sudo cd /etc/yum.repos.d/
sudo wget http://yum.oracle.com/public-yum-ol7.repo
sudo yum install docker-engine
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
sudo docker pull vinay4uv/python-flask:python-flask-app
sudo firewall-cmd --permanent --add-port=5000/tcp
echo $1
echo "-----"
DATABASE_IP=$1 
echo "-----"
echo sudo docker run -d -e DB_IP="${DATABASE_IP}" -p 5000:5000 vinay4uv/python-flask:python-flask-app
sudo docker run -d -e DB_IP="${DATABASE_IP}" -p 5000:5000 vinay4uv/python-flask:python-flask-app
echo "Docker run complete"
command || exit 1
