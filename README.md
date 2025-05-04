# CS421 Assignment 1
## KHALIFA FERUZI KAHAMBA
## T21-03-01820


## Overview
A simple API built with Node.js, Express, and MySQL, deployed on AWS EC2.

## Setup Instructions
1. Clone the repo: `git clone https://github.com/Luckyferuzi/cs421_assignment.git`
2. Install dependencies: `npm install`
3. Set up MySQL database (see SQL setup in project notes).
4. Start the server: `npm start`

## Dependencies
- express
- mysql2

## Endpoints
- `GET /students`: Returns a list of students with names and programs.
- `GET /subjects`: Returns a list of Software Engineering subjects by year.

## Deployment
Hosted on AWS EC2 Ubuntu instance (t3.micro).
- Base URL: http://16.171.225.235:3000
- students url: http://16.171.225.235:3000/students
- subjects url: http://16.171.225.235:3000/subjects

## Backup Schemes

### 1. Full Backup
- **Execution**: Copies all data (e.g., project files and database) every time using `tar` and `mysqldump`.
- **Advantages**:
  - Easy to restore with a single backup.
  - Independent of previous backups.
- **Disadvantages**:
  - Consumes more time and storage.
  - Redundant data backup fills up space quickly.

### 2. Incremental Backup
- **Execution**: Backs up only changes since the last backup (full or incremental) using `rsync` and `mysqldump`.
- **Advantages**:
  - Faster and more storage-efficient.
  - Ideal for frequent backups.
- **Disadvantages**:
  - Restoration requires the last full backup plus all incremental backups.
  - Risk of data loss if one backup fails.

### 3. Differential Backup
- **Execution**: Backs up all changes since the last full backup using `rsync` and `mysqldump`.
- **Advantages**:
  - Faster restoration than incremental (needs only the last full and latest differential).
  - More reliable than incremental.
- **Disadvantages**:
  - Backup size increases over time.
  - Slower than incremental backups.
## Bash Scripts for Server Management

### Overview
These scripts automate server management tasks for the API deployed on AWS EC2.

### Scripts

#### 1. health_check.sh
- **Purpose**: Monitors server resource usage (CPU, memory, disk) and API status.
- **Features**:
  - Checks CPU, memory, and disk usage.
  - Verifies Apache2 is running.
  - Tests API endpoints `/students` and `/subjects`.
  - Logs results to `/var/log/server_health.log`.

#### 2. backup_api.sh
- **Purpose**: Backs up API project files and database.
- **Features**:
  - Backs up project directory to `/home/ubuntu/backups/api_backup_<date>.tar.gz`.
  - Exports MySQL database to `/home/ubuntu/backups/db_backup_<date>.sql`.
  - Deletes backups older than 7 days.
  - Logs to `/var/log/backup.log`.

#### 3. update_server.sh
- **Purpose**: Updates server and API.
- **Features**:
  - Updates Ubuntu packages.
  - Pulls latest code from GitHub.
  - Restarts Apache2 and PM2 process.
  - Logs to `/var/log/update.log`.

### Setup Instructions
1. Clone the repository: `git clone https://github.com/Luckyferuzi/cs421_assignment.git`
2. Navigate to `bash_scripts` directory: `cd cs421_assignment/bash_scripts`
3. Set execute permissions: `chmod +x health_check.sh backup_api.sh update_server.sh`
4. Ensure dependencies are installed:
   - `curl` (for API checks): `sudo apt install curl`
   - `mysql-client` (for database backup): `sudo apt install mysql-client`
5. Run scripts manually or schedule with cron (see below).

### Dependencies
- `curl`: For testing API endpoints.
- `mysql-client`: For database backups.
- `apache2` and `pm2`: For web server and process management.

## Docker Hub
- Docker image: https://hub.docker.com/r/luckyferuzi/cs421-api

## Overview
This repository contains a front-end application and API for the CS421 assignment, deployed using Docker and a load balancer.

## Prerequisites
- Docker and Docker Compose installed
- Git
- Access to an EC2 instance with a public IP

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/Luckyferuzi/cs421_assignment.git
cd cs421_assignment

##Load Balancer Setup
Tool Chosen: Mginx was selected as the load balancer

configuration file:
the nginx.conf file configures NGINX to distribute traffic across three front-end instances (frontend1,frontend2,frontend3)

Docker integration
Dockerfile.nginx is ued to build the load balancer image (cs421-loadbalancer);

docker-compose.yml  includes the load balancer services (loadbalancer) alongside three front-end instances, a single API instances and the databases

Network all services are connected via the app-network (bridge driver)

 Version Control and Docker Registry





Version Control:





All changes (Dockerfile, docker-compose.yml, front-end code, nginx.conf, updated README.md) are committed to the GitHub repository.



Docker Registry:





Docker images (cs421-api, cs421-frontend, cs421-loadbalancer) are uploaded to Docker Hub (see below for URLs).
