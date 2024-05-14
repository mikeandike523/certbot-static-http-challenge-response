#!/bin/bash

# Get the directory of the script
dn="$(dirname "$(realpath "$0")")"

# Create the directory structure for ACME challenges
sudo mkdir -p /var/www/html/.well-known/acme-challenge

# Place the challenge token in the correct location
echo -n "$CERTBOT_VALIDATION" | sudo tee /var/www/html/.well-known/acme-challenge/$CERTBOT_TOKEN > /dev/null

# If /etc/nginx/sites-enabled exists, copy acme-challenge.conf and reload Nginx
if [ -d "/etc/nginx/sites-enabled" ]; then
    sudo cp "$dn/acme-challenge.conf" /etc/nginx/sites-enabled/
    sudo nginx -s reload
fi