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

for suffix in md rs; do
  docker cp $local_dir/input/example.$suffix vhe:$container_dir/input/example.$suffix
  docker exec -ti vhe sh -c "vim $container_dir/input/example.$suffix +TOhtml +'w $container_dir/results/$suffix.html' +qall!"
  docker cp vhe:$container_dir/results/$suffix.html $local_dir/results/$suffix.html
done

if grep -q "Title.*Heading" $local_dir/results/md.html; then
  echo OK - installation_and_configuration_tests/export_html_test
else
  echo NOT OK - installation_and_configuration_tests/export_html_test
fi
