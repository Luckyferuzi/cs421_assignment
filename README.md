# CS421 Assignment 1
## KHALIFA FERUZI KAHAMBA
## T21-03-01820


## Overview
A simple API built with Node.js, Express, and MySQL, deployed on AWS.

## Setup Instructions
1. Clone the repo: `git clone <repo-url>`
2. Install dependencies: `npm install`
3. Set up MySQL database by creating database called cs421_db
4. importin cs421_db.sql
5. Start the server: `npm start`

## Dependencies
- express
- mysql2

## Endpoints
- `GET /students`: Returns a list of students with names and programs.
- `GET /subjects`: Returns a list of Software Engineering subjects by year.

## Deployment
tried to host in a AWS and HEROKU but failed due to priviledge account