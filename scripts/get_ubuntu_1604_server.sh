#!/bin/bash
if [ "$GIT_HOME" = "" ]; then
  GIT_HOME=../
fi

wget -nc -P $GIT_HOME http://releases.ubuntu.com/16.04/ubuntu-16.04.3-server-amd64.iso
