#!/bin/bash

#
# EZ AOSP: extra scripts
#
# Written by Michael S Corigliano (@MikeCriggs on GitHub.com) (michael.s.corigliano@gmail.com)
#
# You can contribute to or fork this program here: https://github.com/mikecriggs/ez-aosp
#

# Install needed packages for building the Android Open Source Project (AOSP)
  echo -e "Installing needed packages for building AOSP..."
  echo -e ""
  echo -e ""
  sleep 3
  clear
  
  sudo apt install git-core python gnupg flex bison gperf libsdl1.2-dev libesd0-dev \
  squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-8-jre openjdk-8-jdk pngcrush \
  schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev \
  gcc-multilib liblz4-* pngquant ncurses-dev texinfo gcc gperf patch libtool \
  automake g++ gawk subversion expat libexpat1-dev python-all-dev bc libcloog-isl-dev \
  libcap-dev autoconf libgmp-dev build-essential gcc-multilib g++-multilib pkg-config libmpc-dev libmpfr-dev lzma* \
  liblzma* w3m android-tools-adb maven ncftp htop chrpath whiptail diffstat cpio libssl-dev -y
  
  echo -e "Installing finished."
  echo -e ""
  echo -e ""
