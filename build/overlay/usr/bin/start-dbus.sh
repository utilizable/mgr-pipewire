#!/bin/bash

# Exit on error
set -e

# Get the current user ID
USER_UID=$(id -u)

# Ensure the dbus directory exists and has correct permissions
sudo mkdir -p /var/run/dbus
sudo chown -R ${USER_UID}:${USER_UID} /var/run/dbus
sudo chmod -R 770 /var/run/dbus

dbus-daemon \
  --session \
  --address=unix:path=${XDG_RUNTIME_DIR}/dbus-session \
  --nofork

DBUS_PID=$!

# Wait for dbus-daemon to start
echo "Waiting for dbus-daemon to start..."
for i in {1..30}; do
  if dbus-daemon --status >/dev/null 2>&1; then
    echo "dbus-daemon is running."
    break
  fi
  sleep 1
done

if ! ps -p $DBUS_PID > /dev/null; then
  echo "dbus-daemon failed to start."
  exit 1
fi
