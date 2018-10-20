FROM alpine:3.8
MAINTAINER Vitalii Makarchenkov <vitalii.mak@gmail.com>

RUN apk update && apk upgrade && apk add openvpn && \
    rm -rf /var/cashe/apk/* && \
    mkdir -p /etc/openvpn/keys /etc/openvpn/config /var/log/openvpn

COPY ./bin /usr/local/bin

RUN chmod a+x /usr/local/bin/run.sh

VOLUME ["/var/log/openvpn"]

EXPOSE 1194/udp

WORKDIR /etc/openvpn

CMD ["run.sh"]
