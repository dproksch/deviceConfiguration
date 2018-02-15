#!/bin/bash

#
# make a copy of the file
#
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig

#
# Strip out parameters, so they can be change
#
cat /etc/ssh/sshd_config | egrep -v "PubkeyAuthentication|PasswordAuthentication|ChallengeResponseAuthentication" > /etc/ssh/sshd_config.new

mv /etc/ssh/sshd_config.new /etc/ssh/sshd_config

#
# Add in the needed keys
#
echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config
echo "Ciphers aes128-ctr,aes192-ctr,aes256-ctr"  >> /etc/ssh/sshd_config
echo "MACs hmac-sha1,umac-64@openssh.com,hmac-ripemd160"  >> /etc/ssh/sshd_config
echo " " >> /etc/ssh/sshd_config
echo "Port 4422 " >> /etc/ssh/sshd_config


#
# Cycle sshd
#
service sshd reload
