#! /bin/bash
# update os
sudo yum update -y

# set server hostname as jenkins-server
sudo hostnamectl set-hostname jenkins-server

# install git
sudo yum install git -y

# install java 17 (Amazon Corretto)
sudo yum install java-17-amazon-corretto -y

# verify Java 17 installation
java -version

# install jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
sudo yum install jenkins -y

# reload and start Jenkins service
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl enable jenkins

# install docker
sudo amazon-linux-extras install docker -y
sudo systemctl start docker
sudo systemctl enable docker

# add the ec2-user and jenkins to the docker group
sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker jenkins

# configure docker as cloud agent for jenkins
sudo cp /lib/systemd/system/docker.service /lib/systemd/system/docker.service.bak
sudo sed -i 's/^ExecStart=.*/ExecStart=\/usr\/bin\/dockerd -H tcp:\/\/127.0.0.1:2375 -H unix:\/\/\/var\/run\/docker.sock/g' /lib/systemd/system/docker.service
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl restart jenkins
