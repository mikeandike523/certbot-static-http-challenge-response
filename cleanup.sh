#!/bin/bash

# Remove the .well-known directory recursively
sudo rm -rf /var/www/html/.well-known

# Check if the acme-challenge.conf file exists
if [ -f "/etc/nginx/sites-enabled/acme-challenge.conf" ]; then
    # Remove the acme-challenge configuration file
    sudo rm -f /etc/nginx/sites-enabled/acme-challenge.conf

    # Reload Nginx to apply the changes
    sudo nginx -s reload
fi