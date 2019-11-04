#!/usr/bin/env bash

set -ex

DRONE_BITBUCKET_CLIENT_ID=""
DRONE_BITBUCKET_CLIENT_SECRET=""
DRONE_RPC_SECRET=""
DRONE_SERVER_HOST=""
DRONE_SERVER_PROTO="https"

docker run \
  --volume=/var/run/docker.sock:/var/run/docker.sock \
  --env=DRONE_RPC_SERVER=${DRONE_SERVER_HOST} \
  --env=DRONE_RPC_SECRET=${DRONE_RPC_SECRET} \
  --env=DRONE_RUNNER_CAPACITY=2 \
  --env=DRONE_RUNNER_NAME=${HOSTNAME} \
  --restart=always \
  --detach=true \
  --name=drone-agent \
  drone/agent:1
