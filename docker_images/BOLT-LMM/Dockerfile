FROM ubuntu:16.04
MAINTAINER Wendy Wong <wendy.wong@gmail.com>
LABEL    software="bolt-lmm" \ 
    container="bolt-lmm" \ 
    about.summary="Efficient large cohorts genome-wide Bayesian mixed-model association testing" \ 
    about.home="https://data.broadinstitute.org/alkesgroup/BOLT-LMM/" \ 
    software.version="2.3.4" \ 
    about.license="custom, see /usr/share/doc/bolt-lmm/copyright" \ 
    about.license_file="/usr/share/doc/bolt-lmm/copyright"  

RUN apt-get update && apt-get install -y wget libatlas-base-dev build-essential libbz2-dev libboost-all-dev 
RUN wget https://data.broadinstitute.org/alkesgroup/BOLT-LMM/downloads/BOLT-LMM_v2.3.4.tar.gz && tar -zxvf BOLT-LMM_v2.3.4.tar.gz && mv BOLT-LMM_v2.3.4/ /usr/local/
ENV PATH="/usr/local/BOLT-LMM_v2.3.4:${PATH}"
