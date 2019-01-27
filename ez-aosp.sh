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

# Import functions
  . $PWD/res/functions.cfg

# Install whiptail
  TXT="We need to install the package 'whiptail' in order to use the program. To cancel installation, press CTRL+C within the next 10 seconds."
  echoFun
  sleep 10

  clear
  TXT="Installing whiptail..."
  echoFun

  clear
  PKGS="whiptail"
  installFun
  clear

# Title, authorship, social media
  whiptail --title "EZ AOSP" --msgbox "Written by Michael S Corigliano (Mike Criggs) \n\nEmail: michael.s.corigliano@gmail.com \nGitHub: github.com/mikecriggs\nGoogle+: google.com/+MichaelCorigliano \nTwitter: twitter.com/MikeCriggs" 15 70

# EZ AOSP description
  whiptail --title "EZ AOSP" --msgbox "This tool is meant to help set up an AOSP (Android Open Source Project) build environment as painlessly and user-friendly as possible. By doing this, contributions to AOSP and custom aftermarket AOSP firmware, also known as 'custom ROMs' will be much easier to make. Please be aware that this program currently only supports Ubuntu 16.04 LTS. Other Ubuntu versions and Linux distributions will be added in the future. \n\nContributions to this program can be made here: github.com/mikecriggs/ez-aosp" 20 70

# Continue?
  if (whiptail --title "EZ AOSP" --yesno "Would you like to start setting up the build environment?" 10 70)
  then
    TXT="Continuing with setup..."
    echoFun
    sleep 3
  else
    TXT="Exiting EZ AOSP..."
    echoFun
    sleep 5
    clear
    exit
  fi

# Starting build environment setup
  TXT="Setting up build environment..."
  echoFun
  sleep 3

# Update Ubuntu OS
  if (whiptail --yesno --title "EZ AOSP" "Would you like to update Ubuntu? If not, you can update this later with 'res/extras/update-ubuntu.sh'" 10 70)
  then
    updateUbuntu
    clear
  else
    TXT="Not updating Ubuntu...'"
    echoFun
    sleep 3
    clear
  fi

# Install packages
  pkgsFun
  clear

# Install and configure JDK (OpenJDK 8)
  jdkFun
  clear

# Setup repo tool
  repoToolSetup
  clear

# Configure GIT
  gitSetupWhiptail
  clear

# Your build environment is ready to use!
  whiptail --title "EZ AOSP" --msgbox "Your build environment is ready to use! Refer to your ROM's README to get started syncing and compiling your source." 20 70
