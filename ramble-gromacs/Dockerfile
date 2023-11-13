ARG tag=jammy
FROM ubuntu:${tag}

ENV DEBIAN_FRONTEND=noninteractive

# su flux
# ramble workspace activate /opt/gromacs_workspace/
# ramble workspace concretize # (might already be done)
# ramble workspace setup # (requires spack in path, already done in build)
# ramble on

# Ensure the flux user owns the spack install
RUN apt-get update && \
    apt-get install -y fftw3-dev fftw3 pdsh libfabric-dev libfabric-bin libfabric1 \
    time git curl wget \
    python3-pip

WORKDIR /opt
RUN git clone --depth 1 https://github.com/spack/spack && \
    git clone -c feature.manyFiles=true https://github.com/GoogleCloudPlatform/ramble.git && \
    cd ramble && \
    pip install -r requirements.txt
COPY ./flux_gromacs.yaml /opt/ramble/examples/flux_gromacs.yaml
ENV PATH=/opt/ramble/bin:/opt/spack/bin:$PATH
RUN ramble workspace create -d /opt/test_workspace -c /opt/ramble/examples/basic_hostname_config.yaml && \
    ramble workspace create -d /opt/gromacs_workspace -c /opt/ramble/examples/flux_gromacs.yaml
    
WORKDIR /opt/gromacs_workspace
RUN . /opt/ramble/share/ramble/setup-env.sh && \
    ramble workspace activate /opt/gromacs_workspace/ && \
    ramble workspace concretize && \
    ramble workspace setup
