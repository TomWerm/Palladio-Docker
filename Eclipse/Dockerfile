FROM alpine:3.9.4
RUN apk update && \
    apk --no-cache add openjdk11 wget --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN /usr/bin/wget 'https://ftp.fau.de/eclipse/oomph/epp/2019-12/R/eclipse-inst-linux64.tar.gz' && \
    tar -xzf eclipse-inst-linux64.tar.gz -C /usr && \
    rm eclipse-inst-linux64.tar.gz