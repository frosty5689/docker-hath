FROM openjdk:8-jre-alpine

# Hentai@Home URL
# https://repo.e-hentai.org/hath/HentaiAtHome_1.4.1.zip

RUN apk update --quiet && \
    apk add --quiet --upgrade wget unzip expect

ARG HATH_VERSION=1.4.1

RUN wget -q -O /tmp/hath-$HATH_VERSION.zip https://repo.e-hentai.org/hath/HentaiAtHome_$HATH_VERSION.zip && \
	ls -l /tmp && \
	mkdir -p /opt/hath /data/hath && \
	unzip -q /tmp/hath-$HATH_VERSION.zip -d /opt/hath && \
	rm /tmp/hath-$HATH_VERSION.zip

ADD start.sh /opt/hath/
WORKDIR /opt/hath

ENTRYPOINT ["expect", "/opt/hath/start.sh"]
