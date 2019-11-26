docker run --rm -it emf:latest /usr/RunExperimentAutomation.sh "/usr/experimentData/model/Experiments/Capacity.experiments" tail -f /dev/null
FOR /F "tokens=*" %%g IN ('docker ps -q') do (SET CONTAINER_ID=%%g)
IF [%CONTAINER_ID%] == [] GOTO skip
docker cp %CONTAINER_ID%:/usr/experimentData "F:\Projekte\docker\docker\EclipseEMFPalladio\Output"
docker stop %CONTAINER_ID%
:skip
pause