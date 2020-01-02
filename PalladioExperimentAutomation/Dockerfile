FROM thomasweber/eclipsemodelingtools
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