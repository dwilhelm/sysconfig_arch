# Arch Linode Setup
This is a log of steps run on a new Arch instance with Linode using
https://wiki.archlinux.org/title/Installation_guide

>[!NOTE]
>These steps sometimes use placeholder values like `FIXME` and `dave@example.com` on the main branch.
>Replace them with specific values saved in a commit on a different branch.

### Initial System Setup

```bash
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
```
Uncomment `en_US.UTF-8 UTF-8` from `/etc/locale.gen`
```bash
locale-gen
echo 'FIXME' > /etc/hostname
```
Since this is for a server, leave `/etc/localtime -> /usr/share/zoneinfo/UTC`.

Run as root to install basic packages and set up a non-root user:
```bash
pacman -Sy man-db man-pages sudo less vim rsync git
useradd -m dave
passwd dave
vim /etc/group  # Add dave to wheel.
visudo  # Grant run rights to wheel.
```
Run admin steps as the non-root user with sudo. Run all remaining steps from
the repo root to install config files.

The file `diff.sh` will compare installed files to repo files as a unified
diff with no context.

### iptables
```bash
pacman -Sy iptables
./install_iptables.sh
systemctl enable iptables
```
### OpenSSH
```bash
pacman -Sy openssh
./install_ssh.sh
systemctl enable sshd
```
### fail2ban
```bash
pacman -Sy fail2ban
./install_fail2ban.sh
systemctl enable fail2ban
reboot  # Load required kernel modules.
```
- https://github.com/fail2ban/fail2ban/wiki
- https://www.digitalocean.com/community/tutorials/how-fail2ban-works-to-protect-services-on-a-linux-server
### nginx
```bash
pacman -Sy nginx
./install_nginx.sh
systemctl enable nginx
```
### postfix
```bash
pacman -Sy postfix
./install_postfix.sh
postalias /etc/postfix/aliases
systemctl restart postfix
systemctl enable postfix
```
- https://wiki.archlinux.org/title/Postfix

Besides the postfix config, add DNS records in linode under Domain / example.org
```
@      MX  10  example.org.
@      TXT  "v=spf1 mx -all"
```
and set reverse DNS in linode in Linodes / Network / IP Addresses / Edit RDNS.
- https://www.linode.com/docs/guides/dns-overview/
- http://www.open-spf.org/SPF_Record_Syntax/
