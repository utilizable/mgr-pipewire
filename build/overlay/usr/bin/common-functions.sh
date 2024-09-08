#!/bin/bash

wait_for_lock_file() {
    local lock_file_path="$1"
    local timeout="${2:-30}"  # Default timeout is 30 seconds
    local sleep_interval="${3:-1}"  # Default sleep interval is 1 second

    local elapsed_time=0

    echo "Waiting for lock file: $lock_file_path ..."
    while [ $elapsed_time -lt $timeout ]; do
        if [ -e "$lock_file_path" ]; then
            return 0
        fi
        sleep $sleep_interval
        elapsed_time=$((elapsed_time + sleep_interval))
    done

    echo "Timeout reached. Lock file not found: $lock_file_path."
    return 1
}
