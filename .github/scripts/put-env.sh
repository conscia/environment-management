#!/bin/bash

# Set the API endpoint URL
API_URL="https://$CONSCIA_SERVER.conscia.io/api/engine-config?preserveEnvironmentVariables=true&preserveSecrets=true"

# Call the API endpoint using curl and write the response to a file
curl -s -X PUT $API_URL \
    -H "Content-Type: application/json" \
    -H "x-customer-code: $CUSTOMER_CODE" \
    -H "x-environment-code: $ENVIRONMENT_CODE" \
    -H "Authorization: Bearer $CONSCIA_TOKEN" \
    --data-binary "@$INPUT_FILE"

# Confirm that the response has been written to the file
echo "Response written to Conscia from $INPUT_FILE"
