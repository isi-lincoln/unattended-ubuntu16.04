#!/bin/bash

if [ "$GIT_HOME" = "" ]; then
  GIT_HOME=..
fi

genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o $GIT_HOME/ubuntu-server-16.04-custom.iso $GIT_HOME/isofiles
