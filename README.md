# Libbarrett
> Libbarrett is a real-time controls library written in C++ that runs Barrett
Technology products (WAM and BarrettHand)

### Pre-Requisites
To install the required dependencies run:
`./scripts/install-dependencies.sh`

To setup your hardware for the CAN communication run:
`./scripts/setup-hardware.sh`

### Download package
```
cd ~/
git clone https://git.barrett.com/software/libbarrett.git
cd libbarrett
```

### Compile Libbarrett
```
cmake .
make
sudo make install
```

### Configuration Files for the WAM
Upon installation of libbarrett, the configuration files of the robot are installed to the `/etc/barrett` directory. However, to give an additional flexibility of each user maintaining their own configurations for the same robot, by default, the configuration files are read from `~/.barrett` directory if it exists. If not, then libbarrett reads the necessary configuration files from `/etc/barrett/` directory. It is up to the user to maintain and populate the `~/.barrett` directory.
