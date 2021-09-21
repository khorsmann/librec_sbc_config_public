#!/bin/bash

API_URL="https://192.168.122.253:8443/libreapi/"
HEADER="Content-Type: application/json"

echo "Step 1 - define cluster node"
curl -k -X PUT -H ${HEADER} -d @./default_global_cluster.json ${API_URL}cluster

echo "Step 1 - define netalias"
curl -k -X POST -H ${HEADER} -d @./internal-netalias.json ${API_URL}base/netalias
curl -k -X POST -H ${HEADER} -d @./external-netalias.json ${API_URL}base/netalias

echo "Step 2 - create sipprofiles"
curl -k -X POST -H ${HEADER} -d @./internal-sipprofile.json ${API_URL}sipprofile
curl -k -X POST -H ${HEADER} -d @./external-sipprofile.json ${API_URL}sipprofile

echo "Step 3 - define media_class and capacity"
curl -k -X POST -H ${HEADER} -d @./media_class_pcma.json ${API_URL}class/media
curl -k -X POST -H ${HEADER} -d @./default_capacity.json ${API_URL}class/capacity

echo "Step 4 - interconnection/outbound and gateway"
curl -k -X POST -H ${HEADER} -d @./gateway_internal.json ${API_URL}base/gateway
curl -k -X POST -H ${HEADER} -d @./interconnection_outbound.json ${API_URL}interconnection/outbound

echo "Step 5 - action route - connection of step 4"
curl -k -X POST -H ${HEADER} -d @./default_inbound_routing.json ${API_URL}routing/table

echo "Step 6 - Public-IP (User) ---> Public IP (libresbc)"
curl -k -X POST -H ${HEADER} -d @./interconnection-inbound.json ${API_URL}interconnection/inbound

echo "exit - nothing configured"
exit 
