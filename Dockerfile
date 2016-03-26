# NGINX
#
#

FROM centos:centos6
MAINTAINER Siliang Xu <xusiliang@360.cn>
LABEL  Description="This image is used to start the nginx" Version="1.0"

#change addops yum
RUN rm -rf /etc/yum.repos.d/*.repo && rpm -ivh http://mirror.addops.soft.360.cn:8360/addops/6/os/x86_64/addops-release-6-4.el6.x86_64.rpm && yum clean all
# Install nginx rpm
RUN yum install -y addops-nginx  && rm -rf /var/cache/yum

# Edit nginx.conf file
RUN sed -i 's/localhost/_/' /usr/local/nginx/conf/nginx.conf

#index.html
ARG INDEX_PATH=/usr/local/nginx/html
RUN mkdir -p $INDEX_PATH && echo "hello docker 1.1!" > $INDEX_PATH/index.html


#ENV
ENV PATH=/usr/local/nginx/sbin:$PATH

#ENTRYPOINT
ENTRYPOINT ["nginx"]
# Nginx listen port
EXPOSE 80
