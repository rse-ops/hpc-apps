ARG tag=jammy
FROM ubuntu:${tag}

# Python - instead of a system python we install mamba
RUN apt-get update && apt-get install -y tzdata curl
RUN /bin/bash -c "curl -L https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh > mambaforge.sh && bash mambaforge.sh -b -p /opt/conda && rm mambaforge.sh"
ENV PATH=/opt/conda/bin:$PATH

ENV DEBIAN_FRONTEND=nonintercative
RUN mamba install singularity && \
    mamba install -y -c conda-forge fireworks numpy pandas pytest scikit-learn && \
    MPICC="mpicc -shared" pip install --no-cache-dir --no-binary=mpi4py mpi4py && \
    apt-get clean
