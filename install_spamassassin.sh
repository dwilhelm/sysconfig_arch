#!/bin/sh

cp -r --preserve=mode,timestamps etc/mail/spamassassin /etc/mail
systemctl restart spamassassin

