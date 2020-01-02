FROM ubuntu:20.04
# Add some programs to improve usability
RUN apt-get update && \ 
    apt-get install -y openjdk-11-jre-headless && \
    apt-get install wget -y && \
    apt-get install -y vim && \
    apt-get install -y git
RUN apt-get clean && \
    apt-get update && \ 
    apt-get install -y xvfb && \ 
    apt-get install -y --fix-missing libgtk-3-0
# Install eclipse from the mirror in the shell file
COPY InstallEclipse.sh /usr/InstallEclipse.sh
RUN /usr/InstallEclipse.sh
# Install everything from features.txt
COPY InstallFeature.sh /usr/InstallFeature.sh
COPY InstallLocalUpdates.sh /usr/InstallLocalUpdates.sh
COPY features.txt usr/features.txt
RUN usr/InstallLocalUpdates.sh
######################################################
# Complete Palladio/Eclipse installation at this point
######################################################
# Run the experiment automation and copy the experiment files
COPY RunExperimentAutomation.sh /usr/RunExperimentAutomation.sh