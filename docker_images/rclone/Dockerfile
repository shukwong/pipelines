FROM ubuntu:16.04


MAINTAINER wendy wong

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get install curl unzip --yes && \
    apt-get clean && \
    curl -O https://downloads.rclone.org/v1.51.0/rclone-v1.51.0-linux-amd64.zip && \
    unzip rclone-v1.51.0-linux-amd64.zip && \
    cp ./rclone-v1.51.0-linux-amd64/rclone /usr/local/bin/

ENV PATH="/usr/local/bin/:${PATH}"
