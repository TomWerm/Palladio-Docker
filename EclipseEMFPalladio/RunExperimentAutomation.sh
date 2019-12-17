#!/bin/bash
Xvfb :99 -screen 0 1920x1080x16 &
export DISPLAY=:99
/usr/eclipse/eclipse \
     -clean \
     -application org.palladiosimulator.experimentautomation.application \
     -consoleLog "$1" \
     -data "/usr/workspace"