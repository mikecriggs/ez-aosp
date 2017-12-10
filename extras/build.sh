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
# USAGE: PLACE THIS SCRIPT INTO THE ROOT OF YOUR SOURCE CODE
#
# IE: ./build.sh <DEVICE CODENAME>
#

# DEFINE SOME STUFF
DEVICE="$1"
TIMESTAMP=$(date +"%Y-%m-%d-%S")

# MAKE A BUILD LOG DIRECTORY FOR YOUR DEVICE
  mkdir -p logs/$DEVICE

# BUILD
  . build/envsetup.sh
  lunch aosp_$DEVICE-userdebug
  make otapackage 2>&1 | tee aosp_$DEVICE-$TIMESTAMP.log

