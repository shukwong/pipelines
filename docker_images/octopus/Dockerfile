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

RUN conda update conda
RUN conda install -y -c bioconda  octopus boost=1.67.0
WORKDIR /data/
