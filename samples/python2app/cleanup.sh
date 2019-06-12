#!/usr/bin/env sh

# this is a simple script that could be used to cleanup after you installed additional features via pip
if [ "$1" = "release" ]
then
    echo "This is a release build"
elif [ "$1" = "debug" ]
then
    echo "This is a debug build"
else
    return 1
fi


# remove packages you will not need to run your application and clean cache
apt-get -y remove curl
apt -y autoremove
rm -rf /var/lib/apt/lists/*