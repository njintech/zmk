#!/bin/bash

USER_ID=${LOCAL_USER_ID:-9001}

echo "Start with UID : $USER_ID"

if [ ! $USER_ID -eq 0 ]; then
    getent passwd $USER_ID > /dev/null 2>&1
    result=$?

    if [ ! $result -eq 0 ]; then
        useradd --shell /bin/bash -u $USER_ID -o -c "" -d /home/user -M user-$USER_ID
        echo "user-$USER_ID ALL=(ALL) NOPASSWD: ALL" >> etc/sudoers
    fi
    #usermod -a -G developer user-$USER_ID

    if [ ! -e /home/user ]; then
        mkdir -p /home/user
        chown user-$USER_ID:user-$USER_ID /home/user
        chmod 775 /home/user
    fi

    export HOME=/home/user

    exec su -m user-$USER_ID -c "cd $HOME; $@"
fi
