#!/usr/bin/env sh

# this is a simple script that could be used to add additional features to the container used to run your python software
if [ "$1" = "release" ]
then
    echo "This is a release build"
elif [ "$1" = "debug" ]
then
    echo "This is a debug build"
else
    return 1
fi

apt-get update
apt-get install python3-pyside2.qtwidgets python3-pyside2.qtgui python3-pyside2.qtcore
