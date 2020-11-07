#!/bin/bash

# Prepare cronjob

CRON_TIME="$1"
CRON_CMD="bash /root/mega-backup/backup.sh >> /root/mega-backup/backup.log 2>&1"
CRON_JOB="$CRON_TIME $CRON_CMD"

# Backup Current cronjobs to file

crontab -l >> /root/cron.jobs.list

# Add cron rule in crontab without any duplicate

( crontab -l | grep -v -F "$CRON_CMD" ; echo "$CRON_JOB" ) | crontab -

