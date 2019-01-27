#!/bin/bash

#
# EZ AOSP: extra scripts
#
# Written by Michael S Corigliano (@MikeCriggs on GitHub.com) (michael.s.corigliano@gmail.com)
#
# You can contribute to or fork this program here: https://github.com/mikecriggs/ez-aosp
#

# Configure GIT (using whiptail)
  whiptail --title "EZ AOSP" --msgbox "We will now configure GIT" 15 70

  USERNAME=$(whiptail --inputbox --title "EZ AOSP" "What is your name?" 10 70 3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    echo -e "Your GIT username will be set as '$USERNAME'"
    git config --global user.name "$USERNAME"
    sleep 3
  fi
  clear

  EMAIL=$(whiptail --inputbox  --title "EZ AOSP" "What is your email?" 10 70 3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    echo -e "Your GIT email will be set as '$EMAIL'"
    git config --global user.email "$EMAIL"
    sleep 3
  fi
  clear

# Configure GIT without whiptail (WIP)
#  printf "We will now configure GIT\n\n"
#  sleep 3
#  clear
#
# Configure GIT username
#  configureGitUsername () {
#  printf "We now need to set a name for you to use GIT with\n\n"
#  read -p "Your name: " USERNAME
#  areYouSureUsername
#  }
#
# Are you sure about that username?
#  areYouSureUsername () {
#  read -p "Your GIT username will be set as $USERNAME. Is this correct? (y/n)" choice
#  case "$CHOICE" in 
#  y|Y ) git config --global user.name "$USERNAME"; printf "GIT username set as $USERNAME\n\n"; sleep 3
#  ;;
#  n|N ) configureGitUsername
#  ;;
#  * ) echo "Invalid option"
#  ;;
#  esac
#  }
#
# Configure GIT email
#  configureGitEmail () {
#  printf "We now need to set an email for you to use GIT with\n\n"
#  read -p "Your email: " EMAIL
#  areYouSureEmail
#  }
#
# Are you sure about that email?
#  areYouSureEmail () {
#  read -p "Your GIT email will be set as $EMAIL. Is this correct? (y/n)" choice
#  case "$CHOICE" in 
#  y|Y ) git config --global user.email "$EMAIL"; printf "GIT email will be set as $EMAIL\n\n"; sleep 3
#  ;;
#  n|N ) configureGitEmail
#  ;;
#  * ) echo "Invalid option"
#  ;;
#  esac
#  }
#
# Run all functions
#  configureGitUsername
#  areYouSureUsername
#  configureGitEmail
#  areYouSureEmail
