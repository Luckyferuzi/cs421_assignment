#!/bin/bash

# Directories and files
PROJECT_DIR="/home/ubuntu/cs421_assignment"
BACKUP_DIR="/home/ubuntu/backups"
BACKUP_FILE="$BACKUP_DIR/api_backup_$(date +%F).tar.gz"
DB_BACKUP_FILE="$BACKUP_DIR/db_backup_$(date +%F).sql"
LOG_FILE="/var/log/backup.log"

# MySQL credentials (using cs421_user from previous setup)
DB_USER="cs421_user"
DB_PASS="securepassword123"
DB_NAME="cs421_db"

# Ensure directories exist
sudo mkdir -p $BACKUP_DIR
sudo mkdir -p /var/log
sudo touch $LOG_FILE
sudo chmod 664 $LOG_FILE

# Timestamp for logging
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Function to log messages
log_message() {
  echo "[$TIMESTAMP] $1" | sudo tee -a $LOG_FILE
}

log_message "Starting backup process..."

# Backup project files
if tar -czf $BACKUP_FILE $PROJECT_DIR; then
  log_message "Project backup successful: $BACKUP_FILE"
else
  log_message "ERROR: Project backup failed! Check tar command output above."
  exit 1
fi

# Backup database
if mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $DB_BACKUP_FILE 2>/dev/null; then
  log_message "Database backup successful: $DB_BACKUP_FILE"
else
  log_message "ERROR: Database backup failed!"
  exit 1
fi

# Delete backups older than 7 days
find $BACKUP_DIR -name "api_backup_*.tar.gz" -mtime +7 -delete
find $BACKUP_DIR -name "db_backup_*.sql" -mtime +7 -delete
log_message "Deleted backups older than 7 days."

log_message "Backup process completed."
