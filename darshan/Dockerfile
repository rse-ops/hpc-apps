ARG tag=jammy
FROM ubuntu:${tag}

# docker build -t darshan .
# docker exec -it darshan bash
# make logs directories in /opt/logs
# perl /usr/bin/darshan-mk-log-dirs.pl
# see: https://github.com/darshan-hpc/darshan/blob/main/darshan-runtime/doc/darshan-runtime.txt#L80
# I think we might want to implement this as a spack "on demand" view, need to discuss

RUN apt-get update && apt-get install -y \
    git \
    python3-pip \
    build-essential \
    libtool \
    automake \
    libbz2-dev \
    mpich

RUN git clone --depth 1 https://github.com/darshan-hpc/darshan && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    cd darshan && \
    ./prepare.sh && \
    cd ./darshan-util && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    cd ../darshan-runtime && \
    mkdir -p /opt/logs && \
    # https://github.com/darshan-hpc/darshan/blob/84e55b611824acfe7e7f1133096e08648967a4e4/darshan-runtime/doc/darshan-runtime.txt#L80
    ./configure --prefix=/usr --with-log-path=/opt/logs --with-jobid-env=FLUX_JOB_ID && \
    make && \
    make install
