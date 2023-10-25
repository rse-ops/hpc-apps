ARG tag=jammy
FROM ubuntu:${tag}
ENV DEBIAN_FRONTEND=noninteractive

# Example runs, as user flux
# sudo -u flux -E HOME=/home/flux /bin/bash
# export LD_LIBRARY_PATH=/opt/conda/lib
# export PYTHONPATH=/opt/conda/lib/python3.10/site-packages
# flux start --test-size=4
# flux run -n 4 ./hello_c
# flux run -n 4 ./hello_cxx
# flux run -n 4 ./connectivity_c
# flux run -n 4 ./hello_usempi
# flux run -n 4 ./ring_c
# flux run -n 4 ./ring_usempi
# flux run -n 4 ./ring_mpifh

# not sure how to reproduce:
# mpirun -np 2 --mca mpi_spc_attach all --mca mpi_spc_dump_enabled true ./spc_example [num_messages] [message_size]

# not sure how to reproduce:
# mpirun -np 2 --mca mpi_spc_attach all --mca mpi_spc_dump_enabled true ./spc_example [num_messages] [message_size]

WORKDIR /opt/
RUN apt-get update && \
    apt-get install -y gfortran git curl wget g++ build-essential mpich \
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
