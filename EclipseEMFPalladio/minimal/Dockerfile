FROM alpine:3.9.4
RUN apk update && \
    apk --no-cache add openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN apk add wget && \
    apk add vim && \
    apk add git
COPY InstallEclipse.sh /usr/InstallEclipse.sh
RUN /usr/InstallEclipse.sh
# Install everything from features.txt
COPY InstallFeature.sh /usr/InstallFeature.sh
COPY InstallLocalUpdates.sh /usr/InstallLocalUpdates.sh
COPY features.txt usr/features.txt
RUN usr/InstallLocalUpdates.sh