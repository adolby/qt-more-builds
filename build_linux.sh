#!/bin/bash

set -o errexit -o nounset

# Update platform
sudo apt-get update
sudo apt-get -qq -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

# Update GCC
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get -qq -y install gcc-6 g++-6
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 100
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 100

sudo apt-get -qq -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install libssl-dev
sudo apt-get -qq -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install libfontconfig1
sudo apt-get -qq -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install libfontconfig1-dev
sudo apt-get -qq -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install libfreetype6-dev
sudo apt-get -qq -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install libx11-dev
sudo apt-get -qq -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install libxext-dev
sudo apt-get -qq -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install libxfixes-dev
sudo apt-get -qq -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install libxi-dev
sudo apt-get -qq -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install libxrender-dev
sudo apt-get -qq -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install libxcb1-dev
sudo apt-get -qq -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install libx11-xcb-dev
sudo apt-get -qq -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install libxcb-glx0-dev
sudo apt-get -qq -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install mesa-common-dev
sudo apt-get -qq -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install libglu1-mesa-dev

# Build Qt
cd ~
mkdir Qt-5.7.0
cd Qt-5.7.0
wget -N https://download.qt.io/official_releases/qt/5.7/5.7.0/single/qt-everywhere-opensource-src-5.7.0.tar.gz
gunzip qt-everywhere-opensource-src-5.7.0.tar.gz
tar xf qt-everywhere-opensource-src-5.7.0.tar

cd qt-everywhere-opensource-src-5.7.0
sudo chmod +x configure
./configure -platform linux-g++-64 -opensource -confirm-license -release -c++std c++14 -shared -largefile -openssl -no-qml-debug -qt-libpng -qt-libjpeg -qt-doubleconversion -qt-harfbuzz -qt-xcb -openssl -qt-pcre -skip qtwebengine -nomake tests -nomake examples -v
make -j2
sudo make install

exit 0
