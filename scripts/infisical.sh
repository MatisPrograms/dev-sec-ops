#!/bin/bash

response=$(curl --silent --request GET \
  --url https://us.infisical.com/api/v3/secrets/raw \
  --header 'Authorization: Bearer '$INFISICAL_DEV)

touch bash.env

echo $response | jq -r '.secrets[] | "\(.secretKey)=\(.secretValue)"' | while read -r line; do
  echo $line >> bash.env
done
