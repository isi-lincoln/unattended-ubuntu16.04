reating an Unattended Ubuntu Server 16.04 CD

Googling around the internet you will find my ways to do this - including ubuntu's webpage: https://help.ubuntu.com/community/Installation/UnattendedCD

My hope is that this will prevent a lot of the necessary reading and validating.  Please feel free to send me any issues or PR requests.

I've tested only on Ubuntu, it will not work on non-debian operating systems due to the install script using `apt-get` to install `udevil`.  There are simple fixes, if you would like another operating system, you can use `mount -o loop` (https://askubuntu.com/questions/806820/how-do-i-create-a-completely-unattended-install-of-ubuntu-desktop-16-04-1-lts)


## Making it your own!

I tried to make it simple enough.  You should only really need to edit the `configs/` directory.  There are two files there:

```
preseed.cfg
txt.cfg
```

`preseed.cfg` is the standard preseed configuration file.  I highly suggest taking a look at (https://help.ubuntu.com/lts/installation-guide/example-preseed.txt) for an example preseed.

Any modifications you make to customize your image will occur in `preseed.cfg` such as controlling timezone, locale, disk partitioning, etc.  The `preseed.cfg` I provide is a very simple config that creates a single user `ubuntu` with password `ubuntu`.  Enables root login with password `root` (this is obviously vary dangerous for publically facing systems).

The other file `txt.cfg` contains the `isolinux` config file.  This points to your custom preseed file, which when copied to the `isofiles` directory is named custom.seed.  You may edit this as you see fit to insert additional bootloader options. (https://help.ubuntu.com/community/LiveCDCustomizationFromScratch#Boot-loader_Configuration)

## How to run it?

`sudo ./create_custom_iso.sh` will run each of the scripts in the scripts directory.  You will need to run it as sudo in order to write over read-only data, as well as unmounting and removing the isofiles when finished.  Rather than calling the all-in-one script you can call each script individually.  Each script will call `sudo` as necessary.

```
scripts/install_udevil.sh
scripts/get_ubuntu_1604_server.sh
scripts/mount_ubuntu.sh
scripts/set_autostart_install.sh
scripts/copy_configs_to_isofiles.sh
scripts/create_new_iso.sh
scripts/cleanup.sh
```

`scripts/install_udevil.sh` installs udevil - if you are on a non-debian system you can find the correct package (https://manpages.debian.org/jessie/udevil/udevil.1.en.html), or use `mount` as noted above.

`scripts/get_ubuntu_1604_server.sh` downloads 16.04.3 ubuntu server.

`scripts/mount_ubuntu.sh` mounts the iso using `udevil` to /media/_isoname_

`scripts/set_autostart_install.sh` edits `isolinux/isolinux.cfg` adding a `timeout` value which I found was necessary to remove the language selection menu prior to reaching the boot menu.  Other's have mentioned that passing `locale` to the bootloader options fixed this problem, which was not the case for me.

`scripts/copy_configs_to_isofiles.sh` takes the files in `configs/` to their correct location in the `isofiles` directory for when the new iso is generated.

`scripts/create_new_iso.sh` runs genisoimage to create the new iso!

`scripts/cleanup.sh` unmounts and removes the data in `/media` that is added though the `udevil` command.

at the end you should end up with a bootable iso `ubuntu-server-16.04-custom.iso`!

##### Good Luck!

If you are interested in creating a pre-configured image, you may be interested in https://github.com/rcgoodfellow/raven-images repo which creates bootable compressed (qcow2) images.  For instance if you are using cloud-init or preseeding to generate a custom image for fedora, ubuntu, debian, etc.

##### References

https://help.ubuntu.com/lts/installation-guide/s390x/apbs02.html
https://askubuntu.com/questions/806820/how-do-i-create-a-completely-unattended-install-of-ubuntu-desktop-16-04-1-lts
https://help.ubuntu.com/lts/installation-guide/example-preseed.txt
https://help.ubuntu.com/community/InstallCDCustomization
https://help.ubuntu.com/community/LiveCDCustomizationFromScratch#Boot-loader_Configuration

![Alt text](pictures/screenshot1.png?raw=true "Auto installing screenshot #1")
![Alt text](pictures/screenshot2.png?raw=true "Auto installing screenshot #2")
![Alt text](pictures/screenshot3.png?raw=true "Logging in with pre-configured account")
