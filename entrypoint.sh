#!/bin/bash

while getopts f:c:C:v:e:b: option
do
case "${option}"
in
f) EXECUTE_FILE=${OPTARG};;
c) EXECUTE_COMMAND=${OPTARG};;
C) EXECUTE_COMMAND_B64=${OPTARG};;
v) VERBOSE=${OPTARG};;
e) ENV+=("$OPTARG");;
b) EBASH+=("$OPTARG");;
esac
done

if [[ $VERBOSE != '' ]]; then
  export XXH_VERBOSE=$VERBOSE
fi

if [[ $EXECUTE_COMMAND ]]; then
  if [[ $XXH_VERBOSE == '1' || $XXH_VERBOSE == '2' ]]; then
    echo Execute command: $EXECUTE_COMMAND
  fi

  EXECUTE_COMMAND=(-c "${EXECUTE_COMMAND}")
fi

if [[ $EXECUTE_COMMAND_B64 ]]; then
  EXECUTE_COMMAND=`echo $EXECUTE_COMMAND_B64 | base64 -d`
  if [[ $XXH_VERBOSE == '1' || $XXH_VERBOSE == '2' ]]; then
    echo Execute command base64: $EXECUTE_COMMAND_B64
    echo Execute command: $EXECUTE_COMMAND
  fi

  EXECUTE_COMMAND=(-c "${EXECUTE_COMMAND}")
fi

if [[ $EXECUTE_FILE ]]; then
  EXECUTE_COMMAND=""
fi

for env in "${ENV[@]}"; do
  name="$( cut -d '=' -f 1 <<< "$env" )";
  val="$( cut -d '=' -f 2- <<< "$env" )";
  val=`echo $val | base64 -d`

  if [[ $XXH_VERBOSE == '1' || $XXH_VERBOSE == '2' ]]; then
    echo Entrypoint env: raw="$env", name=$name, value=$val
  fi

  export $name="$val"
done

for eb in "${EBASH[@]}"; do
  bash_command=`echo $eb | base64 -d`

  if [[ $XXH_VERBOSE == '1' || $XXH_VERBOSE == '2' ]]; then
    echo Entrypoint bash execute: $bash_command
  fi
  eval $bash_command
done

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $CURRENT_DIR

fish_bin=$CURRENT_DIR/fish-portable/bin/fish.sh
# Check
if [[ ! -f .entrypoint-check-done ]]; then
  check_result=`$fish_bin --version 2>&1`
  if [[ $check_result != *"fish"* ]]; then
    echo "Something went wrong while running fish on host:"
    echo $check_result
  else
    echo $check_result > .entrypoint-check-done
  fi
fi

export XXH_HOME=`dirname $CURRENT_DIR/../../../../p`
# Set the Fish Shell configuration directory, so it is inside
# the .xxh directory located at ~/.xxh/.config/fish
# Normally the Fish Shell configuration directory is ~/.config/fish
export XDG_CONFIG_HOME="$XXH_HOME/.config"
export PATH=$CURRENT_DIR/fish-portable/bin:$PATH

cd ~
$fish_bin "${EXECUTE_COMMAND[@]}"  # $EXECUTE_FILE
