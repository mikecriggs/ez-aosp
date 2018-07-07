#!/bin/bash

#
# EZ AOSP: extra scripts
#
# Written by Michael S Corigliano (Mike Criggs) (michael.s.corigliano@gmail.com)
#
# You can contribute to or fork this program here: https://github.com/mikecriggs/ez-aosp
#

# Configure GIT
  whiptail --title "EZ AOSP" --msgbox "We will now configure GIT" 15 70

  USERNAME=$(whiptail --inputbox --title "EZ AOSP" "What is your name?" 10 70 3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    echo -e ${BLDRED}"Your GIT username will be set as '$USERNAME'"${RST}
    git config --global user.name "$USERNAME"
    sleep 2
  fi
  clear

  EMAIL=$(whiptail --inputbox  --title "EZ AOSP" "What is your email?" 10 70 3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    echo -e ${BLDRED}"Your GIT email will be set as '$EMAIL'"${RST}
    git config --global user.name "$EMAIL"
    sleep 2
  fi
  clear
