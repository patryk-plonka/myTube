#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

#######################################################
## Set Azure environment variables
#######################################################

export AZ_RESOURCE_GROUP="rgMyTube"
export AZ_LOCATION="westeurope"

export AZ_ACR_NAME="acrMyTube"
export AZ_ACR_LOGIN_SERVER=$(az acr list \
    --resource-group ${AZ_RESOURCE_GROUP} \
    --query "[?name == \`${AZ_ACR_NAME}\`].loginServer | [0]" \
    --output tsv 
    )

