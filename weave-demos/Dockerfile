ARG tag=jammy
FROM ubuntu:${tag}

# docker build -t demos .
# command without flux: maestro run ball_bounce_suite.yaml --autoyes --pgen pgen.py
# workdir: /workflow

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install \    
    bwa \
    git \
    samtools \
    bcftools \
    curl \
    libbz2-dev \
    liblzma-dev \
    libcurl4-openssl-dev \
    libncurses5-dev \
    python3-pip \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# This is needed for the notebook render
RUN  git clone https://github.com/LLNL/PyDV /tmp/pydv && \
     cd /tmp/pydv/ && \
     python3 -m pip install .

# Wrappers to ensure we source the mamba environment!
RUN git clone --depth 1 https://github.com/LLNL/weave-demos /workflow
WORKDIR /workflow/CZ/ball_bounce
COPY ./scripts/setup.sh /setup.sh
COPY ./ball_bounce_suite_flux.yaml ./ball_bounce_suite_flux.yaml
RUN /bin/bash /setup.sh && python3 -m pip install -r requirements.txt && \
    # The workflow expects to find python
    ln -s /usr/bin/python3 /usr/bin/python && \
    python3 -m pip install jut && \
    python3 -m pip install typing-extensions --upgrade && \
    python3 -m pip install ipympl && \
    python3 -m pip install pydv
    
# Temporary fix for
# https://github.com/LLNL/PyDV/issues/275
COPY ./scripts/pydvpy.py /usr/local/lib/python3.8/dist-packages/pydv/pydvpy.py 
COPY ./scripts/visualization.ipynb ./visualization.ipynb
EXPOSE 8888
