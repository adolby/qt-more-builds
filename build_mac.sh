#!/bin/bash

set -o errexit -o nounset

# Download modern OpenSSL
brew install openssl

# Build Qt
cd ~

if [ ! -d "Qt-5.7.0" ]; then
  mkdir -p Qt-5.7.0
fi

cd Qt-5.7.0/

if [ ! -f "qt-everywhere-opensource-src-5.7.0.tar.gz" ]; then
  echo "Getting source files..."
  wget -N https://download.qt.io/official_releases/qt/5.7/5.7.0/single/qt-everywhere-opensource-src-5.7.0.tar.gz
  gunzip < qt-everywhere-opensource-src-5.7.0.tar.gz > qt-everywhere-opensource-src-5.7.0.tar
else
  echo "Already downloaded source files."
fi

if [ -f "qt-everywhere-opensource-src-5.7.0.tar" ]; then
  echo "Extracting downloaded source files..."
  rm -rf qt-everywhere-opensource-src-5.7.0/
  tar xf qt-everywhere-opensource-src-5.7.0.tar
fi

cd qt-everywhere-opensource-src-5.7.0/

echo "Building Qt..."
chmod +x configure
./configure -I "/usr/local/opt/openssl/include/" -L "/usr/local/opt/openssl/lib/" -l "crypto" -l "ssl" -opensource -confirm-license -release -c++std c++14 -shared -largefile -openssl-linked -no-qml-debug -system-zlib -qt-libpng -qt-libjpeg -qt-freetype -qt-pcre -no-dbus -skip qtwebengine -skip qtconnectivity -nomake tests -nomake examples -v
make
sudo make install

exit 0
