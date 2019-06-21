#!/usr/bin/env bash
# This script installs the following dependencies:
#
# GCC 4.8
# Libconfig-Patched
# Boost 1.58.0
# Eigen 3.2.10

# Import the Linux Version Number Variables
. /etc/lsb-release

if [ "$DISTRIB_RELEASE" == "18.04" ]; then

	sudo apt-get install build-essential python-dev python-argparse git cmake
	sudo apt-get install libgsl0-dev libncurses5-dev pkg-config 

	# Use GCC 4.8  
	sudo apt-get update; sudo apt-get install gcc-4.8 g++-4.8
	sudo update-alternatives --remove-all gcc 
	sudo update-alternatives --remove-all g++
	sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
	sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20
	sudo update-alternatives --config gcc
	sudo update-alternatives --config g++

	#Download and Install patched Libconfig 1.4.5
	cd ~/Downloads
	wget http://web.barrett.com/support/WAM_Installer/libconfig-1.4.5-PATCHED.tar.gz
	tar -xf libconfig-1.4.5-PATCHED.tar.gz
	cd libconfig-1.4.5
	sudo ./configure && sudo make && sudo make install

	#Download and install Boost 1.58.0
	cd ~/Downloads
	wget http://sourceforge.net/projects/boost/files/boost/1.58.0/boost_1_58_0.tar.bz2
	tar --bzip2 -xf boost_1_58_0.tar.bz2
	cd boost_1_58_0
	./bootstrap.sh --prefix=/usr/local/
	sudo ./b2 install
	export PATH=$PATH:/usr/local/

	#Download and install Eigen 3.2.10
	cd ~/Downloads
	wget http://bitbucket.org/eigen/eigen/get/3.2.10.tar.bz2
	tar --bzip2 -xf 3.2.10.tar.bz2
	cd eigen-eigen-b9cd8366d4e8/
	mkdir build && cd build
	cmake ../ && make && sudo make install

else
	echo "This script must run under Ubuntu 18.04"
fi

