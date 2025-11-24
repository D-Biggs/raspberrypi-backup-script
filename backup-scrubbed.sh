#!/bin/bash
# Raspberry Pi Backup Script (Demo Version)
# Author: Dale (Niagara Region, ON)
# Description: Simple rsync-based backup script for Raspberry Pi systems.
# Note: Customize BACKUP_SRC and BACKUP_DEST before use.

# === CONFIGURATION ===
BACKUP_SRC=${BACKUP_SRC:-"/"}              # Source directory (default: root filesystem)
BACKUP_DEST=${BACKUP_DEST:-"/mnt/backup"}  # Destination directory (default: /mnt/backup)
LOG_FILE=${LOG_FILE:-"/var/log/pi-backup.log"} #General log file path

# === SAFETY CHECKS ===
if [ "$BACKUP_DEST" = "/" ]; then
  echo "Error: Backup destination cannot be root!" >&2
  exit 1
fi

if [ ! -d "$BACKUP_DEST" ]; then
  echo "Error: Backup destination $BACKUP_DEST does not exist." >&2
  exit 1
fi

# === BACKUP PROCESS ===
echo "Starting backup from $BACKUP_SRC to $BACKUP_DEST..."
rsync -aAXv --delete "$BACKUP_SRC" "$BACKUP_DEST" >> "$LOG_FILE" 2>&1

if [ $? -eq 0 ]; then
  echo "Backup completed successfully at $(date)" | tee -a "$LOG_FILE"
else
  echo "Backup failed at $(date)" | tee -a "$LOG_FILE"
fi