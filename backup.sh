#!/bin/bash

# Assign values to parameters that will be used in Script
SERVER_HOSTNAME=
NODE=

# old backup
DATEFORM="$(date +%Y-%m-%d)"
OLD_BACKUP_DATE=$(date +"%Y-%m-%d" -d "7 days ago")

# create folder
megamkdir "/Root/"$SERVER_HOSTNAME

# Clean old Backup and Journal Files
rm -rf /home/*/backup/* /var/log/journal/*/*.journal
wait

echo "~~~~~~~~~~~~~~ Starting BACKUP Creation and Upload to Mega ~~~~~~~~~~~~~~"
echo $DATEFORM
start=$SECONDS
ls -1 /home -Icyberpanel -Idocker -Ibackup -Ilscache -Ivmail | while read user; do
cyberpanel createBackup --domainName $user
sleep 45
while ! grep "Completed" /home/$user/backup/status > /dev/null;do sleep 60;done

# create user folder
megamkdir "/Root/"$SERVER_HOSTNAME/$user

# upload backup
megaput --path "/Root/"$SERVER_HOSTNAME/$user/"status_"$DATEFORM.txt /home/$user/backup/status
megaput --path "/Root/"$SERVER_HOSTNAME/$user/$DATEFORM.tar.gz /home/$user/backup/*.tar.gz

# remove old backup
megarm "/Root/"$SERVER_HOSTNAME/$user/"status_"$OLD_BACKUP_DATE".txt"
megarm "/Root/"$SERVER_HOSTNAME/$user/$OLD_BACKUP_DATE".tar.gz"

wait
# Clean backup directory
rm -rf /home/$user/backup/*
wait
done
echo "~~~~~~~~~~~~~~ Backup Creation and Upload to Mega Finished ~~~~~~~~~~~~~~"
duration=$(( SECONDS - start ))
echo "Total Time Taken $duration Seconds"

exit
