FROM alpine:3.5
MAINTAINER Sergey V <s2504s@gmail.com>

COPY entrypoint.sh /

RUN apk --update add openssh nmap nmap-scripts curl tcpdump bind-tools jq nmap-ncat iptables nginx \
    && mkdir -p /run/nginx && chmod +x /entrypoint.sh \
    && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config && rm -rf /var/cache/apk/*

ENTRYPOINT ["/entrypoint.sh"]
