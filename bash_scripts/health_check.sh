#!/bin/bash

# Log file
LOG_FILE="/var/log/server_health.log"

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

# Initialize log entry
log_message "Starting server health check..."

# Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
log_message "CPU Usage: $CPU_USAGE%"

# Check memory usage
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
log_message "Memory Usage: $MEM_USAGE%"

# Check disk space
DISK_USAGE=$(df -h / | grep / | awk '{print $5}' | cut -d'%' -f1)
log_message "Disk Usage: $DISK_USAGE%"
if [ $DISK_USAGE -gt 90 ]; then
  log_message "WARNING: Disk space is below 10% free!"
fi

# Check if PM2 process (cs421-api) is running
if pm2 list | grep -q "cs421-api"; then
  log_message "PM2 Process (cs421-api): Running"
else
  log_message "WARNING: PM2 Process (cs421-api) is not running!"
fi

# Check API endpoints
ENDPOINT1="http://16.171.225.235:3000/students"
ENDPOINT2="http://16.171.225.235:3000/subjects"

# Test /students endpoint
STATUS1=$(curl -s -o /dev/null -w "%{http_code}" $ENDPOINT1)
if [ "$STATUS1" -eq 200 ]; then
  log_message "API Endpoint /students: 200 OK"
else
  log_message "WARNING: API Endpoint /students failed with status $STATUS1"
fi

# Test /subjects endpoint
STATUS2=$(curl -s -o /dev/null -w "%{http_code}" $ENDPOINT2)
if [ "$STATUS2" -eq 200 ]; then
  log_message "API Endpoint /subjects: 200 OK"
else
  log_message "WARNING: API Endpoint /subjects failed with status $STATUS2"
fi

log_message "Health check completed."
