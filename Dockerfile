####################NEW DOCKERFILE INORDER TO GET CENTOS BASE IMAGE ###############---> Dockerfile
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
#####################################################################################