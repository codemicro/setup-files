#!/bin/bash

# RESTIC BACKUP TOOL
# https://restic.net/

wget  https://github.com/restic/restic/releases/download/v0.12.1/restic_0.12.1_linux_amd64.bz2
bzip2 -d restic_0.12.1_linux_amd64.bz2

sudo mv restic_0.12.1_linux_amd64 /opt/bin/restic
sudo chmod +x /opt/bin/restic
