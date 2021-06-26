#!/bin/bash
#
# GOTO:
# http://localhost:3000/video
# USAGE:
# chmod +x start_service.sh
# ./start_service.sh 3000 or
# ./start_service.sh

set -euo pipefail

# install dependencies
npm install

# set PORT environment variale

export PORT=${1:-3000}

# start service
# OLD value -> node Hello/index.js
npm start