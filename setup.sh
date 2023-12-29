#! /bin/sh
# Setup
mkdir -p /var/acme/http
HOME=/var/acme
cd /var/acme
curl https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh -o acme.sh
chmod +x acme.sh
echo "Please insert letsencrypt account email\n"
read email
/var/acme/acme.sh --register-account -m $email --server letsencrypt
