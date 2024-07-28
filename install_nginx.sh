#!/bin/sh

cp -r --preserve=mode,timestamps etc/nginx /etc
systemctl restart nginx
