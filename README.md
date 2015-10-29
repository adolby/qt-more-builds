#Qt More Builds

###Supplying builds for Qt configurations not currently supported by the Qt Project.

##Qt built with Clang 3.6 on Ubuntu 14.04

The following configuration options were used:

./configure -platform linux-clang -release -c++11 -qt-xcb -opensource -confirm-license -nomake tests -nomake examples -skip qtwebkit -skip qtwebkit-examples -largefile -openssl -v
