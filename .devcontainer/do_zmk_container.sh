#!/bin/bash

DOCKER_RUN_ARGS=" -it --rm"
DOCKER_RUN_ARGS+=" --security-opt"
DOCKER_RUN_ARGS+=" label=disable"
DOCKER_RUN_ARGS+=" -e LOCAL_USER_ID=`id -u $USER`"
DOCKER_RUN_ARGS+=" -p 3000:3000"
DOCKER_RUN_ARGS+=" -v $HOME:/home/user"

DOCKER_CMD="/bin/bash"

echo docker run ${DOCKER_RUN_ARGS=} zmk-build ${DOCKER_CMD}
docker run ${DOCKER_RUN_ARGS=} zmk-build ${DOCKER_CMD}
