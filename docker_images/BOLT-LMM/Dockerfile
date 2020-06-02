FROM ubuntu:16.04
MAINTAINER Wendy Wong <wendy.wong@gmail.com>
LABEL    software="bolt-lmm" \ 
    container="bolt-lmm" \ 
    about.summary="Efficient large cohorts genome-wide Bayesian mixed-model association testing" \ 
    about.home="https://data.broadinstitute.org/alkesgroup/BOLT-LMM/" \ 
    software.version="2.3.4" \ 
    about.license="custom, see /usr/share/doc/bolt-lmm/copyright" \ 
    about.license_file="/usr/share/doc/bolt-lmm/copyright" \ 
    extra.binaries="/usr/bin/bolt" \ 
    about.tags=""

RUN apt-get install wget && wget https://data.broadinstitute.org/alkesgroup/BOLT-LMM/downloads/BOLT-LMM_v2.3.4.tar.gz
RUN tar -zxvf BOLT-LMM_v2.3.4.tar.gz && cp BOLT-LMM_v2.3.4/bolt /usr/local/bin/
RUN PATH=/usr/local/bin/:$PATH
