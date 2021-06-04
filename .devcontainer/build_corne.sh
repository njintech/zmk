#!/bin/bash

echo BUILD ZMK for NICE_NANO CORNE Chocolate
echo Build LEFT
./docker_zmk_cmd.sh "cd app && west build -d build/left -b nice_nano -- -DSHIELD=corne_left"

echo Build RIGHT
./docker_zmk_cmd.sh "cd app && west build -d build/right -b nice_nano -- -DSHIELD=corne_right"
