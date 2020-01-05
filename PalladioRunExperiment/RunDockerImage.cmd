SET SRC_PATH=%cd%
SET IMAGE_NAME=thomasweber/palladioexperimentautomation:latest
SET CONTAINER_PATH=/usr
SET EXPERIMENT_FILE_NAME=Capacity.experiments
SET EXPERIMENT_GEN_FILE_NAME=Generated.experiments
SET EXPERIMENTS_FILE=/ExperimentData/model/Experiments/%EXPERIMENT_GEN_FILE_NAME%
SET EXPERIMENTS_FILE_WINDOWS=\ExperimentData\model\Experiments\
@echo OFF
cscript replace.vbs "%SRC_PATH%%EXPERIMENTS_FILE_WINDOWS%%EXPERIMENT_FILE_NAME%" "<datasource .*/>" "<datasource xsi:type=" "ExperimentAutomation.Experiments.AbstractSimulation:FileDatasource" " location=" "/result" "/>" "%SRC_PATH%%EXPERIMENTS_FILE_WINDOWS%%EXPERIMENT_GEN_FILE_NAME%"
@echo ON
docker pull %IMAGE_NAME%
docker run -it -d %IMAGE_NAME%
FOR /F "tokens=*" %%g IN ('docker ps -q') do (SET CONTAINER_ID=%%g)
FOR /F "tokens=*" %%g IN ('docker ps --format "{{.Names}}"') do (SET CONTAINER_NAME=%%g)
docker cp "%SRC_PATH%/ExperimentData" %CONTAINER_NAME%:/usr/ExperimentData
docker exec -it %CONTAINER_NAME% /usr/RunExperimentAutomation.sh %CONTAINER_PATH%%EXPERIMENTS_FILE%
REM in case you need to do some other tasks after the experiment, uncomment the next line
REM docker exec -it %CONTAINER_NAME% bin/bash
docker cp %CONTAINER_NAME%:/result "%SRC_PATH%\Output"
docker stop %CONTAINER_ID%
DEL /f %SRC_PATH%%EXPERIMENTS_FILE_WINDOWS%%EXPERIMENT_GEN_FILE_NAME%
PAUSE