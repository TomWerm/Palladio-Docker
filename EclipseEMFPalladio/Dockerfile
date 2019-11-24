FROM ubuntu:20.04
# Add some programs to improve usability
RUN apt-get update && \ 
    apt-get install -y openjdk-11-jre-headless && \
    apt-get install wget -y && \
    apt-get install -y vim && \
    apt-get install -y git
# Install eclipse from the mirror in the shell file
COPY InstallEclipse.sh /usr/InstallEclipse.sh
RUN /usr/InstallEclipse.sh
# Download the Palladio feature names and install them
COPY GetPackages.sh /usr/GetPackages.sh
COPY InstallFeature.sh /usr/InstallFeature.sh
RUN /usr/GetPackages.sh
######################################################
# Complete Palladio/Eclipse installation at this point
######################################################
# Install everything from feature.txt
COPY InstallLocalUpdates.sh /usr/InstallLocalUpdates.sh
COPY features.txt usr/features.txt
RUN usr/InstallLocalUpdates.sh
# Run the experiment automation and copy the experiment files
COPY RunExperimentAutomation.sh /usr/RunExperimentAutomation.sh
COPY ExperimentData /usr/experimentData