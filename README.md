#Qt More Builds

###Supplying builds for Qt configurations not currently produced by the Qt Project.

## Qt 5.7.0 built with clang (Apple LLVM 8.0) on macOS 10.12
### Includes OpenSSL but not the Qt Connectivity module (Bluetooth or NFC)

./configure -I "/usr/local/opt/openssl/include/" -L "/usr/local/opt/openssl/lib/" -l "crypto" -l "ssl" -opensource -confirm-license -release -c++std c++14 -shared -largefile -openssl-linked -no-qml-debug -system-zlib -qt-libpng -qt-libjpeg -qt-freetype -qt-pcre -no-dbus -skip qtwebengine -skip qtconnectivity -nomake tests -nomake examples -v

## Qt 5.7.0 built with gcc 6 on Ubuntu 14.04
### Includes OpenSSL - ICU 52

./configure -platform linux-g++-64 -opensource -confirm-license -release -c++std c++14 -shared -largefile -openssl -no-qml-debug -qt-libpng -qt-libjpeg -qt-doubleconversion -qt-harfbuzz -qt-xcb -qt-pcre -skip qtwebengine -nomake tests -nomake examples -v -prefix ~/Qt/5.7

##Qt 5.5.1 built with clang 3.6 on Ubuntu 14.04

The following configuration options were used:

./configure -platform linux-clang -release -c++11 -qt-xcb -opensource -confirm-license -nomake tests -nomake examples -skip qtwebkit -skip qtwebkit-examples -largefile -openssl -v
