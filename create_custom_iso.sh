#!/bin/bash

GIT_HOME=$(pwd)
export GIT_HOME

SCRIPTS=$GIT_HOME/scripts

${SCRIPTS}/install_udevil.sh
${SCRIPTS}/get_ubuntu_1604_server.sh
${SCRIPTS}/mount_ubuntu.sh
${SCRIPTS}/set_autostart_install.sh
${SCRIPTS}/copy_configs_to_isofiles.sh
${SCRIPTS}/create_new_iso.sh
${SCRIPTS}/cleanup.sh
