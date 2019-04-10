FROM alpine:3.5
MAINTAINER Sergey V <s2504s@gmail.com>

RUN apk --update add openssh nmap nmap-scripts curl tcpdump bind-tools jq nmap-ncat iptables nginx bash \
    && mkdir -p /run/nginx \
    && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config && rm -rf /var/cache/apk/* \
    && sed -i 's/return 404;/return 200 \$remote_addr;/g' /etc/nginx/conf.d/default.conf

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

