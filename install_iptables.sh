#!/bin/sh

iptables-restore < iptables/iptables.rules
ip6tables-restore < iptables/ip6tables.rules
iptables-save > /etc/iptables/iptables.rules
ip6tables-save > /etc/iptables/ip6tables.rules
