ARG tag=jammy
FROM ubuntu:${tag}

ENV DEBIAN_FRONTEND=nonintercative
RUN apt-get update && apt-get install -y tzdata python3-pip && \
    python3 -m pip install numpy matplotlib scipy && \
    python3 -m pip install balsam && \
    apt-get clean
