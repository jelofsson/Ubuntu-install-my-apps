#!/bin/sh

# == Miscellaneous
###############################
# synaptic = Package Manager
# guake = dropdown terminal
# btsync-user = Sync files & folders between your Workstations (Bittorrent sync)
# classicmenu-indicator	= Classic Navigation Menu
misc="synaptic guake btsync-user classicmenu-indicator folder-color"

# == MEDIA TOOLS
###############################
# vlc = VLC media player
# spotify-client = Spotify
media="vlc spotify-client"

# == SOFTWARE DEVELOPMENT
###############################
# git = Git version control
# nodejs = NodejS
# npm = Node Package Mangager
# brackets = Sourcecode Editor
# filezilla = FTP Client
development="git nodejs npm brackets filezilla"

# == NETWORK
###############################
# nethogs = Monitor network activity
# wondershaper = Limit network bandwith
# ufw = Uncomplicated firewall
# gufw = GUI Uncomplicated firewall
network="nethogs wondershaper gufw ufw"

# == SYSTEM MONITOR TOOLS
###############################
# hardinfo = Systemprofile & benchmark
# gparted = Hdd/Partition Manager
# htop = Process Manager
# indicator-multiload = System Overview (cpu/mem/net/..) graphs
# psensor = Sensor indicator (cpu/fan)
system="htop synaptic hardinfo gparted psensor indicator-multiload"

LIST_OF_APPS="$misc $media $development $network $system"

# Repository list
echo "Adding repository links.. (This may take a while)"
apt-add-repository -y ppa:costales/folder-color # folder-color
apt-add-repository -y ppa:tuxpoldo/btsync # bittorrent-sync
apt-add-repository -y ppa:diesch/testing # indicator
apt-add-repository -y ppa:jfi/ppa # psensor indicator
apt-add-repository -y ppa:webupd8team/brackets # brackets
apt-add-repository -y "deb http://repository.spotify.com stable non-free" # spotify
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59 # spotify

# Remove spam from unity-list
echo "Removing spam from unity.."
apt-get autoremove unity-lens-shopping;
apt-get autoremove unity-lens-music;
apt-get autoremove unity-lens-photos;
apt-get autoremove unity-lens-gwibber;
apt-get autoremove unity-lens-video

# Deactivate notification bubbles
mv /usr/share/dbus-1/services/org.freedesktop.Notifications.service{,.disabled}
# To re-enable:
# mv /usr/share/dbus-1/services/org.freedesktop.Notifications.service{.disabled,}

# Set terminal colors
echo "Set terminal colors.."
echo 'export PS1="\[$(tput bold)\]\[$(tput setaf 1)\]\u\[$(tput setaf 1)\]@\[$(tput setaf 4)\]\h:\w\[$(tput setaf 6)\]\\$ \[$(tput sgr0)\]"' >> ~/.bashrc

# UPDATE
echo "Updating repository list.."
apt-get update
# INSTALL
echo "Installing your applications.."
echo $LIST_OF_APPS
apt-get install -y $LIST_OF_APPS
echo "DONE. You should reboot."
