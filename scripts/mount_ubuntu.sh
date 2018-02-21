#!/bin/bash

if [ "$GIT_HOME" = "" ]; then
  GIT_HOME=..
fi

udevil mount ubuntu-16.04.3-server-amd64.iso

mkdir $GIT_HOME/isofiles/
cp -rT /media/ubuntu-16.04.3-server-amd64.iso $GIT_HOME/isofiles/
