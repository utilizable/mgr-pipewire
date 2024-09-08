#!/bin/bash


PIPEWIRE_CONF_DIR="/usr/share/pipewire/pipewire.conf.d/"
PIPEWIRE_CONF_PULSE="module_protocol_pulse.conf"

mkdir -p "${PIPEWIRE_CONF_DIR}"
cat <<EOF > "${PIPEWIRE_CONF_DIR}${PIPEWIRE_CONF_PULSE}"
context.modules = [

    { name = libpipewire-module-protocol-pulse
      args = {
          server.address = [
              "tcp:${PIPEWIRE_PORT}"
          ]
          default.clock.quantum       = 32
          default.clock.min-quantum   = 16
          default.clock.max-quantum   = 768
          server.dbus-name            = "org.pulseaudio-pipewire.Server"
      }
    }
]
EOF
