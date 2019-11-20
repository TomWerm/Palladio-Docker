FROM ubuntu:20.04
# Add some programs to improve usability
RUN apt-get update && \ 
    apt-get install -y openjdk-11-jre-headless && \
    apt-get install wget -y && \
    apt-get install -y vim && \
    apt-get install -y git
COPY InstallEclipse.sh /usr/InstallEclipse.sh
COPY GetPackages.sh /usr/GetPackages.sh
COPY InstallFeature.sh /usr/InstallFeature.sh
COPY InstallLocalUpdates.sh /usr/InstallLocalUpdates.sh
COPY features.txt usr/features.txt
# Install eclipse from the mirror in the shell file
RUN /usr/InstallEclipse.sh
# Download the Palladio feature name and install them
RUN /usr/GetPackages.sh
###############################################
# Complete Palladio installation at this point
###############################################
# Install everything from feature.txt
RUN usr/InstallLocalUpdates.sh
#
# RUN ./eclipse/eclipse -application org.eclipse.cdt.managedbuilder.core.headlessbuild
# org.palladiosimulator.product.feature.group
# /usr/lib/jvm/java-11-openjdk-amd64/bin/java
# http://download.eclipse.org/eclipse/updates/4.13 
# https://www.eclipse.org/downloads/download.php?file=/equinox/drops/R-4.13-201909161045/equinox-SDK-4.13.zip&mirror_id=1190
