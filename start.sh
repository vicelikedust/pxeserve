# start the proxy dhcp server
dnsmasq -C /pxe/cfg/dnsmasq.conf
# and the HTTP file server
ruby -run -e httpd -- -p 5000 /pxe/ 
