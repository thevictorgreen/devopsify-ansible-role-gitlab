#!/bin/bash

# LOG OUTPUT TO A FILE
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>/root/.gitlab_automate/log.out 2>&1

if [[ ! -f "/root/.gitlab_automate/init.cfg" ]]
then
  # Run gitlab install script
  bash /root/.gitlab_automate/script.deb.sh
  touch /root/.gitlab_automate/init.cfg
fi
