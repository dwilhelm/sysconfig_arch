#!/bin/sh

cp -r --preserve=mode,timestamps etc/postfix /etc
systemctl restart postfix

