#!/usr/bin/env bash

SHELL_PATH="$(cd "$( dirname "$0"  )" && pwd  )"

DOCKER_REPO="kejiewang/develop-environment"
TAG="latest"

docker build -t "${DOCKER_REPO}:${TAG}" -f "$SHELL_PATH/../Dockfile.gpu" $SHELL_PATH/../..
