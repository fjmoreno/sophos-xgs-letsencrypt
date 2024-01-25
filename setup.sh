#!/usr/bin/env sh
# Setup
HOME=/var/acme
CONF=/conf/acme
mkdir -p $HOME/http
mkdir -p $CONF
cd $HOME
curl https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh -o acme.sh
chmod +x acme.sh
curl https://raw.githubusercontent.com/helsinki-systems/sophos-xgs-letsencrypt/main/renew.sh -o renew.sh
chmod +x renew.sh
curl https://raw.githubusercontent.com/helsinki-systems/sophos-xgs-letsencrypt/main/config.csv -o $CONF/config.csv
echo "Please insert letsencrypt account email"
read email
chmod +x $HOME/acme.sh
$HOME/acme.sh --conf-home $CONF --register-account -m $email --server letsencrypt


## install on boot
mount -o remount,rw /
curl https://raw.githubusercontent.com/helsinki-systems/sophos-xgs-letsencrypt/main/S01acme.csv -o /etc/rc.d/S01acme
chmod +x /etc/rc.d/S01acme
mount -o remount,ro /
