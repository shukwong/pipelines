FROM ubuntu:16.04

LABEL maintainer="wendy.wong@gmail.com"

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get install curl make gcc g++ cmake gfortran libreadline-dev \
    libz-dev libbz2-dev liblzma-dev libpcre3-dev libssl-dev libcurl4-openssl-dev \
    libopenblas-dev default-jre unzip libboost-all-dev \
    libpng-dev libcairo2-dev tabix --yes && \
    apt-get clean && \
    curl -O https://cloud.r-project.org/src/base/R-3/R-3.5.1.tar.gz && \
    tar xvzf R-3.5.1.tar.gz && \
    cd R-3.5.1 && \
    ./configure --with-x=no --with-blas="-lopenblas" && \
    make && \
    mkdir -p /usr/local/lib/R/lib && \
    make install && \
    cd .. && \
    rm -rf R-3.5.1*

RUN apt-get install python3-pip --yes && \
    pip3 install cget

RUN apt install wget



RUN apt-get install -y libxml2-dev

RUN echo "update 0.36.3.2 and update SKAT3" &&  wget https://github.com/weizhouUMICH/SAIGE/archive/master.zip && \
	unzip master.zip && \
	mv SAIGE-master SAIGE
RUN echo "update3"

RUN cp SAIGE/extdata/install_packages.R  /usr/local/bin/
RUN Rscript /usr/local/bin/install_packages.R


RUN Rscript -e 'devtools::install_github("leeshawn/SKAT")'

RUN R CMD INSTALL SAIGE


ENV PATH "/usr/local/bin/:$PATH"

RUN cp SAIGE/extdata/step1_fitNULLGLMM.R /usr/local/bin/
RUN cp SAIGE/extdata/step2_SPAtests.R /usr/local/bin/
RUN cp SAIGE/extdata/createSparseGRM.R /usr/local/bin/

RUN rm -r SAIGE
