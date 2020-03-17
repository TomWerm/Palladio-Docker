# Eclipse with installed palladiosimulator

## Description
Project extends my [eclipse modeling tools image](https://hub.docker.com/repository/docker/thomasweber/eclipsemodelingtools). In General can install all packages named in features.txt from the given update sites. This dockerfile installs all components used by the [Palladio Component Model](https://www.palladio-simulator.com/home/). It can be modified to enable headless builds similar to [5].

## Usage
Simple docker image with a working headless eclipse and palladio installation. For an example how to use the application have a look at [__PalladioExperimentAutomation__](https://github.com/TomWerm/Palladio-Docker/tree/master/PalladioExperimentAutomation) as a folder in [this](https://github.com/TomWerm/Palladio-Docker) repository.

## Docker hub
The image can be found at [docker hub](https://hub.docker.com/repository/docker/thomasweber/eclipsepalladio). Auto-Build is currently disabled.

## Dockerfile
- probably you have to add basic update sites that cannot be located during the installation process to the list in features.txt [4]
``` bash
FROM thomasweber/eclipsemodelingtools
# Install everything from features.txt
COPY InstallFeature.sh /usr/InstallFeature.sh
COPY InstallLocalUpdates.sh /usr/InstallLocalUpdates.sh
COPY features.txt usr/features.txt
RUN chmod a+rx usr/InstallLocalUpdates.sh
RUN chmod a+rx usr/InstallFeature.sh
RUN usr/InstallLocalUpdates.sh
```

## Scripts

### InstallLocalUpdates.sh
- piping every 2 arguments in a line of the input file in the InstallFeature script
``` bash
sed '/^#/ d' /usr/features.txt | sed 's/\([^%]*\)%\([^%]*\)/ "\1" "\2"/' | xargs -r -n 2 /usr/InstallFeature.sh
```

### InstallFeature.sh
- installs the given features from the given update sites with the p2 director [1]
- the basic update site for the 2019-12 release is already added
``` bash
echo installing "$1"
echo from server "$2"
/usr/eclipse/eclipse \
    -application org.eclipse.equinox.p2.director \
    -repository https://download.eclipse.org/releases/2019-12/,"$2" \
    -installIU "$1"
```

### features.txt
- The format of the file is due to [6]:
``` bash
# comment lines
org.feature1,org.feature2%updatesite1,updatesite2
```
- contains all features needed for a palladio experiment automation run [2],[3]
``` bash
#package1,package2,etc%updatesite1,updatesite2,etc
#currently all packages needed to run the palladio experiment automation
org.palladiosimulator.edp2.feature.feature.group,org.palladiosimulator.pcm.feature.feature.group,org.palladiosimulator.simucom.feature.feature.group,org.palladiosimulator.solver.feature.feature.group,org.palladiosimulator.recorderframework.feature.feature.group,org.palladiosimulator.analyzer.feature.feature.group,org.palladiosimulator.monitorrepository.feature.feature.group,org.palladiosimulator.simulizar.feature.feature.group,org.palladiosimulator.simulation.abstractsimengine.desmoj.feature.feature.group%https://updatesite.palladio-simulator.com/palladio-build-updatesite/releases/4.2.0/
# comment this line and uncomment the following one to add the export function in the nightly release
# add the feature back to the list above once a new release with export is available
org.palladiosimulator.experimentautomation.application.feature.feature.group,org.palladiosimulator.experimentautomation.feature.feature.group,org.palladiosimulator.experimentautomation.application.tooladapter.simulizar.feature.feature.group%https://updatesite.palladio-simulator.com/palladio-addons-experimentautomation/branches/csvExportRelease/,https://updatesite.palladio-simulator.com/palladio-build-updatesite/releases/4.2.0/
# org.palladiosimulator.experimentautomation.application.feature.feature.group%https://updatesite.palladio-simulator.com/palladio-build-updatesite/releases/nightly/
```

## Authors
[Thomas Weber](https://github.com/TomWerm)

## License
[![License](https://img.shields.io/badge/License-EPL%201.0-red.svg)](https://opensource.org/licenses/EPL-1.0)

## Project status
The project is finished.

## Sources
[1] (https://help.eclipse.org/kepler/index.jsp?topic=/org.eclipse.platform.doc.isv/guide/p2_director.html) \
[2] (https://github.com/PalladioSimulator/Palladio-Bench-Product/blob/master/products/org.palladiosimulator.product/org.palladiosimulator.palladiobench.product) \
[3] (https://updatesite.palladio-simulator.com/palladio-build-updatesite/nightly/) \
[4] (https://stackoverflow.com/questions/1371176/downloading-eclipse-plug-in-update-sites-for-offline-installation) \
[5] (https://gnu-mcu-eclipse.github.io/advanced/headless-builds/) \
[6] (https://stackoverflow.com/questions/1547899/which-characters-make-a-url-invalid)
