#!/usr/bin/env bash
rm -rf $PWD/venv;

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     url=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh;;
    Darwin*)    url=https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh;;
esac
wget -q -O miniconda.sh $url

bash ./miniconda.sh -b -p $PWD/venv/
source $PWD/venv/bin/activate;

conda install -y -c bioconda muscle cd-hit
conda install -y -c biocore hmmer
conda install -y -c anaconda perl make
conda install -y nodejs
