#Qt More Builds

###Supplying builds for Qt configurations not currently produced by the Qt Project.

## Qt 5.7.0 built with GCC 6 on Ubuntu

./configure -platform linux-g++-64 -opensource -confirm-license -release -c++std c++14 -shared -largefile -openssl -no-qml-debug -qt-libpng -qt-libjpeg -qt-doubleconversion -qt-harfbuzz -qt-xcb -openssl -qt-pcre -skip qtwebengine -nomake tests -nomake examples -v

##Qt 5.5.1 built with Clang 3.6 on Ubuntu 14.04

The following configuration options were used:

./configure -platform linux-clang -release -c++11 -qt-xcb -opensource -confirm-license -nomake tests -nomake examples -skip qtwebkit -skip qtwebkit-examples -largefile -openssl -v
