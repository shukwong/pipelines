pip install glow.py;
pip install mlflow;
conda install -c bioconda bedtools;
conda install -c bioconda bcftools;
conda install gxx_linux-64

#rclone
curl https://rclone.org/install.sh |  bash;

#qctool
wget -nv https://www.well.ox.ac.uk/~gav/resources/qctool_v2.0.6-Ubuntu16.04-x86_64.tgz
tar -xzvf qctool_v2.0.6-Ubuntu16.04-x86_64.tgz
cp ./qctool_v2.0.6-Ubuntu16.04-x86_64/qctool /usr/local/bin/



# install SAIGE
# Install SKAT for SAIGE-GENE
sudo apt-get -y install libboost-all-dev autoconf
Rscript -e 'install.packages("SKAT", repos="https://cran.us.r-project.org")'

# Install SAIGE
cd /opt
#pip install cget
wget https://github.com/weizhouUMICH/SAIGE/archive/0.36.2.zip -nv && \
	unzip 0.36.2.zip && \
	mv SAIGE-0.36.2 SAIGE    
Rscript SAIGE/extdata/install_packages.R
export TAR="/bin/tar"
Rscript -e 'install.packages("devtools", repos = "http://cran.us.r-project.org")'
Rscript -e 'devtools::install_version("SPAtest", version = "3.0.0", repos = "http://cran.us.r-project.org")'
R CMD INSTALL SAIGE/SAIGE_0.36.2_R_x86_64-pc-linux-gnu.tar.gz
cp SAIGE/extdata/step1_fitNULLGLMM.R /usr/local/bin/
cp SAIGE/extdata/step2_SPAtests.R /usr/local/bin/
cp SAIGE/extdata/createSparseGRM.R /usr/local/bin/

# Install HTSLIB
cd /opt
git clone https://github.com/samtools/htslib
cd htslib
autoheader
autoconf
./configure
make
make install

