#!/bin/bash

echo "Waiting ES..."

until curl -s -u elastic:elastic http://elasticsearch:9200 >/dev/null; do
  sleep 2
done

echo "Creating Kibana service token..."

TOKEN=$(bin/elasticsearch-service-tokens create elastic/kibana kibana-token | grep "=" | awk '{print $NF}')
echo "Token created : $TOKEN"

echo "Writing token into file /tmp/kibana.token and then copy to /token/kibana.token"
ls -l /token
echo "$TOKEN" > /tmp/kibana.token
cp /tmp/kibana.token /token/kibana.token

echo "Finish created token in bootstrap.sh"