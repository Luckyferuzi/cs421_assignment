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
