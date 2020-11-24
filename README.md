# pot-firstboot

Simple rc.d script to configure pot container on first boot

To configure container:

    * Setup using `pot create`
    * Populate `root/etc/rc.conf` (see below) 
    * Add any additional required files under `root` hierarchy 
      (eg. any commands referenced in `firstboot_pot_cmd`)
    * From `root` dir copy-in files `cd root && pot copy-in -p <pot> -s . -d /`
    * Boot container (for IPv6 alias containers may need delay to configure
      interfaces - `pot set-cmd -p <pot> -c 'sleep 1 && /bin/sh /etc/rc'`)

# rc.conf variables

```
firstboot_pot_enable="YES"
firstboot_pot_ns="ns1 ns2..."
firstboot_pot_update="YES"
firstboot_pot_root_pk="ssh-ed25519..."
firstboot_pot_user="user"
firstboot_pot_user_pk="ssh-ed25519..."
firstboot_pot_pkgs="pkg pkg..."
firstboot_pot_cmd="cmd"
```

