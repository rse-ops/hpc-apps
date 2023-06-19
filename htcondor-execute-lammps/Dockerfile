ARG tag=el7
FROM htcondor/execute:${tag}

# Test command
# mpirun -np 2 --map-by socket lmp -v x 2 -v y 2 -v z 2 -in in.reaxc.hns -nocite 

RUN yum update -y && \
    yum install -y git mpich mpich-devel fftw3-devel libfabric-devel gcc gcc-c++ && \
    curl -s -L https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1-linux-x86_64.sh > cmake.sh && \
    sh cmake.sh --prefix=/usr --skip-license && rm cmake.sh 

ENV PATH=$PATH:/usr/lib64/mpich/bin:/opt/lammps/build
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/mpich/lib

RUN git clone --depth 1 --branch stable_29Sep2021_update2 https://github.com/lammps/lammps.git /opt/lammps && \
    cd /opt/lammps && \
    mkdir build && cd build && \
    cmake ../cmake -DPKG_REAXFF=yes -DBUILD_MPI=yes -DPKG_OPT=yes -DFFT=FFTW3 && \
    make && make install

# installs to /usr/local/bin/lmp
WORKDIR /opt/lammps/examples/reaxff/HNS
