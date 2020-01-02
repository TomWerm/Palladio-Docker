FROM alpine:3.9.4
RUN apk update && \
    apk --no-cache add openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN apk add wget && \
    apk add vim && \
    apk add git
RUN /usr/bin/wget 'https://ftp.fau.de/eclipse/technology/epp/downloads/release/2019-09/R/eclipse-modeling-2019-09-R-linux-gtk-x86_64.tar.gz' && \
    tar -xzf eclipse-modeling-2019-09-R-linux-gtk-x86_64.tar.gz -C /usr && \
    rm eclipse-modeling-2019-09-R-linux-gtk-x86_64.tar.gz