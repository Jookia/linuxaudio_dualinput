#!/bin/bash
set -e
if test "${SUDO_USER}" == ""; then
  echo "Please run this script using sudo!"
  exit 1
fi
rm /etc/udev/rules.d/91-pulseaudio-aux.rules
for i in /usr/share/pulseaudio/alsa-mixer /usr/share/alsa-card-profile/mixer; do
  test -d $i || continue
  rm $i/profile-sets/custom-aux.conf
  rm $i/paths/custom-aux-*.conf
done
udevadm trigger -ssound
exit 0
