#!/bin/bash

# Create resource groups for example template deployment.

# Variables
AZLOCATION="centralus"
RGNAMEPREFIX="hbl-w-"
RGNAMESUFFIX=("management" "network" "monitoring")

# Loop and create Resource Group(s)
for RG in "${RGNAMESUFFIX[@]}"
do
    # Concat Resource Group name
    RGNAME="$RGNAMEPREFIX$RG"
    echo "Creating $RGNAME resource group in $AZLOCATION."

    # Create Resource Group
    az group create \
        --name "$RGNAME" \
        --location "$AZLOCATION"
done
