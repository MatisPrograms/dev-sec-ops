#!/bin/bash

INFISICAL_TOKEN=${CIRCLE_BRANCH:-main} == "main" ? $INFISICAL_PROD : $INFISICAL_DEV

response=$(curl --silent --request GET \
  --url https://us.infisical.com/api/v3/secrets/raw \
  --header 'Authorization: Bearer '$INFISICAL_TOKEN)

touch bash.env

echo $response | jq -r '.secrets[] | "\(.secretKey)=\(.secretValue)"' | while read -r line; do
  echo $line >> bash.env
done
