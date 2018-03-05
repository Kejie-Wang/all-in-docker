#!/usr/bin/env bash

SHELL_PATH="$( cd "$( dirname "$0" )" && pwd )"
PACKAGES_PATH=$SHELL_PATH/../packages

function download_file() {
  local url=$1
  local filename=$2
  if [ ! -e "$PACKAGES_PATH/$filename" ]; then
    wget $url -O "$PACKAGES_PATH/$filename"
  fi
}

VIM="https://github.com/vim/vim/archive/v8.0.1555.tar.gz"
CMAKE="https://cmake.org/files/v3.10/cmake-3.10.2.tar.gz"

download_file $VIM "vim.tar.gz"
download_file $CMAKE "cmake.tar.gz"
