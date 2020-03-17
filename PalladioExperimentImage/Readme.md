# PalladioExperimentAutomation

## Description
Project extends my [eclipse palladio installation image](https://hub.docker.com/repository/docker/thomasweber/eclipsepalladio) with sources to run an [ExperimentAutomation](https://sdqweb.ipd.kit.edu/wiki/Palladio_Experiment_Automation) experiment [1].

## Usage
Adapt the parameters in __RunDockerImage.cmd__ to your experiment and the experiment data in the folder _ExperimentData_. Run the experiment with the cmd script. In this way, the results of the experiments are reproducible on any machine. For another approach to use the dockerfile have a look at the [PalladioRunExperiment](https://github.com/TomWerm/Palladio-Docker/tree/master/PalladioRunExperiment)-Image that mount the input and output folders directly in the script.

## Docker hub
The image can be found at [docker hub](https://hub.docker.com/repository/docker/thomasweber/palladioexperimentimage). Auto-Build is currently disabled.

## Dockerfile
``` bash
FROM thomasweber/palladioexperimentautomation:latest
COPY ExperimentData/ /usr/ExperimentData
```

## RunDockerImage.cmd
- windows script to run the experiments in the annotated file and store the results at the current location
- change the paths to match your local folder structure
- change the used image to the one you build with your experiment data (can be a local image)
- executes the given experiment and saves the results in the folder \\Output

``` bash
SET SRC_PATH=%cd%
SET IMAGE_NAME=thomasweber/palladioexperimentimage:latest
SET CONTAINER_PATH=/usr
SET EXPERIMENT_FILE_NAME=Capacity.experiments
SET EXPERIMENT_GEN_FILE_NAME=Generated.experiments
SET EXPERIMENTS_FILE_DIR=/ExperimentData/model/Experiments/
SET EXPERIMENTS_FILE_DIR_WINDOWS=\ExperimentData\model\Experiments\
docker pull %IMAGE_NAME%
docker run -it -d %IMAGE_NAME%
FOR /F "tokens=*" %%g IN ('docker ps -q') do (SET CONTAINER_ID=%%g)
FOR /F "tokens=*" %%g IN ('docker ps --format "{{.Names}}"') do (SET CONTAINER_NAME=%%g)
docker exec -it %CONTAINER_NAME% /usr/RunExperimentAutomation.sh %CONTAINER_PATH%%EXPERIMENTS_FILE_DIR%%EXPERIMENT_FILE_NAME% %CONTAINER_PATH%%EXPERIMENTS_FILE_DIR%%EXPERIMENT_GEN_FILE_NAME%
docker cp %CONTAINER_NAME%:/result "%SRC_PATH%\Output"
docker stop %CONTAINER_ID%
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
[1] (https://github.com/PalladioSimulator/Palladio-Addons-ExperimentAutomation)\
