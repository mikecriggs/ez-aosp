#!/bin/bash

#
# EZ AOSP
#
# Written by Michael S Corigliano (@MikeCriggs on GitHub.com) (michael.s.corigliano@gmail.com)
#
# You can contribute to or fork this program here: https://github.com/mikecriggs/ez-aosp
#
#
# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#

# Update Ubuntu
  clear
  echo -e "Updating Ubuntu..."
  sleep 3
  clear

  sudo apt update -y
  sudo apt upgrade -y

  clear  
  echo -e "Ubuntu updated."
  sleep 3

# Install packages required for building AOSP
  clear
  echo -e "Installing packages..."
  sleep 3
  clear

  sudo apt install git-core python gnupg flex bison gperf libsdl1.2-dev libesd0-dev \
  squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-8-jre openjdk-8-jdk pngcrush \
  schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev \
  gcc-multilib liblz4-* pngquant ncurses-dev texinfo gcc gperf patch libtool \
  automake g++ gawk subversion expat libexpat1-dev python-all-dev bc libcloog-isl-dev \
  libcap-dev autoconf libgmp-dev build-essential gcc-multilib g++-multilib pkg-config libmpc-dev libmpfr-dev lzma* \
  liblzma* w3m android-tools-adb maven ncftp htop chrpath whiptail diffstat cpio libssl-dev -y
  clear

  echo -e "Packages installed."
  sleep 3
  clear

# Install and configure JDK
  # Install JDK
    echo -e "Installing JDK 8..."
    sleep 3

    clear
    sudo apt install openjdk-8-jdk -y
    clear
    sudo apt -f install -y
    clear
    sudo apt update -y

    clear
    echo -e "JDK installed."
    sleep 2

  # Configure JDK
    clear
    echo -e "Updating java alternative. If asked, please select the option best matching 'openjdk-8'. Do not use Oracle's JDK or any other version of OpenJDK except for 8."
    sleep 5
    clear

    sudo update-alternatives --config java
    sudo update-alternatives --config javac

    clear 
    echo -e "JDK configured."
    sleep 3

# Setup repo
  clear
  echo -e "Setting up repo tool..."
  sleep 3
  clear

  mkdir -p ~/bin
  PATH=~/bin:$PATH
  curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
  sudo chmod a+x ~/bin/repo
  clear

  echo -e "Repo tool setup."
  sleep 3
  clear

# Setup GIT
#  clear
#  whiptail --title "EZ AOSP" --msgbox "We will now configure GIT" 15 70
#
#  USERNAME=$(whiptail --inputbox --title "EZ AOSP" "What is your name?" 10 70 3>&1 1>&2 2>&3)
#  exitstatus=$?
#  if [ $exitstatus = 0 ]; then
#    echo -e "Your GIT username will be set as '$USERNAME'"
#    git config --global user.name "$USERNAME"
#    sleep 3
#  fi
#  clear
#
#  EMAIL=$(whiptail --inputbox  --title "EZ AOSP" "What is your email?" 10 70 3>&1 1>&2 2>&3)
#  exitstatus=$?
#  if [ $exitstatus = 0 ]; then
#    echo -e "Your GIT email will be set as '$EMAIL'"
#    git config --global user.email "$EMAIL"
#    sleep 3
#  fi

# Configure GIT username
  configureGitUsername () {
  printf "We will now configure GIT\n\n"
  sleep 3
  printf "We now need to set a name for you to use GIT with\n\n"
  read -p "Your name: " USERNAME
  areYouSureUsername
  }

# Are you sure about that username?
  areYouSureUsername () {
  read -p "Your GIT username will be set as $USERNAME. Is this correct? (y/n)" choice
  case "$CHOICE" in 
  y|Y ) git config --global user.name "$USERNAME"; printf "GIT username set as $USERNAME\n\n"; sleep 3
  ;;
  n|N ) configureGit2
  ;;
  * ) echo "Invalid option"
  ;;
  esac
  }

# Configure GIT email
  configureGitEmail () {
  printf "We will now configure GIT\n\n"
  sleep 3
  printf "We now need to set an email for you to use GIT with\n\n"
  read -p "Your email: " EMAIL
  areYouSureEmail
  }

# Are you sure about that email?
  areYouSureEmail () {
  read -p "Your GIT email will be set as $EMAIL. Is this correct? (y/n)" choice
  case "$CHOICE" in 
  y|Y ) git config --global user.email "$EMAIL"; printf "GIT email will be set as $EMAIL\n\n"; sleep 3
  ;;
  n|N ) configureGit2
  ;;
  * ) echo "Invalid option"
  ;;
  esac
  }

# Run all GIT setup functions
  configureGitUsername
  areYouSureUsername
  configureGitEmail
  areYouSureEmail

# All done
  clear
  echo -e "Your build environment is ready to use! Refer to your ROM's README to get started syncing and compiling your source."
  echo -e ""
  echo -e ""
