#!/bin/bash

# prep.sh
# 
# for setting up various things automatically in OSX
# (https://raw.github.com/meinside/osxconfigs/master/bin/prep.sh)
# 
# last update: 2013.04.03.
# 
# by meinside@gmail.com

#REPOSITORY="git@github.com:meinside/osxconfigs.git"
REPOSITORY="git://github.com/meinside/osxconfigs.git"
TMP_DIR="$HOME/configs.tmp"

echo -e "\033[32mThis script will setup various things for OSX\033[0m\n"

# install brew
if ! which brew > /dev/null; then
	echo -e "\033[33m>>> installing brew... (run this script again after installation)\033[0m\n"
	ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
	echo
	echo -e "\033[31m>>> make sure '/usr/local/bin' is on the top of /etc/paths file.\033[0m"
	echo "$ sudo vi /etc/paths"
	echo
	exit 0
fi

# clone config files
echo -e "\033[33m>>> cloning config files...\033[0m\n"
rm -rf $TMP_DIR
git clone $REPOSITORY $TMP_DIR
shopt -s dotglob nullglob
mv $TMP_DIR/* $HOME/
rm -rf $TMP_DIR

# install RVM for single user
echo
echo -e "\033[33m>>> installing RVM...\033[0m\n"
curl -L https://get.rvm.io | bash -s stable --autolibs=enable

# re-login for loading configs
echo
echo -e "\033[31m*** logout, and login again for reloading configs ***\033[0m"
echo "$ exit"
echo
