FROM alpine:3

ARG user=elixir
ARG group=elixir
ARG uid=1000
ARG gid=1000

ENV ELIXIR_HOME = /home/elixir/

RUN addgroup -g ${gid} ${group} \
    && adduser -h "$ELIXIR_HOME" -u ${uid} -G ${group} -s /bin/sh -D ${user}
RUN mkdir -p $ELIXIR_HOME/src/code/
VOLUME $ELIXIR_HOME/src/code/

RUN apk add --no-cache elixir openssh-keygen git 

USER ${user}
