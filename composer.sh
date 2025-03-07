#!/bin/bash
# The following is an example wrapper script for running composer in a container within your current working directory
PHP="${PHP:-8.3}"

MYUID=$(id -u)
MYGID=$(id -g)
CURRENT_DIR=$(pwd)

IMAGE="axllent/composer:${PHP}"

docker run --rm -it \
    -v ${CURRENT_DIR}:/app \
    -v ${HOME}/.cache/composer:/tmp/composer-cache \
    -u ${MYUID}:${MYGID} \
    ${IMAGE} ${*:1}
