ARG tag="gcc-11_02-16-23_00h-14m"
FROM seracllnl/tpls:${tag}

# docker build -t serac .
# docker exec -it serac bash

RUN git clone --depth 1 https://github.com/LLNL/serac /home/serac/serac && \
    cd /home/serac/serac && \
    git submodule init && \
    git submodule update
WORKDIR /home/serac/serac
RUN python3 ./config-build.py  -hc host-configs/docker/gcc@11.1.0.cmake -bp ../build -ip ../install && \
    cd ../build && \
    make

