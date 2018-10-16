FROM alpine:3.8
MAINTAINER Vitalii Makarchenkov <vitalii.mak@gmail.com>

RUN apk update && apk upgrade && apk add openvpn && \
    rm -rf /var/cashe/apk/* && \
    adduser -S -u 3333 -G openvpn vpnuser


COPY ./bin /usr/local/bin

RUN chmod a+x /usr/local/bin/run.sh

VOLUME ["/etc/openvpn"]

EXPOSE 1194/udp

CMD ["run.sh"]

USER vpnuser

WORKDIR /home/vpnuser