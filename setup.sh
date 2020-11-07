#!/bin/bash

# Set Server Hostname and Host Node in Backup Script passed in the arguments
sed -i s/^SERVER_HOSTNAME=.*/SERVER_HOSTNAME=$1/ /root/mega-backup/backup.sh
sed -i s/^NODE=.*/NODE=$2/ /root/mega-backup/backup.sh

# Run cron.sh for adding cronjob
bash /root/mega-backup/cron.sh "$3"

# install megatools
sudo apt install megatools


