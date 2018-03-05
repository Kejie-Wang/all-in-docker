#!/usr/bin/env bash

SHELL_PATH="$( cd "$( dirname "$0" )" && pwd )"

DOCKER_NAME="${USER}_in_dev_docker"

# remove the docker if there also exists the docker.
docker ps -a --format "{{.Names}}" | grep "${DOCKER_NAME}" 1>/dev/null
if [ $? == 0 ]; then
		docker stop ${DOCKER_NAME} 1>/dev/null
		docker rm -f ${DOCKER_NAME} 1>/dev/null
fi

if [ -z "$(command -v nvidia-smi)" ]; then
		echo "Use docker without nvidia gpu support."
		DOCKER_CMD="docker"
else
		DOCKER_CMD="nvidia-docker"
fi

# docker image
IMG=kejiewang/develop-environment:latest

# host machine env
USER_ID=$(id -u)
GRP=$(id -g -n)
GRP_ID=$(id -g)

eval ${DOCKER_CMD} run -it \
  -d \
  --name ${DOCKER_NAME} \
  -e DOCKER_USER=$USER \
  -e DOCKER_USER_ID=$USER_ID \
  -e DOCKER_GRP=$GRP \
	-e DOCKER_GRP_ID=$GRP_ID \
  -v $HOME/.dotfiles:$HOME/.dotfiles \
  -v /etc/localtime:/etc/localtime:ro \
  -v $SHELL_PATH:/scripts \
  -v $PWD:$HOME/workspace \
  -w $HOME/workspace \
  --hostname in_dev_docker \
  $IMG

docker exec ${DOCKER_NAME} bash -c /scripts/docker_adduser.sh
docker exec -u $USER ${DOCKER_NAME} bash -c $HOME/.dotfiles/install.sh
