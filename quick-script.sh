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
  sleep 3
  clear
  
  sudo apt update -y
  sudo apt upgrade -y
  clear
  
  echo -e ${BLDRED}"Ubuntu updated."${RST}
  sleep 3
  clear

# Install packages
  echo -e ${BLDRED}"Installing packages..."${RST}
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
  
  echo -e ${BLDRED}"Packages installed."${RST}
  sleep 3
  clear

# Install and configure JDK
  # Install JDK
    echo -e ${BLDRED}"Installing JDK 8..."${RST}
    sleep 3
    clear
    
    sudo apt install openjdk-8-jdk -y
    clear
    sudo apt -f install -y
    clear
    sudo apt update -y
    clear

    echo -e ${BLDRED}"JDK installed."${RST}
    sleep 2
    clear

  # Configure JDK
    echo -e ${BLDRED}"Updating java alternative. If asked, please select the option best matching 'openjdk-8'. Do not use Oracle's JDK or any other version of OpenJDK except for 8."${RST}
    sleep 5
    clear
    
    sudo update-alternatives --config java
    sudo update-alternatives --config javac
    clear
    
    echo -e ${BLDRED}"JDK configured."${RST}
    sleep 3
    clear

# Setup repo
  echo -e ${BLDRED}"Setting up repo tool..."${RST}
  sleep 3
  clear
  
  mkdir -p ~/bin
  PATH=~/bin:$PATH
  curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
  sudo chmod a+x ~/bin/repo
  clear
  
  echo -e ${BLDRED}"Repo tool setup."${RST}
  sleep 3
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
    git config --global user.email "$EMAIL"
    sleep 2
  fi
  clear

# All done
  echo -e ${BLDRED}"Your build environment is ready to use! Refer to your ROM's README to get started syncing and compiling your source."${RST}
  echo -e ""
  echo -e ""
