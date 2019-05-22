FROM continuumio/miniconda3
RUN conda install -y -c bioconda muscle cd-hit
RUN conda install -y -c biocore hmmer
RUN conda install -y -c anaconda perl make
RUN mkdir /ko2fasta/
ADD ./ko2fasta.py /ko2fasta/
ADD ./Makefile .  /ko2fasta/