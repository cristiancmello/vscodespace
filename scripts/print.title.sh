#!/bin/bash

ARGS=$1
TITLE=${ARGS[0]}

WELCOME_SIZE_WIDTH=55

let WELCOME_POS_CENTERED=$WELCOME_SIZE_WIDTH/2
let TITLE_STRLEN=${#TITLE}
let TITLE_POS_CENTERED=$TITLE_STRLEN/2
let SPACES_TO_CENTRALIZE=$WELCOME_POS_CENTERED-$TITLE_POS_CENTERED

SPACES_COUNTER=$SPACES_TO_CENTRALIZE

while [ $SPACES_COUNTER != "0" ]; do
  let SPACES_COUNTER--
  printf " "
done

echo -e "\e[1m${TITLE}\e[0m\n"