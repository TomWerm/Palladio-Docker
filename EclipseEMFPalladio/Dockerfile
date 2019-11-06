FROM ubuntu:20.04
RUN apt-get update && \ 
    apt-get install -y openjdk-11-jre-headless && \
    apt-get install wget -y
RUN wget http://ftp.fau.de/eclipse/technology/epp/downloads/release/2019-09/R/eclipse-java-2019-09-R-linux-gtk-x86_64.tar.gz && \
    tar xfz eclipse-java-2019-09-R-linux-gtk-x86_64.tar.gz