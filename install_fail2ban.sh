#!/bin/sh

cp -r --preserve=mode,timestamps etc/fail2ban /etc
systemctl restart fail2ban
