#!/bin/sh

cp -pr etc/dovecot /etc
systemctl restart dovecot
