#!/usr/bin/env bash
# Update Date: Oct. 2019

THIS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Fail on error
set -e

# Ubuntu 16.04 Requirements

sudo apt-get install cmake g++ git automake libtool libgc-dev bison flex libfl-dev libgmp-dev libboost-dev libboost-iostreams-dev libboost-graph-dev llvm pkg-config python python-scapy python-ipaddr python-ply tcpdump

#sudo apt-get install libboost-all-dev libbz2-dev
sudo apt-get install -y doxygen graphviz texlive-full

# Install Protobuf
sudo apt-get install autoconf automake libtool curl make g++ unzip
git clone https://github.com/protocolbuffers/protobuf.git
cd protobuf
git checkout v3.2.0
sudo ./autogen.sh && sudo ./configure && make && make check
sudo make install && sudo ldconfig
cd ..

# Install P4C
git clone --recursive https://github.com/p4lang/p4c.git
cd p4c
mkdir build
cd build
cmake ..
make -j4 && make -j4 check
sudo make install
