################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.1.0_cv2

################## METADATA ######################

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="2"
LABEL software="octopus"
LABEL software.version="0.6.3b"
LABEL about.summary="Octopus is a mapping-based variant caller that implements several calling models within a unified haplotype-aware framework."
LABEL about.home="https://github.com/luntergroup/octopus"
LABEL about.documentation="https://github.com/luntergroup/octopus/blob/develop/doc/manuals/user/octopus-user-manual.pdf"
LABEL about.license_file="https://github.com/luntergroup/octopus/blob/develop/LICENSE"
LABEL about.license="MIT License"
LABEL extra.identifiers.biotools="Octopus"
LABEL about.tags="Genomics"

################## MAINTAINER ######################

MAINTAINER Wendy Wong <wendy.wong@coherentlogic.com>

################## INSTALLATION ######################

WORKDIR /tmp/

RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh &&  bash Miniconda3-latest-Linux-x86_64.sh -b -p venv &&  ./venv/bin/conda install -c conda-forge -c bioconda octopus

ENV PATH="/tmp/venv/bin/:${PATH}"

