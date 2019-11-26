#!/bin/bash
/usr/eclipse/eclipse \
     -clean \
     -application org.palladiosimulator.experimentautomation.application \
     -consoleLog "$1" \
     -data "/usr/workspace"