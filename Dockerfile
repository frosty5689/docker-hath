FROM openjdk:8-jre-alpine

LABEL maintainer frosty5689 <frosty5689@gmail.com>

RUN apk add --update \
    wget \
    unzip \
    expect \
 && rm -rf /var/cache/apk/*

ARG HATH_VERSION=1.4.2

RUN wget -O /tmp/hath-$HATH_VERSION.zip https://repo.e-hentai.org/hath/HentaiAtHome_$HATH_VERSION.zip && \
    ls -l /tmp && \
    mkdir -p /opt/hath /data/hath && \
    unzip /tmp/hath-$HATH_VERSION.zip -d /opt/hath && \
    rm /tmp/hath-$HATH_VERSION.zip

ADD start.sh /opt/hath/

WORKDIR /data/hath

VOLUME ["/data/hath/cache", "/data/hath/data", "/data/hath/download", "/data/hath/log"]

ENTRYPOINT ["expect", "/opt/hath/start.sh"]
