I made this for UnRAID, to use with  binhex/arch-rtorrentvpn, to check if OpenVPN is up. I am running it via user-script plugin, but should work fine from crontab.

If OpenVPN is not running, or if any variables show a empty ip-address, it will send a alert + Stop the container.

Comment "set -x" if you dont want verbose mode

Insert your to and from email adresses

Change CONTAINERNAME to the name of your rtorrent/deluge container

In vpncheck, add a dns or ddns that is pointing to your WAN address
