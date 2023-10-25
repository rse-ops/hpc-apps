ARG tag=jammy
FROM ubuntu:${tag}

# docker build -t nextflow .
# command: nextflow -c nextflow.config run main.nf -profile flux
# launcher: checked
# workdir: /workflow

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install \
    openjdk-18-jre-headless \
    curl \
    git \
    build-essential \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Python - instead of a system python we install mamba
RUN /bin/bash -c "curl -L https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh > mambaforge.sh && bash mambaforge.sh -b -p /opt/conda && rm mambaforge.sh"
ENV PATH=/opt/conda/bin:$PATH

# Wrappers to ensure we source the mamba environment!
RUN git clone --depth 1 https://github.com/nextflow-io/ml-hyperopt /workflow
WORKDIR /workflow

# This wraps the existing entrypoint
COPY ./setup.sh ./
RUN /bin/bash setup.sh

# Install nextflow from source (since Flux not in release yet)
RUN git clone --depth 1 https://github.com/nextflow-io/nextflow /nextflow && \
    cd /nextflow && \
    make compile && make pack && make install && \
    # This finishes getting some deps
    /nextflow/nextflow -h
COPY ./nextflow.config /workflow/nextflow.config
ENV PATH=/nextflow:$PATH    
WORKDIR /code
