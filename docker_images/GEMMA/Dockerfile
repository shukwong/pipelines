FROM ubuntu:latest

MAINTAINER Wendy Wong <wendy.wong@gmail.com>

RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/genetics-statistics/GEMMA/releases/download/0.98.1/gemma-0.98.1-linux-static.gz && \
gunzip gemma-0.98.1-linux-static.gz && mv gemma-0.98.1-linux-static /usr/local/bin/gemma && chmod +rx /usr/local/bin/gemma

RUN export PATH=/usr/local/bin/:$PATH