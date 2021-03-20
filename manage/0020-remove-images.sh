#!/bin/bash

docker rmi vhe

# Those might fail (like if the images don't exist)
# But that's OK.  This script should look like it succeeds
true
