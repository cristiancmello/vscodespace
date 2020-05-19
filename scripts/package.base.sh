#!/bin/bash

echo "Packing your workspace..."

rm -f ../boxes/vscodespace.base.box

vagrant package --base vscodespace-base --output ../boxes/vscodespace.base.box

echo "Your workspace has been packaged"