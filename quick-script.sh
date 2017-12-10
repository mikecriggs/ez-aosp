#!/bin/bash

#
# EZ AOSP
#
# Written by Michael S Corigliano (Mike Criggs) (michael.s.corigliano@gmail.com)
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

# Terminal colors
  BLDRED="\033[1m""\033[31m"
  RST="\033[0m"

# Update Ubuntu
  echo -e ${BLDRED}"Updating Ubuntu..."${RST}
  echo -e ""
  echo -e ""
  sleep 2
  sudo apt update -y
  sudo apt upgrade -y
  echo -e ""
  echo -e ""
  echo -e ${BLDRED}"Ubuntu updated."${RST}
  sleep 2
  clear

# Install packages
  echo -e ${BLDRED}"Installing packages..."${RST}
  echo -e ""
  echo -e ""
  sleep 2
  sudo apt install git-core python gnupg flex bison gperf libsdl1.2-dev libesd0-dev \
  squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-8-jre openjdk-8-jdk pngcrush \
  schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev \
  gcc-multilib liblz4-* pngquant ncurses-dev texinfo gcc gperf patch libtool \
  automake g++ gawk subversion expat libexpat1-dev python-all-dev bc libcloog-isl-dev \
  libcap-dev autoconf libgmp-dev build-essential gcc-multilib g++-multilib pkg-config libmpc-dev libmpfr-dev lzma* \
  liblzma* w3m android-tools-adb maven ncftp htop -y
  echo -e ""
  echo -e ""
  echo -e ${BLDRED}"Packages installed."${RST}
  sleep 2
  clear

# Install JDK
  echo -e ${BLDRED}"Installing JDK 8..."${RST}
  echo -e ""
  echo -e ""
  sleep 2
  sudo apt install openjdk-8-jdk -y
  sudo apt -f install -y
  sudo apt update -y
  echo -e ""
  echo -e ""
  echo -e ${BLDRED}"JDK installed."${RST}
  sleep 2
  clear

# Configure JDK
  echo -e ${BLDRED}"Configuring JDK 8..."${RST}
  echo -e ""
  echo -e ""
  sleep 2
  sudo update-alternatives --config java
  sudo update-alternatives --config javac
  echo -e ""
  echo -e ""
  echo -e ${BLDRED}"JDK installed."${RST}
  sleep 2
  clear

# Setup repo
  echo -e ${BLDRED}"Setting up repo tool..."${RST}
  echo -e ""
  echo -e ""
  sleep 2
  mkdir -p ~/bin
  PATH=~/bin:$PATH
  curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
  sudo chmod a+x ~/bin/repo
  echo -e ""
  echo -e ""
  echo -e ${BLDRED}"Repo tool setup."${RST}
  sleep 2
  clear

# Setup GIT
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

# All done
  echo -e ${BLDRED}"Your build environment is ready to use! Refer to your ROM's README to get started syncing and compiling your source."${RST}
  echo -e ""
  echo -e ""
