# see hooks/build and hooks/.config
ARG BASE_IMAGE_PREFIX
FROM ${BASE_IMAGE_PREFIX}openjdk:8-jre-alpine

# see hooks/post_checkout
ARG ARCH
COPY qemu-${ARCH}-static /usr/bin

LABEL maintainer frosty5689 <frosty5689@gmail.com>

RUN apk add --no-cache --update \
    ca-certificates \
    tzdata \
 && update-ca-certificates

ARG HATH_VERSION

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
