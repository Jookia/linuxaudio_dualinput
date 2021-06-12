#!/bin/bash
set -e
if test "${SUDO_USER}" == ""; then
  echo "Please run this script using sudo!"
  exit 1
fi
cp -v udev/* /etc/udev/rules.d/
cp -v profiles/* /usr/share/pulseaudio/alsa-mixer/profile-sets/
cp -v paths/* /usr/share/pulseaudio/alsa-mixer/paths/
udevadm trigger -ssound
exit 0
