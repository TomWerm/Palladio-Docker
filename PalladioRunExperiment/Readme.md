# Eclipse on Ubuntu 20.04

## Description
Project extends my [eclipse palladio experiment automation image](https://github.com/TomWerm/Palladio-Docker/tree/master/PalladioExperimentAutomation). It simply adds a small cmd script to run experiments with a few parameters and mounts.

## Usage
Adapt the constants in the cmd script and if neccessary the mounts in the docker run command.

## Docker hub
The image cannot be found at docker hub because it only contains a cmd script to run an experiment.

## Scripts
### RunDockerImage.cmd
- defines constants for the different paths needed
- pulls the image from docker hub
- runs the RunExperimentAutomation.sh script [2]
- with input and output folders mounted (if you have some trouble perhaps [1] contains a solution)

```bash
SET SRC_PATH=%cd%
SET IMAGE_NAME=thomasweber/palladioexperimentautomation:latest
SET CONTAINER_PATH=/usr
SET EXPERIMENT_FILE_NAME=Capacity.experiments
SET EXPERIMENT_GEN_FILE_NAME=Generated.experiments
SET EXPERIMENTS_FILE_DIR=/ExperimentData/model/Experiments/
docker pull %IMAGE_NAME%
docker run -it -v ""%SRC_PATH%\Output"":/result -v""%SRC_PATH%\ExperimentData:/usr/ExperimentData"" %IMAGE_NAME% /usr/RunExperimentAutomation.sh %CONTAINER_PATH%%EXPERIMENTS_FILE_DIR%%EXPERIMENT_FILE_NAME% %CONTAINER_PATH%%EXPERIMENTS_FILE_DIR%%EXPERIMENT_GEN_FILE_NAME%
PAUSE
```

## Authors
[Thomas Weber](https://github.com/TomWerm)

## License
[![License](https://img.shields.io/badge/License-EPL%201.0-red.svg)](https://opensource.org/licenses/EPL-1.0)

## Project status
The project is finished.

## Known issues with eclipse / palladio
- all of these issues have no known effect on the experiment run itself or the results

``` java
SWT SessionManagerDBus: Failed to connect to org.gnome.SessionManager: Failed to execute child process ?dbus-launch? (No such file or directory)
SWT SessionManagerDBus: Failed to connect to org.xfce.SessionManager: Failed to execute child process ?dbus-launch? (No such file or directory)
```
``` java
[WARN] Problem while deactivating CDOViewProviderRegistryImpl
java.lang.InterruptedException
```
``` java
java.lang.InterruptedException
```

## Sources
[1] (https://rominirani.com/docker-on-windows-mounting-host-directories-d96f3f056a2c) \
[2] (https://github.com/TomWerm/Palladio-Docker/tree/master/PalladioExperimentAutomation)
