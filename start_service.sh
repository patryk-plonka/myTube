#!/bin/bash
#
# GOTO:
# http://localhost:3000/video
# USAGE:
# chmod +x start_service.sh
# ./start_service.sh 3000 or
# ./start_service.sh

set -euo pipefail
IFS=$'\n\t'

# set default values
ENV="prod"
PORT=3000
# get paramethers
while getopts e:p: flag
do
    case "${flag}" in
        e) ENV=${OPTARG};;
        p) PORT=${OPTARG};;
    esac
done
echo "Environment: $ENV";
echo "Port: $PORT";

# set PORT environment variale
export PORT=$PORT

# start service and install dependencies
if [ $ENV = "prod" ]
then
  npm install --only=production
  echo "Starting: $ENV";
  npm start
elif [ $ENV = "dev" ]
then
  npm install
  echo "Starting: $ENV";
  npm run start:dev
else
  echo "Unknown environment! Quiting...."
fi
