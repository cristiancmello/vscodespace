#!/bin/bash

./welcome.logo.sh

./print.title.sh "vscodespace up"

echo "Starting your workspace..."

vagrant up vscodespace

echo "Your workspace has been started."

./read.anykey.sh