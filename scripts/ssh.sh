#!/bin/bash

./welcome.logo.sh

./print.title.sh "vscodespace ssh"

ssh -i ../keys/.ssh/vscodespace_rsa "vagrant@localhost" -p 2222

./read.anykey.sh