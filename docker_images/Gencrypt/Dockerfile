# Use Perl base image
FROM perl:5.34.3-bullseye

# Install git
RUN apt-get update && apt-get install -y git

#install required modules
RUN cpan Math::Random::MT

# Set the working directory
WORKDIR /app

# Clone the gencrypt repository
RUN git clone https://github.com/mturchin20/gencrypt 

# Add your further commands here
# Set the entry point
ENTRYPOINT ["/bin/bash"]