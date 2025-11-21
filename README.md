# Raspberry Pi Backup Script

## Overview
A simple `rsync`-based script for backing up Raspberry Pi systems.  
Designed for demonstration and educational purposes.

## Usage
1. Clone the repo:
   ```bash
   git clone https://github.com/D-Biggs/raspberrypi-backup-script.git
2. Edit the script variables (BACKUP_SRC, BACKUP_DEST) to match your setup.
3. Run the script:
    sudo ./backup.sh
   
## NOTES
  - Ensure rsync is installed (sudo apt install rsync).
  - Verify backup destination before running — script includes safety checks.
  - Logs are written to /var/log/pi-backup.log by default.

##License
MIT License — free to use and modify.
