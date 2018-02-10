FROM openjdk:8-jre-alpine

LABEL maintainer frosty5689 <frosty5689@gmail.com>

RUN apk add --no-cache --update \
    ca-certificates \
    tzdata \
 && update-ca-certificates

ARG HATH_VERSION=1.4.2

RUN apk add --no-cache --update --virtual build-dependencies wget unzip && \
    wget -O /tmp/hath-$HATH_VERSION.zip https://repo.e-hentai.org/hath/HentaiAtHome_$HATH_VERSION.zip && \
    ls -l /tmp && \
    mkdir -p /opt/hath /hath && \
    unzip /tmp/hath-$HATH_VERSION.zip -d /opt/hath && \
    rm /tmp/hath-$HATH_VERSION.zip && \
    apk del build-dependencies

ADD run/* /opt/hath/

VOLUME ["/hath/cache", "/hath/data", "/hath/download", "/hath/log", "/hath/tmp"]

CMD ["/opt/hath/start.sh"]
