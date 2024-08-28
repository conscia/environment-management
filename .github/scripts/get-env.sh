#!/bin/bash

# Set the API endpoint URL
API_URL="https://$CONSCIA_SERVER.conscia.io/api/raw-engine-config"

# For it to be useful as a reimport, we will need to wrap the API results in an engineConfig property.
echo '{"engineConfig": ' > raw.json

# Call the API endpoint using curl and append the response to a file
curl -s -X GET $API_URL \
    -H "Content-Type: application/json" \
    -H "x-customer-code: $CUSTOMER_CODE" \
    -H "x-environment-code: $ENVIRONMENT_CODE" \
    -H "Authorization: Bearer $CONSCIA_TOKEN" \
    >> raw.json

# Complete the wrap.
echo '}' >> raw.json

# Finally, pretty-print the JSON and store it on multiple lines in the actual OUTPUT_FILE, and remove raw.json.
cat raw.json | json_pp > $OUTPUT_FILE
rm raw.json

# Confirm that the response has been written to the file
echo "Response written to $OUTPUT_FILE"
