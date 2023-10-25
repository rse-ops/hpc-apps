ARG tag=jammy
FROM ubuntu:${tag}

# docker build -t mdparsl .
# docker run -it mdparsl --rm --name mdparsl
# This requires flux!
# command with flux: flux start --test-size=4
#                    conda activate /opt/conda/envs/moldesign-demo/
#                    python3 ./scripts/0_molecular-design-with-parsl.py

# Then to copy over data... mkdir -p ./data && cd ./data
# docker cp ecstatic_wiles:/workflow/training-data-vs-time.svg .
# docker cp ecstatic_wiles:/workflow/parsl-results.csv .

# workdir: /workflow

RUN apt-get update --fix-missing
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install \
    bwa \
    git \
    samtools \
    bcftools \
    curl \
    libbz2-dev \
    liblzma-dev \
    libcurl4-openssl-dev \
    libncurses5-dev \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Python - instead of a system python we install mamba
RUN /bin/bash -c "curl -L https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh > mambaforge.sh && bash mambaforge.sh -b -p /opt/conda && rm mambaforge.sh"
ENV PATH=/opt/conda/bin:$PATH

# Wrappers to ensure we source the mamba environment!
RUN git clone --depth 1 https://github.com/ExaWorks/molecular-design-parsl-demo /workflow
WORKDIR /workflow
COPY ./environment.yml ./environment.yml
RUN mamba env create --file environment.yml && mamba init
RUN conda init --system
COPY ./scripts ./scripts
COPY ./data ./data
