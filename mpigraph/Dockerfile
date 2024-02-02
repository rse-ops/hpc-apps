ARG tag=jammy
FROM ubuntu:${tag}
ENV DEBIAN_FRONTEND=noninteractive

# mpirun --map-by node -np 2 --allow-run-as-root ./mpiGraph 1048576 10 10 > mpiGraph.out
# ./crunch_mpiGraph mpiGraph.out
# firefox file:///path/to/mpiGraph.out_html/index.html

WORKDIR /opt/
RUN apt-get update && \
    apt-get install -y gfortran git curl wget g++ build-essential \
    openmpi-bin openmpi-doc libopenmpi-dev && \
    wget https://docs.it4i.cz/src/ompi/ompi.tar.gz && \
    tar -xzvf ompi.tar.gz && \
    rm ompi/Makefile

# Python - instead of a system python we install mamba
RUN /bin/bash -c "curl -L https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh > mambaforge.sh && bash mambaforge.sh -b -p /opt/conda && rm mambaforge.sh"
ENV PATH=/opt/conda/bin:$PATH

WORKDIR /opt/ompi

# We can't build java ones
ENV PATH=/opt/ompi:$PATH
COPY ./Makefile ./Makefile
RUN make

RUN git clone https://github.com/LLNL/mpiGraph /opt/mpigraph
WORKDIR /opt/mpigraph
RUN make
ENV PATH=/opt/mpigraph:$PATH
