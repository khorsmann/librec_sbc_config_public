### libresbc_config

* libre node srv09
* libre sbc public  ip XX.XX.XX.XX / domain your-fqdn-dns-name
* libre sbc private ip 192.168.122.253

* test-pbx/carrier internal 192.168.122.200 port 5080 udp
* USER: carrier external to internal YY.YY.YY.YY port 5060 udp


### mini-howto

Topology
Public-IP (User) ---> Public IP (libresbc) ---> Private IP (libresbc) ----> Private IP (test-pbx/carrier).

Here are some summary steps need to be done on LibreSBC

1. Define cluster node, netalias
2. Define 2 SIP profile 1 for public and 1 for private
3. Define Media Class, Capacity Class
4. For Private IP (libresbc) ----> Private IP (test-pbx/carrier). = libreapi/interconnection/outbound + libreapi/base/gateway
5. Routing Table: /libreapi/routing/table with action=route and routes=<outbound-connection-in-step-4>
6. For Public-IP (User) ---> Public IP (libresbc) = libreapi/interconnection/inbound
