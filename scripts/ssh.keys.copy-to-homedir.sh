#!/bin/bash

cp ../keys/.ssh/vscodespace* ~/.ssh

echo "
Host localhost
  HostName localhost
  IdentityFile ~/.ssh/vscodespace_rsa
  User vagrant
  Port 2222" >> ~/.ssh/config