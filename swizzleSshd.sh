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


#
# Cycle sshd
#
service sshd reload
