# Eclipse on Ubuntu 20.04

## Description
Project contains a dockerfile installing the _openjdk-11-jre-headless_ and _wget_ on the __ubuntu:20.04__ image. Unpacks _eclipse-java-2019-12_ from the [fau](https://www.fau.eu/) into __/usr__. The eclipse application is located in __/usr/eclipse__.

## Usage
Simple docker image with a working headless eclipse installation. For an example how to use the application have a look at [__EclipseExampleApplication__](https://github.com/TomWerm/Palladio-Docker/tree/master/EclipseExampleApplication) as a folder in [this](https://github.com/TomWerm/Palladio-Docker) repository.

## Docker hub
The image can be found at [docker hub](https://hub.docker.com/repository/docker/thomasweber/eclipse). Auto-Build is currently disabled.

## Dockerfile
``` bash
FROM ubuntu:20.04
RUN apt-get clean && \
    apt-get update --fix-missing && \
    apt-get install -y --fix-missing openjdk-11-jre-headless wget
RUN /usr/bin/wget 'http://ftp.fau.de/eclipse/technology/epp/downloads/release/2019-12/R/eclipse-java-2019-12-R-linux-gtk-x86_64.tar.gz' && \
    tar -xzf eclipse-java-2019-12-R-linux-gtk-x86_64.tar.gz -C /usr && \
    rm eclipse-java-2019-12-R-linux-gtk-x86_64.tar.gz
```
## Authors
[Thomas Weber](https://github.com/TomWerm)

## License
[![License](https://img.shields.io/badge/License-EPL%201.0-red.svg)](https://opensource.org/licenses/EPL-1.0)

## Project status
The project is finished.

## Known Issues
This image cannot execute a non-headless eclipse instance as it will produce a
``` java
java.lang.UnsatisfiedLinkError: 'void org.eclipse.swt.internal.gtk.OS._cachejvmptr()'
```
If you have any dependencies on an user interface consider installing _xvfb_ and _libgtk-3-0_ as used in the [PalladioExperimentAutomation](https://github.com/TomWerm/Palladio-Docker/tree/master/PalladioExperimentAutomation) project.
