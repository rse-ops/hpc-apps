ARG tag=3.11
FROM python:${tag}

# docker build -t snakemake .
# command: snakemake --cores 1 --flux --jobs 1
# workdir: /workflow

RUN apt-get update
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update && \
    apt-get -y install \
    bwa samtools bcftools \
    git \
    curl \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Wrappers to ensure we source the mamba environment!
RUN git clone --depth 1 https://github.com/snakemake/snakemake-tutorial-data /workflow
WORKDIR /workflow

# This wraps the existing entrypoint
COPY ./Snakefile ./
RUN mkdir ./scripts
COPY ./scripts/plot-quals.py ./scripts/plot-quals.py

# instead of altering the entrypoint to active the environment!
RUN pip install snakemake && \
    pip install git+https://github.com/snakemake/snakemake-interface-common && \
    pip install git+https://github.com/snakemake/snakemake-executor-plugin-flux && \
    pip install git+https://github.com/snakemake/snakemake-interface-executor-plugins && \
    pip install git+https://github.com/snakemake/snakemake-executor-flux && \
    pip install matplotlib pysam
    
WORKDIR /code
