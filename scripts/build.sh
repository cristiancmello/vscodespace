#!/bin/bash

./welcome.logo.sh

./print.title.sh "vscodespace build"

echo -e "Generate RSA Key"
./ssh-keygen.sh
./ssh.keys.copy-to-homedir.sh

echo -e "Building your workspace...\n"

vagrant up vscodespaceBase

echo -e "Your workspace has been builded...\n"

./package.base.sh
./box.add.sh

echo -e "Cleaning..."

vagrant destroy --force vscodespaceBase
rm -f ../boxes/vscodespace.base.box

echo -e "Cleaned!"

./read.anykey.sh