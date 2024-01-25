#!/usr/bin/env sh
# Setup
HOME=/conf/acme
mkdir -p $HOME/http
cd $HOME
curl https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh -o acme.sh
chmod +x acme.sh
curl https://raw.githubusercontent.com/helsinki-systems/sophos-xgs-letsencrypt/main/renew.sh -o renew.sh
chmod +x renew.sh
curl https://raw.githubusercontent.com/helsinki-systems/sophos-xgs-letsencrypt/main/config.csv -o config.csv
echo "Please insert letsencrypt account email"
read email
chmod +x $HOME/acme.sh
$HOME/acme.sh --home /conf/acme --register-account -m $email --server letsencrypt
