# Palladio-Docker

## Description
The subprojects in this project contain mostly dockerfiles for the execution of a headless eclipse application in general and more specific the Palladio Experiment Automation.

### Eclipse
Project contains a dockerfile installing the _openjdk-11-jre-headless_ and _wget_ on the __ubuntu:20.04__ image. Unpacks _eclipse-java-2019-12_ from the [fau](https://www.fau.eu/) into __/usr__. The eclipse application is located in __/usr/eclipse__.

### ExlipseExampleApplication
Project extends my [eclipse docker image](https://hub.docker.com/repository/docker/thomasweber/eclipse) with a custom headless application that is installed into eclipse via the dropins folder [1].

### EclipseModellingFramework
Project contains a dockerfile installing the _openjdk-11-jre-headless_ and _wget_ on the __ubuntu:20.04__ image. Unpacks _eclipse-modeling-2019-12_ from the [fau](https://www.fau.eu/) into __/usr__. The eclipse application is located in __/usr-eclipse__. If you do not need the modelling tools, consider using my [__eclipse__](https://github.com/TomWerm/Palladio-Docker/tree/master/Eclipse) image.

### EclipsePalladio
Project extends my [eclipse modeling tools image](https://hub.docker.com/repository/docker/thomasweber/eclipsemodelingtools). In General can install all packages named in features.txt from the given update sites. This dockerfile installs all components used by the [Palladio Component Model](https://www.palladio-simulator.com/home/). It can be modified to enable headless builds similar to [2].

### PalladioExperimentAutomation
Project extends my [eclipse palladio installation image](https://hub.docker.com/repository/docker/thomasweber/eclipsepalladio) with files to run [ExperimentAutomation](https://sdqweb.ipd.kit.edu/wiki/Palladio_Experiment_Automation) experiments [1]. Also installs __xfvb__ and __libgtk-3-0__ because they are used by palladio during the experiment runs. Adds the scripts shown in the next sections to the image. To run an experiment refer to the projects [PalladioExperimentImage](https://github.com/TomWerm/Palladio-Docker/tree/master/PalladioExperimentImage) and [PalladioRunExperiment](https://github.com/TomWerm/Palladio-Docker/tree/master/PalladioRunExperiment).

### PalladioExperimentImage
Project extends my [eclipse palladio installation image](https://hub.docker.com/repository/docker/thomasweber/eclipsepalladio) with sources to run an [ExperimentAutomation](https://sdqweb.ipd.kit.edu/wiki/Palladio_Experiment_Automation) experiment [3].

### PalladioRunExperiment
Project extends my [eclipse palladio experiment automation image](https://github.com/TomWerm/Palladio-Docker/tree/master/PalladioExperimentAutomation). It simply adds a small cmd script to run experiments with a few parameters and mounts.

### Documentation
Motivation for the project and the Readmes in a latex project.

## Authors
[Thomas Weber](https://github.com/TomWerm)

## License
[![License](https://img.shields.io/badge/License-EPL%201.0-red.svg)](https://opensource.org/licenses/EPL-1.0)

## Project status
The project is finished.

## Sources
[1] (https://help.eclipse.org/2019-12/index.jsp?topic=%2Forg.eclipse.platform.doc.isv%2Freference%2Fmisc%2Fp2_dropins_format.html) \
[2] (https://gnu-mcu-eclipse.github.io/advanced/headless-builds/) \
[3] (https://github.com/PalladioSimulator/Palladio-Addons-ExperimentAutomation)

## Further reading
[1] [p2 director](https://help.eclipse.org/kepler/index.jsp?topic=/org.eclipse.platform.doc.isv/guide/p2_director.html)\
[2] [Experiment automation (EA)](https://sdqweb.ipd.kit.edu/wiki/Palladio_Experiment_Automation)\
[3] [EA - Github](https://github.com/PalladioSimulator/Palladio-Addons-ExperimentAutomation)\
[4] [PCM](https://github.com/PalladioSimulator/Palladio-Bench-Product/blob/master/products/org.palladiosimulator.product/org.palladiosimulator.palladiobench.product)\
[5] [Experiment Application](https://github.com/PalladioSimulator/Palladio-Addons-ExperimentAutomation/blob/master/bundles/org.palladiosimulator.experimentautomation.application/src/org/palladiosimulator/experimentautomation/application/ExperimentApplication.java)\
[6] [PCM Nightly](https://updatesite.palladio-simulator.com/palladio-build-updatesite/nightly/)\
[7] [EA espresso - Github](https://github.com/PalladioSimulator/Palladio-Addons-ExperimentAutomation/tree/master/bundles/org.palladiosimulator.experimentautomation.examples.espresso)\
[8] [Docker-MavenXvfb](https://github.com/kit-sdq/Docker-MavenXvfb)\
[9] [UnsatisfiedLinkError](https://bugs.eclipse.org/bugs/show_bug.cgi?id=549244)\
[10] [mirror eclipse plugin sites](https://stackoverflow.com/questions/1371176/downloading-eclipse-plug-in-update-sites-for-offline-installation)\
[11] [Eclipse headless](https://gnu-mcu-eclipse.github.io/advanced/headless-builds/)\
[12] [Valid URL](https://stackoverflow.com/questions/1547899/which-characters-make-a-url-invalid)\
[13] [Meta-Model](https://github.com/PalladioSimulator/Palladio-Addons-ExperimentAutomation/blob/master/bundles/org.palladiosimulator.experimentautomation/model/experimentautomation.ecore)\
[14] [Eclipse Core](https://www.eclipse.org/eclipse/platform-core/)\
[15] [Alpine Eclipse](https://stackoverflow.com/questions/43209656/cannot-run-jfrog-executable-from-inside-alpine-linux-container)\
