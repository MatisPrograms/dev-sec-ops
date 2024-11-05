#!/bin/bash

if [ -z "$CIRCLE_BRANCH" ] || [ "$CIRCLE_BRANCH" == "main" ]; then
  INFISICAL_TOKEN=$INFISICAL_PROD
else
  INFISICAL_TOKEN=$INFISICAL_DEV
fi

echo "Fetching secrets from Infisical for $CIRCLE_BRANCH branch using token $INFISICAL_TOKEN"

response=$(curl --silent --request GET \
  --url https://us.infisical.com/api/v3/secrets/raw \
  --header 'Authorization: Bearer '$INFISICAL_TOKEN)

touch bash.env

echo $response | jq -r '.secrets[] | "\(.secretKey)=\(.secretValue)"' | while read -r line; do
  echo $line >> bash.env
done
