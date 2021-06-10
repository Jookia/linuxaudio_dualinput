#!/bin/bash
set -e
if test "${SUDO_USER}" == ""; then
  echo "Please run this script using sudo!"
  exit 1
fi
cp udev/* /etc/udev/rules.d/
cp profiles/* /usr/share/pulseaudio/alsa-mixer/profile-sets/
cp paths/* /usr/share/pulseaudio/alsa-mixer/paths/
udevadm trigger -ssound
test /bin/systemd && systemctl --machine=${SUDO_USER}@.host --user restart pulseaudio
exit 0
