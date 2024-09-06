#!/bin/bash

cat <<EOF > /usr/share/pipewire/pipewire.conf.d/module_protocol_pulse.conf
context.modules = [
    { name = libpipewire-module-protocol-pulse
      args = {
          server.address = [
              "tcp:${PIPEWIRE_PORT}"
          ]
      }
    }
]
EOF

# disable module.jack
#sudo sed -i 's/module.jackdbus-detect = true/module.jackdbus-detect = false/' /usr/share/pipewire/pipewire.conf

#    { name = libpipewire-module-zeroconf-discover
#      args = { }
#    }
