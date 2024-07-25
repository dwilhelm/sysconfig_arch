#!/bin/sh

cp -r --preserve=mode,timestamps etc/ssh /etc
systemctl restart sshd
