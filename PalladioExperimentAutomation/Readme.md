# Eclipse with installed palladiosimulator and files for ExperimentAutomation runs

## Description
Project extends my [eclipse palladio installation image](https://hub.docker.com/repository/docker/thomasweber/eclipsepalladio) with files to run [ExperimentAutomation](https://sdqweb.ipd.kit.edu/wiki/Palladio_Experiment_Automation) experiments [1]. Also installs __xfvb__ and __libgtk-3-0__ because they are used by palladio during the experiment runs. Adds the scripts shown in the next sections to the image. To run an experiment refer to the projects [PalladioExperimentImage](https://github.com/TomWerm/Palladio-Docker/tree/master/PalladioExperimentImage) and [PalladioRunExperiment](https://github.com/TomWerm/Palladio-Docker/tree/master/PalladioRunExperiment).

## Usage
This docker image adds scripts and installs programs. It cannot be executed.

## Docker hub
The image can be found at [docker hub](https://hub.docker.com/repository/docker/thomasweber/palladioexperimentautomation). Auto-Build is currently disabled.

## Dockerfile
``` bash
FROM thomasweber/eclipsepalladio
RUN apt-get clean && \
    apt-get update --fix-missing && \
    apt-get install -y --fix-missing xvfb libgtk-3-0
COPY RunExperimentAutomation.sh /usr/RunExperimentAutomation.sh
RUN chmod a+rx usr/RunExperimentAutomation.sh
COPY ModifyExperimentsFile.sh /usr/ModifyExperimentsFile.sh
RUN chmod a+rx usr/ModifyExperimentsFile.sh
```

## ModifyExperimentsFile.sh
- modifies the line with the datasource in the given file to export csv and add a valid location in the docker image

``` bash
#!/bin/bash
# modifies the file given with the first parameter and saves it to the file given with the second parameter
sed -E 's/<datasource [^>]*\/>/<datasource xsi:type=\"ExperimentAutomation.Experiments.AbstractSimulation:FileDatasource\" location=\"\/result\" exportOption=\"CSV\"\/>/' "$1" > "$2"
```
## RunExperimentAutomation.sh
- starts the xvfb server and runs the experiment with the given parameters

``` bash
#!/bin/bash
# first argument is the path to the original experiments file, second is the path where to store the generated file
Xvfb :99 -screen 0 1920x1080x16 &
export DISPLAY=:99
/usr/ModifyExperimentsFile.sh "$1" "$2"
/usr/eclipse/eclipse \
     -clean \
     -application org.palladiosimulator.experimentautomation.application \
     -consoleLog "$2" \
     -data "/usr/workspace"
```

## Authors
[Thomas Weber](https://github.com/TomWerm)

## License
[![License](https://img.shields.io/badge/License-EPL%201.0-red.svg)](https://opensource.org/licenses/EPL-1.0)

## Project status
The project is finished.

## Sources
[1] (https://github.com/PalladioSimulator/Palladio-Addons-ExperimentAutomation)\
