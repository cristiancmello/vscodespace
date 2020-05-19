#!/bin/bash

echo "Adding package as box"

vagrant box add --force vscodespace-base file:///c:../boxes/vscodespace.base.box

echo "Box created"