FROM alpine:3.18

# Update repository and install dependencies
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        wget \
        zlib \
        zlib-dev \
        bzip2 \
        bzip2-dev \
        xz \
        xz-dev \
        libcurl \
        curl-dev \
        bash \
        ca-certificates \
        build-base \
        openssl-dev \
        zlib-static \
        perl

# Install htslib 1.21
RUN wget https://github.com/samtools/htslib/releases/download/1.21/htslib-1.21.tar.bz2 && \
    tar -xjf htslib-1.21.tar.bz2 && \
    cd htslib-1.21 && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf htslib-1.21 htslib-1.21.tar.bz2

# Install bcftools 1.21
RUN wget https://github.com/samtools/bcftools/releases/download/1.21/bcftools-1.21.tar.bz2 && \
    tar -xjf bcftools-1.21.tar.bz2 && \
    cd bcftools-1.21 && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf bcftools-1.21 bcftools-1.21.tar.bz2

# Download and install slivar
RUN wget https://github.com/brentp/slivar/releases/download/v0.3.1/slivar && \
    chmod +x slivar && \
    mv slivar /usr/local/bin/slivar

# Update library cache
RUN ldconfig /usr/local/lib 2>/dev/null || true

# Set working directory
WORKDIR /data

# Default command
CMD ["/bin/bash"]
