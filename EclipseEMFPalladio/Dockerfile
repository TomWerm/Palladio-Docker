FROM ubuntu:20.04
RUN apt-get update && \ 
    apt-get install -y openjdk-11-jre-headless && \
    apt-get install wget -y && \
    apt-get install -y vim
RUN wget http://ftp.fau.de/eclipse/technology/epp/downloads/release/2019-09/R/eclipse-java-2019-09-R-linux-gtk-x86_64.tar.gz
RUN cd usr && \
    tar xfz ../../eclipse-java-2019-09-R-linux-gtk-x86_64.tar.gz
RUN /usr/eclipse/eclipse -application org.eclipse.equinox.p2.director \
    -repository https://updatesite.palladio-simulator.com/palladio-build-updatesite/nightly/,https://download.eclipse.org/releases/2019-09/ \
    -installIU org.palladiosimulator.monitorrepository.feature.feature.group	
#
# RUN ./eclipse/eclipse -application org.eclipse.cdt.managedbuilder.core.headlessbuild
# org.palladiosimulator.product.feature.group
# /usr/lib/jvm/java-11-openjdk-amd64/bin/java
# http://download.eclipse.org/eclipse/updates/4.13 
# https://www.eclipse.org/downloads/download.php?file=/equinox/drops/R-4.13-201909161045/equinox-SDK-4.13.zip&mirror_id=1190
