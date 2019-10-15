#!/bin/bash
echo "ccuser    ALL=(ALL)  PASSWD: /bin/systemctl ">> /etc/sudoers
sleep 7h
sed -i '/^ccuser/d' /etc/sudoers
