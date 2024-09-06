#!/bin/bash

wait_for_dbus() {
    local timeout="${1:-30}"  # Default timeout is 30 seconds
    local sleep_interval="${2:-1}"  # Default sleep interval is 1 second

    local elapsed_time=0
    local dbus_session_path="${XDG_RUNTIME_DIR}/dbus-session"

    while [ $elapsed_time -lt $timeout ]; do
        if [ -e "$dbus_session_path" ]; then
            echo "D-Bus session is available."
            export DBUS_SESSION_BUS_ADDRESS=unix:path=$dbus_session_path
            return 0
        fi
        echo "Waiting for D-Bus session..."
        sleep $sleep_interval
        elapsed_time=$((elapsed_time + sleep_interval))
    done

    echo "Timeout reached. D-Bus session not found."
    return 1
}

wait_for_x() {
    MAX=60 # About 30 seconds
    CT=0
    while ! xdpyinfo >/dev/null 2>&1; do
        sleep 0.50s
        CT=$(( CT + 1 ))
        if [ "$CT" -ge "$MAX" ]; then
            echo "FATAL: $0: Gave up waiting for X server $DISPLAY"
            exit 1
        fi
    done
}
