#!/bin/bash

response=$(curl --silent --request GET \
  --url https://us.infisical.com/api/v3/secrets/raw \
  --header 'Authorization: Bearer '$INFISICAL_API_KEY)

echo $response | jq -r '.secrets[] | "export \(.secretKey)=\(.secretValue)"' | while read -r line; do
  echo "Setting secret: $line"
  eval $line >> $BASH_ENV
done

cp $BASH_ENV bash.env