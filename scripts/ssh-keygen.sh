#!/bin/bash

mkdir -p ../keys/.ssh
ssh-keygen -m PEM -q -t rsa -N '' -f ../keys/.ssh/vscodespace_rsa 2>/dev/null <<< y >/dev/null
