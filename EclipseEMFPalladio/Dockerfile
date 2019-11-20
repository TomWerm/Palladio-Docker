FROM ubuntu:20.04
RUN apt-get update && \ 
    apt-get install -y openjdk-11-jre-headless && \
    apt-get install wget -y && \
    apt-get install -y vim
ADD InstallEclipse.sh /usr/InstallEclipse.sh
RUN /usr/InstallEclipse.sh
ADD GetPackages.sh /usr/GetPackages.sh
ADD InstallFeature.sh /usr/InstallFeature.sh
RUN /usr/GetPackages.sh
ADD InstallLocalUpdates.sh /usr/InstallLocalUpdates.sh
ADD features.txt usr/features.txt
RUN usr/InstallLocalUpdates.sh
#
# RUN ./eclipse/eclipse -application org.eclipse.cdt.managedbuilder.core.headlessbuild
# org.palladiosimulator.product.feature.group
# /usr/lib/jvm/java-11-openjdk-amd64/bin/java
# http://download.eclipse.org/eclipse/updates/4.13 
# https://www.eclipse.org/downloads/download.php?file=/equinox/drops/R-4.13-201909161045/equinox-SDK-4.13.zip&mirror_id=1190
