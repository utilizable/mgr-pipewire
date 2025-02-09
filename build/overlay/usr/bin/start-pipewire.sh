#!/bin/bash

set -e
source /usr/bin/common-functions.sh

# CATCH TERM SIGNAL:
_term() {
    kill -TERM "$pid" 2>/dev/null
}
trap _term SIGTERM SIGINT

#################

wait_for_lock_file "${XDG_RUNTIME_DIR}/dbus-session" 30 1  # For D-Bus session

pipewire &

#################

pid=$!

# WAIT FOR CHILD PROCESS:
wait "$pid"
