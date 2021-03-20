#!/bin/bash

docker container ls --all | grep vhe | egrep -o "^[0-9a-f]+" | xargs docker rm
