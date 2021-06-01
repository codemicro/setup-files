#!/bin/bash

sed -i "s/TLP_ENABLE=1/TLP_ENABLE=0/" /etc/tlp.conf
echo "TLP disabled, restart required to take effect"

systemctl stop thermald.service
systemctl disable thermald.service
systemctl mask thermald.service

systemctl enable lenovo_fix.service
systemctl start lenovo_fix.service

echo "Powersaving not applied" > ~/powersave-status.txt
