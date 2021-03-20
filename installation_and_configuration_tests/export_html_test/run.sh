#!/bin/bash

local_dir=$(dirname $0)
container_dir=/installation_and_configuration_tests/export_html_test

# Cleanup local
rm -rf $local_dir/results
mkdir $local_dir/results

# Setup container
docker exec -ti vhe sh -c "rm -rf $container_dir"
docker exec -ti vhe sh -c "mkdir -p $container_dir/results"
docker exec -ti vhe sh -c "mkdir -p $container_dir/input"

docker cp $local_dir/input/example.md vhe:$container_dir/input/example.md

docker exec -ti vhe sh -c "vim $container_dir/input/example.md +TOhtml +'w $container_dir/results/results.html' +qall!"

docker cp vhe:$container_dir/results/results.html $local_dir/results/results.html

if grep -q "Title.*Heading" $local_dir/results/results.html; then
  echo OK - installation_and_configuration_tests/export_html_test
else
  echo NOT OK - installation_and_configuration_tests/export_html_test
fi
