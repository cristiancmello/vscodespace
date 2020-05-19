#!/bin/bash

./welcome.logo.sh

./print.title.sh "vscodespace down"

echo "Halting your workspace..."

vagrant halt vscodespace

echo "Your workspace has been halted."

./read.anykey.sh