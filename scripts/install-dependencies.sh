#!/usr/bin/env bash
# This script installs libbarrett dependencies

# Import the Linux Version Number Variables
. /etc/lsb-release

if [ "$DISTRIB_RELEASE" = "20.04" ]; then
	# Install CAN scripts
	sudo cp reset_can.sh /bin
	sudo cp 60-can.rules /etc/udev/rules.d
	sudo udevadm control --reload-rules && udevadm trigger
	
	# Install libbarrett dependencies
	sudo apt update
	sudo apt install -y linux-lowlatency
	sudo apt install -y git cmake clang net-tools can-utils
	sudo apt install -y libgsl-dev libeigen3-dev libncurses-dev pkg-config 
	sudo apt install -y libboost-system-dev libboost-thread-dev libboost-python-dev

	# Pin the new kernel
	sudo apt-mark hold linux-lowlatency
	
	# Archive the other kernels
	sudo mkdir /boot/archive
	sudo mv /boot/*generic /boot/archive
	sudo update-grub

	#Download and Install patched Libconfig 1.4.5 (supporting C & C++ simultaneously)
	cd ~/Downloads && wget http://web.barrett.com/support/WAM_Installer/libconfig-1.4.5-PATCHED.tar.gz
	tar -xf libconfig-1.4.5-PATCHED.tar.gz
	cd libconfig-1.4.5 && ./configure && make -j$(nproc)
	sudo make install
	sudo ldconfig
else
	echo "This script must run under Ubuntu 20.04"
fi

