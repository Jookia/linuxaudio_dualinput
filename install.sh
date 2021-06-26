#!/bin/bash
set -e
if test "${SUDO_USER}" == ""; then
  echo "Please run this script using sudo!"
  exit 1
fi
cp -v udev/* /etc/udev/rules.d/
for i in /usr/share/pulseaudio/alsa-mixer /usr/share/alsa-card-profile/mixer; do
  test -d $i || continue
  cp -v profiles/* $i/profile-sets/
  cp -v paths/* $i/paths/
done
udevadm trigger -ssound
exit 0
