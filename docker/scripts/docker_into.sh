#!/usr/bin/env bash

SHELL=zsh
if [ "$1" = "bash" ]; then
  SHELL=bash
fi

xhost +local:root 1>/dev/null 2>&1
docker exec \
    -u $USER \
    -it ${USER}_in_dev_docker \
    /bin/$SHELL
xhost -local:root 1>/dev/null 2>&1
