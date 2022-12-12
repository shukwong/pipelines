FROM rocker/rstudio:4.2.0

LABEL maintainer="wendy wong"

#based on https://raw.githubusercontent.com/rocker-org/rocker-versioned2/master/dockerfiles/tidyverse_4.2.0.Dockerfile

ENV PATH="/usr/local/bin/:${PATH}"

#install rclone
RUN apt-get update && \
    apt-get install curl unzip wget --yes && \
    apt-get clean && \
    curl -O https://downloads.rclone.org/v1.51.0/rclone-v1.51.0-linux-amd64.zip && \
    unzip rclone-v1.51.0-linux-amd64.zip && \
    cp ./rclone-v1.51.0-linux-amd64/rclone /usr/local/bin/

#install R packages and set preferences
COPY ./rstudio-prefs.json /home/rstudio/.config/rstudio/
COPY ./install_r_packages.sh /rocker_scripts
RUN chmod +rx /rocker_scripts/install_r_packages.sh && /rocker_scripts/install_r_packages.sh

#install plink2
RUN wget https://s3.amazonaws.com/plink2-assets/alpha3/plink2_linux_x86_64_20221024.zip && \
    unzip plink2_linux_x86_64_20221024.zip && \
    chmod +rx plink2 && \
    mv ./plink2 /usr/local/bin/

#Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH


#install conda packages
#RUN conda install -c bioconda ldsc=1.0.1
RUN conda install -c bioconda plink=1.90b6.21
RUN conda install -c bioconda gcta=1.93.2beta

#install ldsc
WORKDIR /home/ldsc
RUN conda init bash && git clone https://github.com/bulik/ldsc.git && cd ldsc && conda env create --file environment.yml 

#conda clean up
RUN conda clean -afy


