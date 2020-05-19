#!/bin/bash

CURRENT_DIR=$(pwd)

echo -e "ssh -i ${CURRENT_DIR}/keys/.ssh/vscodespace_rsa vagrant@localhost -p 2222"

./read.anykey.sh