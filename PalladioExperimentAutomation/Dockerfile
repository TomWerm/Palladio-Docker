FROM thomasweber/eclipsepalladio
COPY RunExperimentAutomation.sh /usr/RunExperimentAutomation.sh
RUN chmod a+rx usr/RunExperimentAutomation.sh
RUN apt-get clean && \
    apt-get update --fix-missing && \ 
    apt-get install -y --fix-missing xvfb libgtk-3-0