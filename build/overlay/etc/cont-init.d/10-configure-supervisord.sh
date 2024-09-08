#!/bin/bash

cat <<EOF >> /etc/supervisord.conf

[unix_http_server]
file=${XDG_RUNTIME_DIR}/supervisor.sock
chmod=0700

[inet_http_server]
port=*:${SUPERVISOR_PORT:-9001}

[supervisorctl]
serverurl=*:${SUPERVISOR_PORT:-9001}

EOF
