#!/bin/sh

# Create client_login if it doesn't exist yet
if [ ! -f /data/hath/data/client_login ]; then
    printf "${HATH_CLIENT_ID}-${HATH_CLIENT_KEY}" >> /data/hath/data/client_login
fi

exec java -jar /opt/hath/HentaiAtHome.jar  \
    --cache-dir=/data/hath/cache            \
    --data-dir=/data/hath/data              \
    --download-dir=/data/hath/download      \
    --log-dir=/data/hath/log
