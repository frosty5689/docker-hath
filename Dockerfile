FROM openjdk:8-jre-alpine

# Hentai@Home URL
# https://repo.e-hentai.org/hath/HentaiAtHome_1.4.1.zip

RUN apk update --quiet && \
    apk add --quiet --upgrade wget unzip expect

ARG HATH_GID=9999
ARG HATH_UID=9999
ARG HATH_VERSION=1.4.1

RUN addgroup -g $HATH_GID -S hath && \
	adduser -g "" -S -D -H -G hath -u $HATH_UID hath && \
	wget -q -O /tmp/hath-$HATH_VERSION.zip https://repo.e-hentai.org/hath/HentaiAtHome_$HATH_VERSION.zip && \
	ls -l /tmp && \
	mkdir -p /opt/hath /data/hath && \
	unzip -q /tmp/hath-$HATH_VERSION.zip -d /opt/hath && \
	chown -R hath:hath /opt/hath /data/hath && \
	rm /tmp/hath-$HATH_VERSION.zip

ADD start.sh /opt/hath/
RUN chown hath:hath /opt/hath/start.sh

USER hath
WORKDIR /opt/hath

ENTRYPOINT ["expect", "/opt/hath/start.sh"]
