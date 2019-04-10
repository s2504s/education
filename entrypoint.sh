#!/bin/sh

: ${SSH_USERPASS:=$(dd if=/dev/urandom bs=1 count=15 | base64)}

__create_rundir() {
	mkdir -p /var/run/sshd
}

__create_user() {
# Create a user to SSH into as.
echo  "root:$SSH_USERPASS" | chpasswd
echo ssh user password: $SSH_USERPASS
}

__create_hostkeys() {
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
}

__add_route() {
IP_NET=`hostname -i | awk -F "." '{ print $1 "." $2 "." $3 }'`

#if [ ! $HOSTNAME == "host2" ]; then
#    ip ro delete default
#    ip ro add default via ${IP_NET}.128
#fi
}

__configure_netfilter(){
    bash /mnt/configs/${HOSTNAME}.sh
}

# Call all functions
__create_rundir
__create_hostkeys
__create_user
__add_route
__configure_netfilter

exec nginx -g 'daemon off;'
