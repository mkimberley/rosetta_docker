#!/bin/bash
set -e

function closecontainer {
  echo "Closing down"
  exit 0
}

trap closecontainer EXIT HUP INT QUIT PIPE TERM

#construct our command
BOINC_CMD="/usr/bin/boinccmd --project_attach $BOINC_URL $BOINC_KEY $*"


echo -e "Running $BOINC_CMD \n"

exec $BOINC_CMD
