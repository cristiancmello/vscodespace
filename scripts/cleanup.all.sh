#!/bin/bash

./welcome.logo.sh

./print.title.sh "vscodespace cleanup all"

echo "Deleting your workspace and base box"

vagrant destroy -f vscodespace vscodespaceBase
vagrant box remove -f vscodespace-base

echo "Your workspace and base box has been destroyed!"

./read.anykey.sh