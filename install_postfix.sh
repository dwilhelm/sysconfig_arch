#!/bin/sh

cp -r --preserve=mode,timestamps etc/postfix /etc
newaliases
systemctl restart postfix

