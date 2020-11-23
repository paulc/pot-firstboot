# pot-firstboot

Simple rc.d script to configure pot container on first boot

To configure container:

    * Setup using `pot create`
    * From `root` dir copy-in files `cd root && pot copy-in -p <pot> -s . -d /`
    * Create rc.conf script (see below)
    * Copy-in rc.conf `pot copy-in -p <pot> -s rc.conf -d /etc`
    * Boot container (for IPv6 alias containers may need delay to configure
      interfaces - `pot set-cmd -p <pot> -c 'sleep 1 && /bin/sh /etc/rc'`

# rc.conf variables

```
firstboot_pot_enable="YES"
firstboot_pot_pkgs="pkg pkg..."
firstboot_pot_user="name"
firstboot_pot_pk="key.."
firstboot_pot_ns="ns ns"
```

