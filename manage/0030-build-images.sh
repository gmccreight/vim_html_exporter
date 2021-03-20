#!/bin/bash

set -e

docker build -t vhe:latest $(dirname $0)/../docker/vhe
