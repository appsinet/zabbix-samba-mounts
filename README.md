# Zabbix monitoring of Samba mounts defined in /etc/fstab

This project is composed by two shell scripts, a Zabbix template and a zabbix-agent configuration file:
- The script discover_smb.sh checks for mount points defined in /etc/fstab with `cifs` type
- The script smb_check.sh reads the exit of `mount` command, and checks if every mount point in fstab is mounted
- The template has discovery items that read those values and activates triggers.
This repository was created using Zabbix 4.4.5 and several GNU/Linux CentOS 7 OS servers. It may work on previous zabbix versions, but I couldn't test it.

### Features

- Discover shared samba resources, mounted in the file system
- Receive an alert if any resource is not listed as mounted

### Features planned
- Define mount types other than cifs

### Installation

1. Download the necessary files or clone this project anywhere zabbix user can access.

2. Put `zabbix-agentd.d/sambaMounts.conf` in zabbix agent directory, normally `/etc/zabbix/zabbix-agentd.d/`. Edit this file if you don't use the default `/var/lib/zabbix` folder for shell scripts.

3. Put `smb_check.sh` and `discover_smb.sh` in `/var/lib/zabbix` folder (or the one you defined in the previous file).

4. Now restart the Zabbix agent service.

5. Import `template/samba_mount_template.xml` in Zabbix and assign it to your desired hosts.

### Feedback

Feel free to send bug reports and feature requests. If you are using this solution in production, please tell me to know it's being useful.
