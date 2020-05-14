FROM ubuntu:16.04


MAINTAINER wendy wong

RUN  apt-get update && apt-get install wget
RUN  wget https://downloads.rclone.org/v1.51.0/rclone-v1.51.0-linux-amd64.zip && unzip rclone-v1.51.0-linux-amd64.zip
RUN  cp ./rclone-v1.51.0-linux-amd64/rclone /usr/local/bin/
