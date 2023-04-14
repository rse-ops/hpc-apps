FROM python:3-slim

# This is a demo container for balsam + the flux operator.
# It should not be used in production!

# Any setting defined in the balsam.server.conf.Settings class
# can be set as an environment variable below.
# Settings use either the BALSAM_, BALSAM_AUTH_, or BALSAM_OAUTH_ prefix,
# depending on the category. Other (secret) settings are defined by
# the operator

# docker-compose.yml specific environ
# Relative to CWD:
ENV GUNICORN_CONFIG_FILE="balsam/server/gunicorn.conf.example.py"
ENV SERVER_PORT=8000

# Logging
ENV BALSAM_LOG_LEVEL=INFO
ENV BALSAM_LOG_DIR="./balsam-logs"
ENV BALSAM_AUTH_TOKEN_TTL=259200
ENV BALSAM_AUTH_LOGIN_METHODS='["password", "oauth_authcode", "oauth_device"]'
ENV BALSAM_OAUTH_SCOPE="read_basic_user_data"

WORKDIR /balsam

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget \
       lsb-release \
       git \
       gnupg && \
       sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
       wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get install -y build-essential \
       postgresql \
       libpq-dev \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/argonne-lcf/balsam /balsam
WORKDIR /balsam
RUN pip install --upgrade pip && pip install -r requirements/deploy.txt
RUN mkdir -p /balsam/log && gunicorn balsam server migrate

ENTRYPOINT ["/balsam/entrypoint.sh"]
