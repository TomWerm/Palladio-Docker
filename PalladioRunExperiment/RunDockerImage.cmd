SET SRC_PATH=%cd%
SET IMAGE_NAME=thomasweber/palladioexperimentautomation:latest
docker pull %IMAGE_NAME%
docker run -it -d %IMAGE_NAME%
FOR /F "tokens=*" %%g IN ('docker ps -q') do (SET CONTAINER_ID=%%g)
FOR /F "tokens=*" %%g IN ('docker ps --format "{{.Names}}"') do (SET CONTAINER_NAME=%%g)
docker cp "%SRC_PATH%/ExperimentData" %CONTAINER_NAME%:/usr/experimentData
docker exec -it %CONTAINER_NAME% /usr/RunExperimentAutomation.sh "/usr/experimentData/model/Experiments/Capacity.experiments"
REM Use these commands for background execution
REM docker exec -it -d %CONTAINER_NAME% /usr/RunExperimentAutomation.sh "/usr/experimentData/model/Experiments/Capacity.experiments"
REM timeout /T 30
docker exec -it %CONTAINER_NAME% bin/bash
docker cp %CONTAINER_NAME%:/result "%SRC_PATH%\Output"
docker stop %CONTAINER_ID%