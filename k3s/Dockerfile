ARG tag=jammy
FROM ubuntu:${tag}
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# See https://github.com/k3s-io/k3s/blob/master/package/Dockerfile
# We needed k3s in ubuntu with flux
# docker build -t test .

# Dependencies for environment
RUN apt-get update && apt-get install -y ca-certificates \
    tar zstd wget tzdata libseccomp-dev curl git \
    gcc pkg-config build-essential \
    # This is needed for building k3s
    libbtrfs-dev btrfs-progs \
    software-properties-common && \
    add-apt-repository --yes ppa:rmescandon/yq && \
    apt-get update && \
    apt-get install yq -y

# Install Go (this version is checked in ./validate)
RUN wget https://go.dev/dl/go1.20.10.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.20.10.linux-amd64.tar.gz  

# This builds k3s
WORKDIR /src
RUN git clone --depth 1 https://github.com/k3s-io/k3s && \
    cd k3s && \
    export PATH=/usr/local/go/bin:$PATH && \
    cd ./scripts && \
    ./download && \
    ./validate && \
    ./build && \
    # Remove line that tries to upload to s3
    sed -i '$ d' ./package-cli && \
    ./package-cli

# Move into bins and uninstall go and finalize stuffs
# We have a custom scripts that only copies over executables
# we don't have. I'm worried this was prepared for busybox
# and runtime will have issues.
COPY ./move.sh /src/k3s/move.sh
WORKDIR /src/k3s
RUN mkdir -p /lib/modules /lib/firmware && \
    /bin/bash ./move.sh
   
WORKDIR /   
RUN rm -rf /src /usr/local/go && \
    echo 'hosts: files dns' > /etc/nsswitch.conf && \
    echo "PRETTY_NAME=\"K3s develop\"" > /etc/os-release && \
    chmod 1777 /tmp

VOLUME /var/lib/kubelet
VOLUME /var/lib/rancher/k3s
VOLUME /var/lib/cni
VOLUME /var/log
ENV PATH="$PATH:/usr/local/bin/aux"
ENV CRI_CONFIG_FILE="/var/lib/rancher/k3s/agent/etc/crictl.yaml"
