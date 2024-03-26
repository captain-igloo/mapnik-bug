FROM ubuntu:noble

COPY main.cpp /tmp/

WORKDIR /tmp

RUN apt update \
    && apt install -y g++ libmapnik-dev
