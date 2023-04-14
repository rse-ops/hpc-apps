#!/bin/bash

export BALSAM_LOG_DIR="/balsam/log"
mkdir -p $BALSAM_LOG_DIR
gunicorn balsam server migrate || echo "gunicorn balsam server migrate not successful"
gunicorn --print-config -c /balsam/gunicorn.conf.py balsam.server.main:app
exec gunicorn -c /balsam/gunicorn.conf.py balsam.server.main:app
