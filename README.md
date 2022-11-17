# Jenkins-Pipeline-for-Docker
## Prerequsits
### 1. An existing GitHub
### 2. A running Jenkins Server on ubuntu, or linux
### 3. Previous  knowledge on CICD
### 4. An existinng DockerHub account
# Steps
## 1. Create a configure a linux  Jenkins server and integrate Docker [Must have thsi running with a keypair and ports 22 and 8080 opened]
#### Install jenkins
```
#!/bin/bash
sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Installing Git
sudo yum install git -y
###

# Use The Amazon Linux 2 AMI When Launching The Jenkins VM/EC2 Instance
# Instance Type: t2.medium or small minimum
# Open Port (Security Group): 8080 
```

#### Install java and Docker
```
#!/bin/bash
# Install and configure Docker:
sudo apt update -y 
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker.service
sudo systemctl status docker.service

# Install java 11
sudo apt update -y
sudo apt install openjdk-11-jdk -y

```
##### Creat apache tomcat image
```
FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y install java
CMD /bin/bash
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.67/bin/apache-tomcat-9.0.67.tar.gz .
RUN tar -xvzf apache-tomcat-9.0.67.tar.gz
RUN mv apache-tomcat-9.0.67/* /opt/tomcat    # the forward slash before the * is crucial 
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
```
#### Install Docker

## 2. Create a GitHub repository or use and existing repository
## 3. Create Jenkins Pipeline
## 4. Automate Pipeline by liveraging Webhook on GitHub
