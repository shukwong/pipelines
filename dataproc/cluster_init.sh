pip install glow.py;
pip install mlflow;
conda install -c bioconda bedtools;
conda install -c bioconda bcftools;
curl https://rclone.org/install.sh |  bash;
#qctool
wget -nv https://www.well.ox.ac.uk/~gav/resources/qctool_v2.0.6-Ubuntu16.04-x86_64.tgz
tar -xzvf qctool_v2.0.6-Ubuntu16.04-x86_64.tgz
cp ./qctool_v2.0.6-Ubuntu16.04-x86_64/qctool /usr/local/bin/