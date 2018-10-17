# docker-openvpn

Generate Diffie hellman key
openssl dhparam -out dh2048.pem 2048

Create Certificate Authority
Generate private key for Certificate Authority (-des3 - add password)
openssl genrsa -out ca.key 2048
chmod 600 ca.key

Generate certificate for Certificate Authority
openssl req -new -x509 -days 3650 -key ca.key -out ca.crt


Generate private key for openvpn server
openssl genrsa -out server.key 2048
chmod 600 server.key

Generate public certificate for openvpn server
openssl req -new -key server.key -out server.csr

Generate certificate for openvpn server
openssl x509 -req -in server.csr -out server.crt -signkey server.key -days 3650

Create an "HMAC firewall" to help block DoS attacks and UDP port flooding. 
config - tls-auth ta.key 0
openvpn --genkey --secret ta.key

Generate private key for client
openssl genrsa -out client.key 2048

Generate public certificate for client
openssl req -new -key client.key -out client.csr


openssl rsa -in client.key. -out client.pem

openssl x509 -req -days 365 -in client.csr -CA yourawesomeCA.pem -CAkey yourawesomeCA.key -out client.crt