#!/bin/bash

if [ "$GIT_HOME" = "" ]; then
  GIT_HOME=..
fi

sudo cp $GIT_HOME/configs/txt.cfg $GIT_HOME/isofiles/isolinux/txt.cfg
sudo cp $GIT_HOME/configs/preseed.cfg $GIT_HOME/isofiles/preseed/custom.seed
