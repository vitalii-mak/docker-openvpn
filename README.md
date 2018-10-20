# docker-openvpn

[Create a Public Key Infrastructure Using the easy-rsa Scripts](https://wiki.gentoo.org/wiki/Create_a_Public_Key_Infrastructure_Using_the_easy-rsa_Scripts)

openvpn.conf

Copy all keys into folder keys/

| config openvpn| easy-rsa  |
|-----------|-----------|
| ca        | ca.crt    |
| cert      | easy-rsa/pki/issued/servername.crt |
| key       | easy-rsa/pki/private/servername.key |
| dh        | dh.pem    |
| tls-auth  | ta.key    |

Change port 1194 in openvpn.conf, Dockerfile and docker-compose.yml
