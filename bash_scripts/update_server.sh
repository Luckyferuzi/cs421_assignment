#!/bin/bash

# Project directory and log file
PROJECT_DIR="/home/ubuntu/cs421_assignment"
LOG_FILE="/var/log/update.log"

# Ensure log directory exists
sudo mkdir -p /var/log
sudo touch $LOG_FILE
sudo chmod 664 $LOG_FILE

# Timestamp for logging
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Function to log messages
log_message() {
  echo "[$TIMESTAMP] $1" | sudo tee -a $LOG_FILE
}

log_message "Starting server update process..."

# Update Ubuntu packages
if sudo apt update && sudo apt upgrade -y 2>/dev/null; then
  log_message "System packages updated successfully."
else
  log_message "ERROR: System package update failed!"
  exit 1
fi

# Pull latest code from GitHub
cd $PROJECT_DIR
if git pull origin main 2>/dev/null; then
  log_message "Git pull successful."
else
  log_message "ERROR: Git pull failed!"
  exit 1
fi

# Now web server restart needed (using pm2 only)

if pm2 restart cs421-api 2>/dev/null; then
  log_message "PM2 process (cs421-api) restarted successfully."
else
  log_message "ERROR: PM2 process restart failed!"
  exit 1
fi

log_message "Update process completed."
