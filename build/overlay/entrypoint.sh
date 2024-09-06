#!/bin/bash

#export UUID=1000
#
#sudo mkdir /run/user/${UUID}
#sudo chown -R ${UUID}:${UUID} /run/user/${UUID}
#sudo chmod 0700 /run/user/${UUID}
#
#sudo chown -R ${UUID}:${UUID} /tmp
#sudo chmod -R a+rwX /tmp
#sudo chmod 0700 /tmp
#
#export XDG_RUNTIME_DIR=/run/user/$(id -u)

#
#export XDG_RUNTIME_DIR=/run/user/$(id -u)
# startup 01_envs.sh
#export DISABLE_RTKIT=y
#export XDG_RUNTIME_DIR=/tmp
#export PIPEWIRE_RUNTIME_DIR=/tmp
#export PULSE_RUNTIME_DIR=/tmp
#export DISPLAY=:0.0

# startup/10_dbus.sh
#sudo mkdir -p /run/dbus
#dbus-daemon --system --fork

# startup/20_xvfb.sh
#Xvfb -screen $DISPLAY &

# startup/30_pipewire.sh
#sudo mkdir -p /dev/snd
#pipewire &
#pipewire-pulse

# Change Permissions for config dir
#sudo chmod -R a+rwX /tmp

# Execute all container init scripts
for init_script in /etc/cont-init.d/*.sh; do
    echo "${init_script}"
    sudo chmod +x "${init_script}"
    sudo -E "${init_script:?}"
done

# Prepare all run-* scripts 
for init_script in /usr/bin/start-*.sh; do
    echo $init_script
    sudo chmod +x ${init_script}
done

# Start supervisord
mkdir -p /var/log/supervisor
sudo chmod a+rw /var/log/supervisor

#bash -c "dbus-run-session -- /usr/bin/supervisord"

#dbus-run-session -- /usr/bin/supervisord -c /etc/supervisord.conf --nodaemon

exec /usr/bin/supervisord -c /etc/supervisord.conf --nodaemon
