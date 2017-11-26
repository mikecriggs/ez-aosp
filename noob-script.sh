#!/bin/bash

#
# EZ AOSP (V2.0)
#
# Copyright (C) 2017 Michael S Corigliano (Mike Criggs) (michael.s.corigliano@gmail.com)
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

# Title, authorship, social media
  whiptail --title "EZ AOSP" --msgbox "Written by Michael S Corigliano (Mike Criggs) \n\nEmail: michael.s.corigliano@gmail.com \nGitHub: github.com/mikecriggs\nGoogle+: google.com/+MichaelCorigliano \nTwitter: twitter.com/MikeCriggs" 15 70

# EZ AOSP description
  whiptail --title "EZ AOSP" --msgbox "This tool is meant to help set up an AOSP (Android Open Source Project) build environment as painlessly and user-friendly as possible. By doing this, contributions to AOSP and AOSP forks will be much easier. It is recommended that you use Ubuntu 16.04 LTS or higher. \n\nContributions to this program can be made here: github.com/mikecriggs/ez-aosp" 20 70

# Continue?
  if (whiptail --title "EZ AOSP" --yesno "Would you like to start setting up the build environment?" 10 70)
  then
    ECHOTXT="Continuing with setup..."
    echoFun
    sleep 2
  else
    ECHOTXT="Exiting EZ AOSP..."
    echoFun
    sleep 2
    clear
    exit
  fi

# Starting build environment setup
  ECHOTXT="Setting up build environment..."
  echoFun
  sleep 2

# Update Ubuntu OS
  if (whiptail --yesno --title "EZ AOSP" "Would you like to update Ubuntu? If not, you can update this later with 'extras/update-ubuntu.sh'" 10 70)
  then
    updateUbuntu
    clear
  else
    ECHOTXT="Not updating Ubuntu...'"
    echoFun
    sleep 2
    clear
  fi

# Install packages
  pkgsFun

# Install and configure JDK (OpenJDK 8)
  jdkFun
  clear

# Setup repo tool
  repoToolSetup
  clear

# Configure GIT
  gitSetup

# Your build environment is ready to use!
  whiptail --title "EZ AOSP" --msgbox "Your build environment is ready to use! Refer to your ROM's README to get started syncing and compiling your source." 20 70
