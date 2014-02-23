#!/bin/bash

# Move into correct directory
# Note: This assumes the directory was created in the provisiong process
cd /etc/nginx/ssl

# Start by creating the private server key.
# Note: During this process, you will be asked
# to enter a specific passphrase. Be sure to
# note this phrase carefully, if you forget
# it or lose it, you will not be able to
# access the certificate.
sudo openssl genrsa -des3 -out nginx.key 1024

# Follow up by creating a certificate signing request:
# Note: The most important line is "Common Name".
# Use the localhost IP: 127.0.0.1
# You can just return through everything else
# before and after if you like.
sudo openssl req -new -key nginx.key -out nginx.csr

# Now remove the passcode
sudo cp nginx.key nginx.key.org
sudo openssl rsa -in nginx.key.org -out nginx.key

# Sign the SSL Certificate
sudo openssl x509 -req -days 365 -in nginx.csr -signkey nginx.key -out nginx.crt

# Restart nginx
sudo service nginx restart
