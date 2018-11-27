#!/bin/bash

###############################################################
#  Script     : uninstall.sh
#  Author     : Petr Všetečka
#  Email      : vsetecka@cesnet.cz
#  Date       : 27/11/2018
#  Description: fast uninstalling custom motd messages
#  Args       : none
###############################################################
#  Notes:
#     - requires root privileges
###############################################################


if [[ `id -u` -ne 0 ]]
then
  echo "This script requires root privileges."
  exec sudo "$0" "$@"
fi

echo
echo "Removing added files.."
rm /etc/update-motd.d/11-welcome
rm /etc/update-motd.d/13-uptime
rm /etc/update-motd.d/15-hwstats
rm /etc/update-motd.d/17-users
rm /etc/update-motd.d/19-updates
echo "Done."

echo
echo "Re-enabling original message.."
mv /etc/motd.bak /etc/motd && echo "Done."

echo
echo "Setting back automatic flags on packages.."
apt-mark auto lsb-release

echo
echo "Uninstallation complete."
