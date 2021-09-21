#!/bin/bash

API_URL="https://192.168.122.253:8443/libreapi/"
HEADER="Content-Type:application/json"

echo "Define Netalias Kamilio External"
curl -k -X POST -H ${HEADER} -d @./netalias_external.json ${API_URL}base/netalias

echo "Define domain"
curl -k -X POST -H ${HEADER} -d @./access_domain.json ${API_URL}access/domain-policy

echo "Define access service"
curl -k -X POST -H ${HEADER} -d @./access_service.json ${API_URL}access/service

echo "Define media classes"
curl -k -X POST -H ${HEADER} -d @./media_class_pcma.json ${API_URL}class/media

echo "Define cluster node"
curl -k -X PUT -H ${HEADER} -d @./cluster_members.json ${API_URL}cluster

echo "Define Netalias FS Internal"
curl -k -X POST -H ${HEADER} -d @./netalias_FS_internal.json ${API_URL}base/netalias

echo "Define Netalias FS loopback"
curl -k -X POST -H ${HEADER} -d @./netalias_FS_loopback.json ${API_URL}base/netalias

echo "Create sipprofile FS internal"
curl -k -X POST -H ${HEADER} -d @./sipprofile_FS_internal.json ${API_URL}sipprofile

echo "Create sipprofile FS loopback"
curl -k -X POST -H ${HEADER} -d @./sipprofile_FS_loopback.json ${API_URL}sipprofile
sleep 1

echo "Create testuser"
curl -k -X POST -H ${HEADER} -d @./directory_testuser.json ${API_URL}access/directory/user

echo "Define overall capacity classes"
curl -k -X POST -H ${HEADER} -d @./capacity_class.json ${API_URL}class/capacity

sleep 2

echo "Step 4 - interconnection/outbound and gateway"
curl -k -X POST -H ${HEADER} -d @./gateway_internal.json ${API_URL}base/gateway
curl -k -X POST -H ${HEADER} -d @./interconnection_core.json ${API_URL}interconnection/outbound

echo "Create Routing to core"
curl -k -X POST -H ${HEADER} -d @./routing_to_core.json ${API_URL}routing/table

echo "interconnection loopback"
curl -k -X POST -H ${HEADER} -d @./interconnection_loopback.json ${API_URL}interconnection/inbound


exit




#echo "Step 5 - action route - connection of step 4"
#curl -k -X POST -H ${HEADER} -d @./default_inbound_routing.json ${API_URL}routing/table

#echo "Step 6 - Public-IP (User) ---> Public IP (libresbc)"
#curl -k -X POST -H ${HEADER} -d @./interconnection-inbound.json ${API_URL}interconnection/inbound

exit 
