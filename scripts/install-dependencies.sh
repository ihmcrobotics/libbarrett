#!/usr/bin/env bash
# This script installs libbarrett dependencies

# Import the Linux Version Number Variables
. /etc/lsb-release

if [ "$DISTRIB_RELEASE" = "20.04" ]; then

	sudo apt-get install -y git cmake clang net-tools can-utils
	sudo apt-get install -y libgsl-dev libeigen3-dev libncurses-dev pkg-config libboost-all-dev

	#Download and Install patched Libconfig 1.4.5
	cd ~/Downloads
	wget http://web.barrett.com/support/WAM_Installer/libconfig-1.4.5-PATCHED.tar.gz
	tar -xf libconfig-1.4.5-PATCHED.tar.gz
	cd libconfig-1.4.5
	./configure && make && sudo make install
	sudo ldconfig
else
	echo "This script must run under Ubuntu 20.04"
fi

