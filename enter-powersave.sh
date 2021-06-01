#!/bin/bash

sed -i "s/TLP_ENABLE=0/TLP_ENABLE=1/" /etc/tlp.conf
tlp start

systemctl unmask thermald.service
systemctl enable thermald.service
systemctl start thermald.service

systemctl stop lenovo_fix.service
systemctl disable lenovo_fix.service

echo "Powersaving applied" > ~/powersave-status.txt
