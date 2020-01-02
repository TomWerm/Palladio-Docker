#!/bin/bash
FROM thomasweber/eclipsemodelingtools
# Install everything from features.txt
COPY InstallFeature.sh /usr/InstallFeature.sh
COPY InstallLocalUpdates.sh /usr/InstallLocalUpdates.sh
COPY features.txt usr/features.txt
RUN chmod +x usr/InstallLocalUpdates.sh
RUN usr/InstallLocalUpdates.sh