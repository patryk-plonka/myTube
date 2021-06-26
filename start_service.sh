#!/bin/bash
#
# GOTO:
# http://localhost:3000/video
# USAGE:
# chmod +x start_service.sh
# ./start_service.sh 3000 or
# ./start_service.sh

set -euo pipefail

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

# install dependencies
npm install

# set PORT environment variale
export PORT=$PORT

# start service
# OLD value -> node Hello/index.js
echo "Starting: $ENV";
if [ $ENV = "prod" ]
then
  npm start
elif [ $ENV = "dev" ]
then
  npm run start:dev
else
  echo "Unknown environment! Quiting...."
fi
