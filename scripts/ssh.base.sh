#!/bin/bash

ssh -i ../keys/.ssh/vscodespace_rsa "vagrant@localhost" -p 2222

./read.anykey.sh