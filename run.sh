#!/bin/bash
set -x

CONFIG=CONFIG_CLASS faust -A $WORKER worker -lINFO --web-port=$WORKER_PORT
