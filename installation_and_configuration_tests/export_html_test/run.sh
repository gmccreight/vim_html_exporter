#!/bin/bash

local_dir=$(dirname $0)
container_dir=/installation_and_configuration_tests/export_html_test

# Cleanup local
rm -rf $local_dir/results
mkdir $local_dir/results

# Setup container
docker exec -ti vhe sh -c "rm -rf $container_dir"
docker exec -ti vhe sh -c "mkdir -p $container_dir/results"

docker exec -ti vhe sh -c "echo html > $container_dir/results/results.html"
docker cp vhe:$container_dir/results/results.html $local_dir/results/results.html
 
if [ `grep html $local_dir/results/results.html` ]; then
  # The psql output contains the uppercase column name SOURCES
  echo OK - installation_and_configuration_tests/export_html_test
else
  echo NOT OK - installation_and_configuration_tests/export_html_test
fi
