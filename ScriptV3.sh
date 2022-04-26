#!/bin/bash

STR="#########################"

## Testen Variable
echo $STR

if (( $EUID != 0 )); then
        echo "Please run as Root!"
        exit 1
fi

echo "Staring Time update: $(date)." >> /opt/Scripts/Logs/update.log
echo $STR >> /opt/Scripts/Logs/update.log
echo "Output update" >> /opt/Scripts/Logs/update.log
echo $STR >> /opt/Scripts/Logs/update.log
apt-get update -y | tee -a /opt/Scripts/Logs/update.log
## Download package list from repo. i
echo $STR >> /opt/Scripts/Logs/update.log
echo "Ending Time update: $(date)." >> /opt/Scripts/Logs/update.log
echo " " >> /opt/Scripts/Logs/update.log

echo "Staring Time upgrade: $(date)." >> /opt/Scripts/Logs/update.log
echo $STR >> /opt/Scripts/Logs/update.log
echo "Output upgrade" >> /opt/Scripts/Logs/update.log
echo $STR >> /opt/Scripts/Logs/update.log
apt-get upgrade -y | tee -a /opt/Scripts/Logs/update.log
## Install latest versions of packages.
echo $STR >> /opt/Scripts/Logs/update.log
echo "Ending Time upgrade: $(date)." >> /opt/Scripts/Logs/update.log
echo " " >> /opt/Scripts/Logs/update.log

echo "Staring Time dist-upgrade: $(date)." >> /opt/Scripts/Logs/update.log
echo $STR >> /opt/Scripts/Logs/update.log
echo "Output dist-upgrade" >> /opt/Scripts/Logs/update.log
echo $STR >> /opt/Scripts/Logs/update.log
apt-get dist-upgrade -y | tee -a /opt/Scripts/Logs/update.log
## Install latest versions and changes dependencies.
echo $STR >> /opt/Scripts/Logs/update.log
echo "Ending Time dist-upgrade: $(date)." >> /opt/Scripts/Logs/update.log
echo " " >> /opt/Scripts/Logs/update.log

echo "Staring Time Autoremove: $(date)." >> /opt/Scripts/Logs/update.log
echo $STR >> /opt/Scripts/Logs/update.log
echo "Output Autoremove" >> /opt/Scripts/Logs/update.log
echo $STR >> /opt/Scripts/Logs/update.log
apt-get autoremove -y| tee -a /opt/Scripts/Logs/update.log
## Removes any files that are not needed.
echo $STR >> /opt/Scripts/Logs/update.log
echo "Ending Time Autoremove: $(date)." >> /opt/Scripts/Logs/update.log
echo " " >> /opt/Scripts/Logs/update.log
