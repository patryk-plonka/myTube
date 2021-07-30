#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source platform/azure_env.sh

if [ $(az group exists --name ${AZ_RESOURCE_GROUP}) = false ]; then
    az group create \
        --resource-group ${AZ_RESOURCE_GROUP} \
        --location ${AZ_LOCATION}
fi

az acr list \
    --resource-group ${AZ_RESOURCE_GROUP} \
    --query "[?name=='${AZ_ACR_NAME}']" \
    --output tsv || az acr create \
                        --resource-group ${AZ_RESOURCE_GROUP} \
                        --name ${AZ_ACR_NAME} \
                        --sku Basic