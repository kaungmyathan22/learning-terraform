#!/bin/bash
echo "installation started" >> /home/ec2-user/docker_installation.log
sudo yum update -y
sudo yum install -y docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user
docker run -p 8080:80 nginx
echo "Docker installation completed" >> /home/ec2-user/docker_installation.log