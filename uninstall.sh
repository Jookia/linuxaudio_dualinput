#!/bin/bash
set -e
if test "${SUDO_USER}" == ""; then
  echo "Please run this script using sudo!"
  exit 1
fi
rm /etc/udev/rules.d/91-pulseaudio-aux.rules
rm /usr/share/pulseaudio/alsa-mixer/profile-sets/custom-aux.conf
rm /usr/share/pulseaudio/alsa-mixer/paths/custom-aux-*.conf
udevadm trigger -ssound
test /bin/systemd && systemctl --machine=${SUDO_USER}@.host --user restart pulseaudio
exit 0
