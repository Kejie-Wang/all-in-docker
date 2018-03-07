# All-in-docker
The all in docker development environment.

## Requirements

- `docker`
- `nvidia-docker` (For Nvidia gpu use in docker)

## Specs

This what you will get when you create a container from this images.

- Ubuntu16.04
- [CUDA 9.0](https://developer.nvidia.com/cuda-toolkit)
- [CUDNN v7](https://developer.nvidia.com/cudnn)
- [Tensorflow-1.6.0](https://www.tensorflow.org/)
- [CMake-3.10](https://cmake.org/)
- [caffe-379a3ba2d5](https://github.com/BVLC/caffe/tree/379a3ba2d5421a6ac05afa4239c30739cc79f7b0)

## Docker Hub

You can use this Dockerfile via docker hub. The repo is [here](https://hub.docker.com/r/kejiewang/develop-environment/tags/).

And you can use `docker pull` command to get the images.

```shell
docker pull kejiewang/develop-environment:${VERSION}
```

## Howto

### Dotfiles installation (Optional)

This images developed with the [dotfiles](https://github.com/Kejie-Wang/dotFiles.git). And you can also use you own dotfile configuration. This step may be optional.

```shell
./dotfiles/install.sh
```

### Develop using docker

- **Add dev-docker into your path.**

  ```Shell
  export PATH=${PROJ}/docker/bin:$PATH
  ```

- **Start a docker.**

  ```shell
  dev-start
  ```

  And `docker ps` will find the started container which is named `${USER}_in_dev_docker`

- **Inot the docker**

  ```shell
  dev-into
  ```

  And now you are in docker and do your development.

## License

[Apache License 2.0](https://github.com/Kejie-Wang/all-in-docker/blob/master/LICENSE)

## Contacts

This project is maintained by [Kejie Wang](wang_kejie@foxmail.com) and feel free to send me an email if you have any questions.

