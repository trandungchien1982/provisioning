#!/bin/bash

echo "Waiting for token..."

while [ ! -f /token/kibana.token ]; do
  sleep 2
done

TOKEN=$(cat /token/kibana.token)

echo "Starting Kibana..."

exec /usr/local/bin/kibana-docker \
  --elasticsearch.hosts=http://elasticsearch:9200 \
  --elasticsearch.serviceAccountToken="$TOKEN"