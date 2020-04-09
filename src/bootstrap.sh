#!/bin/bash
set -e

function closecontainer {
  echo "Closing down"
  exit 0
}

trap closecontainer EXIT HUP INT QUIT PIPE TERM


exec /usr/bin/boinc