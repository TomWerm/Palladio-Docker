SET SRC_PATH=F:\Projekte\docker\docker\EclipseEMFPalladio
SET IMAGE_NAME=emf:latest
docker run -it -d %IMAGE_NAME%
FOR /F "tokens=*" %%g IN ('docker ps -q') do (SET CONTAINER_ID=%%g)
FOR /F "tokens=*" %%g IN ('docker ps --format "{{.Names}}"') do (SET CONTAINER_NAME=%%g)
docker cp "%SRC_PATH%/ExperimentData" %CONTAINER_NAME%:/usr/experimentData
docker exec -it %CONTAINER_NAME% /usr/RunExperimentAutomation.sh "/usr/experimentData/model/Experiments/Capacity.experiments"
REM Use these commands for background execution
REM docker exec -it -d %CONTAINER_NAME% /usr/RunExperimentAutomation.sh "/usr/experimentData/model/Experiments/Capacity.experiments"
REM timeout /T 30
docker cp %CONTAINER_NAME%:/usr/experimentData "%SRC_PATH%\Output"
docker stop %CONTAINER_ID%