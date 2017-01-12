#!/bin/bash

#Uncomment if you want verbose
set -x

TO="YOUREMAILADRESS"
FROM="alerts@YOURHOSTNAME.com"

#Checks docker container public ip
dockerip=`docker exec -i CONTAINERNAME wget http://ipecho.net/plain -O - -q ; echo`

#Check public ip of firewall
vpncheck=`getent hosts DNS-OR-DDNS-TO-CHECK | awk '{ print $1 }' ; echo`


#Check if CONTAINERNAME has the same public as firewall
if [ "$dockerip" == "$vpncheck" ]; then
echo ovpn not up

#Stops the docker container
docker stop CONTAINERNAME

#If so send an alert
echo "Subject: Rtorrent Docker VPN is DOWN
rtorrent vpn down - Container stopped!" | ssmtp -v ${TO}

elif [ -z "$vpncheck" ]; then
echo "VPNCHECK is unset or set to a empty string"
echo "Subject: VPNCHECK showed empty value
VPNCHECK showed empty value! - FIX network" | ssmtp -v ${TO}

elif [ -z "$dockerip" ]; then
echo "DOCKERIP is unset or set to a empty string"
echo "Subject: DOCKERIP showed empty value
DOCKERIP showed empty value! - FIX network" | ssmtp -v ${TO}

else
echo ovpn is up

fi