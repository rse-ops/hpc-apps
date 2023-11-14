ARG tag=jammy
FROM ubuntu:${tag}

# docker build -t demo .
# docker exec -it demo bash
# command with flux: flux start --test-size=4

# workdir: /workflow

RUN apt-get update && apt-get install -y git python3-pip wget curl

# Wrappers to ensure we source the mamba environment!
WORKDIR /workflow

# Install maestro
RUN git clone --depth 1 https://github.com/llnl/maestrowf /tmp/m && \
    cd /tmp/m && \
    pip install . && \
    mkdir -p /run/flux  
    
COPY ./study /workflow/study
