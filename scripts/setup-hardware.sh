#!/bin/bash
sudo cp reset_can_non_xenomai.sh /bin
sudo cp 60-can.rules /etc/udev/rules.d
sudo udevadm control --reload-rules && udevadm trigger
