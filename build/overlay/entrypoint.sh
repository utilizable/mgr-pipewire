#!/bin/bash

mkdir "${XDG_RUNTIME_DIR}/log"

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
exec /usr/bin/supervisord -c /etc/supervisord.conf --nodaemon
