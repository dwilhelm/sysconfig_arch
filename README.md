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

### iptables
```bash
pacman -Sy iptables
./install_iptables.sh
systemctl enable iptables
```
