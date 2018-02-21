#!/bin/bash

if [ "$GIT_HOME" = "" ]; then
  GIT_HOME=..
fi

sudo udevil unmount /media/ubuntu-16.04.3-server-amd64.iso
sudo rm -rf $GIT_HOME/isofiles
sudo rm $GIT_HOME/ubuntu-16.04.3-server-amd64.iso

unset GIT_HOME
