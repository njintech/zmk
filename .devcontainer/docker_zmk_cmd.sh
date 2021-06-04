#!/bin/bash

DOCKER_IMAGE_NAME=${ZMK_DOCKER_IMAGE_NAME:-zmk-build}
DOCKER_IMAGE_REV=${ZMK_DOCKER_IMAGE_REV:-latest}

HOST_ZMK_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd)"

if [ -z "`docker images | grep "^${DOCKER_IMAGE_NAME}"`" ]; then
    echo "Need docker image"
    exit 1
fi

DOCKER_ZMK_PATH=/home/user/reposit/zmk

DOCKER_VOLUMES+=" -v $HOME:/home/user"

DOCKER_ENV_VARS+=" -e LOCAL_USER_ID=`id -u $USER`"

DOCKER_RUN_OPTS+=" --rm --ipc=host --net=host --cap-add=ALL --privileged"
DOCKER_RUN_OPTS+=" -p 3000:3000"

CMD="cd $DOCKER_ZMK_PATH && $@"

if [ "$DOCKER_INTERACTIVE" ]; then
    DOCKER_RUN_OPTS+=" -it"
    CMD="/bin/bash"
fi

echo docker run $DOCKER_RUN_OPTS $DOCKER_ENV_VARS $DOCKER_VOLUMES $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_REV /bin/bash -c "cd $DOCKER_ZMK_PATH; $CMD"
docker run $DOCKER_RUN_OPTS $DOCKER_ENV_VARS $DOCKER_VOLUMES $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_REV /bin/bash -c " $CMD"

RESULT=$?

exit $RESULT
