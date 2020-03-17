# Example application for eclipse

## Description
Project extends my [eclipse docker image](https://hub.docker.com/repository/docker/thomasweber/eclipse) with a custom headless application that is installed into eclipse via the dropins folder [1].

## Usage
This example illustrates how to run a headless eclipse applications in a docker container. Import your own application by changing the copied file in the dockerfile [__edu.kit.sdq.exampleapplication_1.0.0.202002111755.jar__](https://github.com/TomWerm/Palladio-Docker/blob/master/EclipseExampleApplication/edu.kit.sdq.exampleapplication_1.0.0.202002111755.jar) and the name of the application in the [__RunApplication.sh__](https://github.com/TomWerm/Palladio-Docker/blob/master/EclipseExampleApplication/RunApplication.sh) script. Build the dockerfile to test if your application is working (as the script will start your application). The configuration problem (org.eclipse.m2e.logback.configuration: The org.eclipse.m2e.logback.configuration bundle was activated before the state location was initialized.  Will retry after the state location is initialized.) has no known effects. The plug-in contained in the image will simply print "plugin started" to the standard output. The plug-in (application) creation process is described in the next paragraph.

## Write your own application
Install [eclipse](https://www.eclipse.org/eclipseide/) and the [eclipse plug-in development environment](https://www.eclipse.org/pde/). Then create a new plug-in project with __File__->__New__->__Other__->__Plug-in-Development__->__Plug-in-Project__. Now give it a name and click next. Deactivate __Generate an activator__ and deactivate __This plug-in will make contributions to the UI__. Be sure to chose a Java version prior to java 11, because that is the version this image is extending. If you choose Java 12 for example, the application will not show up in the list of loaded applications without any hint why it does not. Hit finish and head to the Extensions section of the Manifest.mf in the eclipse editor (deselect Show only extension points from the required plug-ins). Add __org.eclipse.core.runtime.applications__ to the extensions of your plug-in and enable the singleton property.
Open the __plugin.xml__ with the text editor and add a name and change the id for the __application__ extension point implemented by the plug-in. Add this code
``` xml
<run class="yourpackage.yourclass">
</run>
```
with your package- and class-name to your application. It should look like this:
``` xml
<?xml version="1.0" encoding="UTF-8"?>
<?eclipse version="3.4"?>
<plugin>
   <extension
         id="application"
         point="org.eclipse.core.runtime.applications">
      <application
            cardinality="singleton-global"
            thread="main"
            visible="true">
         <run
               class="edu.kit.sdq.exampleapplication.Main">
         </run>
      </application>
   </extension>

</plugin>
```
The class you added (in my case _edu.kit.sdq.exampleapplication.Main_) has to implement the __IApplication__-Interface. An example implementation can look like this:
``` java
package edu.kit.sdq.exampleapplication;

import org.eclipse.equinox.app.IApplication;
import org.eclipse.equinox.app.IApplicationContext;

public class Main implements IApplication {

  @Override
  public Object start(final IApplicationContext context) throws Exception {
    System.out.println("plugin started");
    return IApplication.EXIT_OK;
  }

  @Override
  public void stop() {
    // Add operations when your plugin is stopped
  }
}
```
To export your plug-in hit __File__->__Export__->__Plug-in Development__->__Deployable plug-ins and fragments__. Select your project and add an output path and hit __finish__. More information about a headless application can be found at [2] and general information about eclipse applications at [3].

## Docker hub
The image cannot be found at [docker hub](https://hub.docker.com/) because it is only for demonstrational purposes. If you want to use your own application have a look at the two previous chapters.

## Dockerfile
``` bash
FROM thomasweber/eclipse
COPY RunApplication.sh /usr/RunApplication.sh
RUN chmod a+rx usr/RunApplication.sh
COPY edu.kit.sdq.exampleapplication_1.0.0.202002111755.jar /usr/eclipse/dropins/plugins/edu.kit.sdq.exampleapplication_1.0.0.202002111755.jar
RUN /usr/RunApplication.sh
```

## Scripts
``` bash
#!/bin/bash
/usr/eclipse/eclipse \
     -clean \
     -application edu.kit.sdq.exampleapplication.application \
     -consoleLog
```
## Authors
[Thomas Weber](https://github.com/TomWerm)

## License
[![License](https://img.shields.io/badge/License-EPL%201.0-red.svg)](https://opensource.org/licenses/EPL-1.0)

## Project status
The project is finished.

## Sources
[1] (https://help.eclipse.org/2019-12/index.jsp?topic=%2Forg.eclipse.platform.doc.isv%2Freference%2Fmisc%2Fp2_dropins_format.html)
[2] (https://codeandme.blogspot.com/2012/02/creating-headless-application.html)
[3] (https://wiki.eclipse.org/FAQ_What_is_an_Eclipse_application%3F)
