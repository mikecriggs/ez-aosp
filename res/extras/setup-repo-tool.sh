#!/bin/bash

#
# EZ AOSP: extra scripts
#
# Written by Michael S Corigliano (@MikeCriggs on GitHub.com) (michael.s.corigliano@gmail.com)
#
# You can contribute to or fork this program here: https://github.com/mikecriggs/ez-aosp
#

# Setup repo tool
  echo -e "Downloading and setting up the Google repo tool..."
  echo -e ""
  echo -e ""
  sleep 3
  mkdir -p ~/bin
  PATH=~/bin:$PATH
  curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
  sudo chmod a+x ~/bin/repo
  clear
  echo -e "Finished setting up the Google repo tool."
  echo -e ""
  echo -e ""
