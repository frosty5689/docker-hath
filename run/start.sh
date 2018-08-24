#!/bin/sh

# Create client_login if it doesn't exist yet
if [ ! -f /hath/data/client_login ]; then
	printf "${HATH_CLIENT_ID}-${HATH_CLIENT_KEY}" >> /hath/data/client_login
fi


exec java -Djava.net.preferIPv4Stack=$PREFER_IPV4_STACK -jar /opt/hath/HentaiAtHome.jar \
    --cache-dir=/hath/cache               \
    --data-dir=/hath/data                 \
    --download-dir=/hath/download         \
    --log-dir=/hath/log                   \
    --temp-dir=/hath/tmp
