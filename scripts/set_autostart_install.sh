#!/bin/bash

if [ "$GIT_HOME" = "" ]; then
  GIT_HOME=..
fi

# setting the timeout value initiates auto select after that time
# here it is 5 seconds, and it is auto selecting the english language
# prompt that will show up before we can select what we want
sudo sed -ie 's/timeout 0/timeout 50/g' $GIT_HOME/isofiles/isolinux/isolinux.cfg
