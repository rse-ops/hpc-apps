ARG tag=jammy
FROM spack/ubuntu-${tag}:latest

# docker build -t demo .
# docker exec -it demo bash
# spack env activate sunenv

ENV SPACK_ENV_PATH=/opt/spack/var/spack/environments/sunenv
ENV SPACK_DEBUG_LOG_DIR=/tmp
ENV SPACK_DEBUG_LOG_ID=sundials

# RUN apt-get update && apt-get install -y gfortran
RUN spack env create sunenv && \
    spack env activate sunenv && \
    spack add sundials+mpi && \
    spack install

# These should be compiled and installed
RUN spack env activate sunenv && \
    cd /opt/spack/var/spack/environments/sunenv/.spack-env/view/examples && \
    for path in $(find . -type d -links 2); do cd $path && make || true && cd -; done


