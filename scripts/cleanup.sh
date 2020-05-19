#!/bin/bash

./welcome.logo.sh

./print.title.sh "vscodespace build"

echo "Deleting your workspace..."

vagrant destroy -f vscodespace

echo "Your workspace has been destroyed!"

./read.anykey.sh