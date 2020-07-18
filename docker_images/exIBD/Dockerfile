FROM centos:8
 
RUN  yum update --assumeyes --skip-broken && yum install  --assumeyes java-1.8.0-openjdk python2 

RUN yum groupinstall "Development Tools" --assumeyes

RUN pip2 install pandas pyinstaller

COPY ./ExIBD_v1.0.tar.gz /tmp

RUN cd /tmp/ && tar -zxvf ExIBD_v1.0.tar.gz && make Conly && make clean_Conly && make && make clean