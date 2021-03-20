# This comes from https://hub.docker.com/_/python and is based on Debian Buster

FROM python:3.8.3-slim-buster

LABEL author="Gordon McCreight" email="gordon@mccreight.com"
LABEL version="0.1"

RUN apt-get update
RUN apt-get install -y vim

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
