docker run --rm --interactive emf:latest /usr/RunExperimentAutomation.sh "/usr/experimentData/model/Experiments/Capacity.experiments"
FOR /F "tokens=*" %%g IN ('docker ps -q') do (SET CONTAINER_ID=%%g)
docker cp %CONTAINER_ID%:/usr/experimentData "F:\Projekte\docker\docker\EclipseEMFPalladio\Output"
docker stop %CONTAINER_ID%
pause