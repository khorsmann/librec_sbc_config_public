#!/bin/bash

API_URL="https://192.168.122.253:8443/libreapi/"
HEADER="Content-Type: application/json"

curl -k -X POST -H ${HEADER} -d @./internal-netalias.json ${API_URL}base/netalias
curl -k -X POST -H ${HEADER} -d @./internal-sipprofile.json ${API_URL}sipprofile

curl -k -X POST -H ${HEADER} -d @./external-netalias.json ${API_URL}base/netalias
curl -k -X POST -H ${HEADER} -d @./external-sipprofile.json ${API_URL}sipprofile

curl -k -X POST -H ${HEADER} -d @./core-netalias.json ${API_URL}base/netalias
curl -k -X POST -H ${HEADER} -d @./core-sipprofile.json  ${API_URL}sipprofile

curl -k -X POST -H ${HEADER} -d @./access-domain.json ${API_URL}access/domain-policy
curl -k -X POST -H ${HEADER} -d @./access-service.json ${API_URL}access/service

curl -k -X POST -H ${HEADER} -d @./media_class_pcma.json ${API_URL}class/media
curl -k -X POST -H ${HEADER} -d @./gateway_internal.json ${API_URL}base/gateway

curl -k -X PUT -H ${HEADER} -d @./default_global_cluster.json ${API_URL}cluster
curl -k -X POST -H ${HEADER} -d @./default_capacity.json ${API_URL}class/capacity
curl -k -X POST -H ${HEADER} -d @./interconnection_outbound.json ${API_URL}interconnection/outbound

curl -k -X POST -H ${HEADER} -d @./default_inbound_routing.json ${API_URL}routing/table

# here
###curl -k -X POST -H ${HEADER} -d @./default_in_routing_record.json ${API_URL}routing/record
curl -k -X POST -H ${HEADER} -d @./interconnection-inbound.json ${API_URL}interconnection/inbound
curl -k -X PATCH -H ${HEADER} -d @./firewall_whiteset.json ${API_URL}base/firewall/whiteset
curl -k -X POST -H ${HEADER} -d @./access-directory-user.json ${API_URL}access/directory/user
