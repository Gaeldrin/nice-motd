#!/bin/bash

###############################################################
#  Script     : install.sh
#  Author     : Petr Všetečka
#  Email      : vsetecka@cesnet.cz
#  Date       : 27/11/2018
#  Description: fast installing custom motd messages
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
echo "Making sure necessary packages are installed.."
#apt-get -y install lsb-release
echo "Done."

echo
echo "Copying new files.."
cp -R ${BASH_SOURCE%/*}/update-motd.d/ /etc/.
echo "Done."

echo
echo "Disabling original not useful message.."
#mv /etc/motd /etc/motd.bak
echo "Done."

echo
echo "Installation complete."
