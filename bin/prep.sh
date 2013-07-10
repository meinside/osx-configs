#!/bin/bash

# prep.sh
# 
# for setting up various things automatically in OSX
# (https://raw.github.com/meinside/osxconfigs/master/bin/prep.sh)
# 
# last update: 2013.07.10.
# 
# by meinside@gmail.com

#REPOSITORY="git@github.com:meinside/osxconfigs.git"
REPOSITORY="git://github.com/meinside/osxconfigs.git"
TMP_DIR="$HOME/configs.tmp"

echo -e "\033[32mThis script will setup various things for OSX\033[0m\n"

# clone config files
echo -e "\033[33m>>> cloning config files...\033[0m\n"
rm -rf $TMP_DIR
git clone $REPOSITORY $TMP_DIR
shopt -s dotglob nullglob
mv $TMP_DIR/* $HOME/
rm -rf $TMP_DIR

# install Homebrew, RVM and Ruby for single user
echo
echo -e "\033[33m>>> installing Homebrew, RVM and Ruby...\033[0m\n"
curl -L https://get.rvm.io | bash -s stable --autolibs=homebrew --ruby

# re-login for loading configs
echo
echo -e "\033[31m*** logout, and login again for reloading configs ***\033[0m"
echo
