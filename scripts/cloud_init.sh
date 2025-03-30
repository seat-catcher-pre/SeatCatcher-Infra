#!/bin/bash

# Update packages
sudo yum update -y

# Docker 설치
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker

# EC2-user docker 권한 부여
sudo usermod -a -G docker ec2-user

# Docker Compose 설치
sudo curl -SL "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
<<<<<<< HEAD

# MySQL 설치 (SSH Tunneling을 위해)
sudo dnf install mariadb105
=======
>>>>>>> 25e27ef6ab9070ba5081655218ded0290c2272e8
