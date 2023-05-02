FROM ubuntu:22.04

LABEL patcher.version 0.2.0

COPY --from=mikefarah/yq:2.4.0 /usr/bin/yq /usr/bin/yq

RUN apt-get update && apt-get install -yy git curl && rm -rf /var/lib/apt/lists/*

COPY ./scripts /usr/local/bin/

RUN chmod +x /usr/local/bin/*
