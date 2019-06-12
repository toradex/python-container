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


# if you need to install additional package is a good idea to limit dependecies and clean up the cache afterwards (in cleanup.sh)
apt-get update
apt-get install -y --no-install-recommends curl

# download geolite database (we use insecure to minimize components installed in the container for this purpose), unzip it and remove the downloaded file
curl -L --insecure https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz --output /GeoLite2-City.tar.gz
tar --strip 1 -xvzf /GeoLite2-City.tar.gz
rm /GeoLite2-City.tar.gz
