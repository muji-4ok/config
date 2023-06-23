#!/bin/bash

echo "Create user"
adduser egork
usermod -aG sudo egork

# echo "Clone config repo"
# git clone https://github.com/muji-4ok/config.git
# cd config
# ./setup.sh

echo "Setup ssh"
echo "ClientAliveInterval 6000" >> /etc/ssh/sshd_config
echo "ClientAliveCountMax 3" >> /etc/ssh/sshd_config
systemctl restart sshd

echo "Setup ufw"
ufw default allow outgoing
ufw default deny incoming
ufw allow ssh
ufw allow 1194/udp comment 'OpenVPN server'
ufw allow 3128 comment 'SQUID proxy server'
ufw enable

echo "Setup squid"
apt-get install -y squid apache2-utils
htpasswd -c /etc/squid/passwords client
echo "auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwords" >> /etc/squid/conf.d/auth.conf
echo "auth_param basic realm proxy" >> /etc/squid/conf.d/auth.conf
echo "acl authenticated proxy_auth REQUIRED" >> /etc/squid/conf.d/auth.conf
echo "http_access allow authenticated" >> /etc/squid/conf.d/auth.conf
systemctl restart squid

