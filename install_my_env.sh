#!/bin/bash

# Get the absolute path to this script
SCRIPT=$(readlink -f "$0")
# Remove the filename from the path
SCRIPTPATH=$(dirname "$SCRIPT")

# ref: https://askubuntu.com/a/30157/8698
if ! [ "$(id -u)" = 0 ]
then
	echo "The script must be run as root." >&2
	exit 1
fi

# Install the basics
apt -qq -y update
apt -qq -y install wget vim git terminator dos2unix make tree bless
apt_res=$?
if ! [ $apt_res = 0 ]
then
	echo "Failed to install basic softwares." >&2
	exit $apt_res
fi

function dl_and_replace {
	tmp_file=/home/"$SUDO_USER"/.__tmp_"$1"__
	dl_src_link=https://raw.githubusercontent.com/EasyRiderr/basic_env_files/master/
	sudo -u "$SUDO_USER" wget -qO "$tmp_file" "$dl_src_link""$1"
	dl_res=$?
	if ! [ $dl_res = 0 ]
	then
		echo "Failed to download $1 file." >&2
		exit $dl_res
	fi

	# Store existing files as back up, just in case...
	if [ -e /home/"$SUDO_USER"/"$1" ]
	then
		sudo -u "$SUDO_USER" mv /home/"$SUDO_USER"/"$1" /home/"$SUDO_USER"/"$1".bak
	fi

	# Use downloaded files
	sudo -u "$SUDO_USER" mv "$tmp_file" /home/"$SUDO_USER"/"$1"
}

# Download custom env file and replace local ones
dl_and_replace .vimrc
dl_and_replace .bashrc
dl_and_replace .bash_aliases


# Quick git configuration
sudo -u "$SUDO_USER" git config --global core.excludesfile "~/.gitignore_global"
sudo -u "$SUDO_USER" git config --global core.editor "vim"
sudo -u "$SUDO_USER" git config --global user.name "Yoan Dumas"
echo "Please insert the mail address to use with global config:"
read
sudo -u "$SUDO_USER" git config --global user.email "$REPLY"

# Perform the snap install
snap install spotify
snap install typora
snap install kolourpaint
snap install slack
snap install discord
snap install signal-desktop

apt -qq -y autoremove
