FROM frosty5689/alpine.openjdk-jre:8.151.12-r0

LABEL maintainer frosty5689 <frosty5689@gmail.com>

RUN apk add --update \
    wget \
    unzip \
 && rm -rf /var/cache/apk/*

ARG HATH_VERSION=1.4.2

COPY root/ /

RUN wget -O /tmp/hath-$HATH_VERSION.zip https://repo.e-hentai.org/hath/HentaiAtHome_$HATH_VERSION.zip && \
    ls -l /tmp && \
    mkdir -p /opt/hath /hath && \
    unzip /tmp/hath-$HATH_VERSION.zip -d /opt/hath && \
    rm /tmp/hath-$HATH_VERSION.zip


VOLUME ["/hath/cache", "/hath/data", "/hath/download", "/hath/log"]

CMD ["java", "-jar /opt/hath/HentaiAtHome.jar --cache-dir=/hath/cache --data-dir=/hath/data --download-dir=/hath/download --download-dir=/hath/download"]
