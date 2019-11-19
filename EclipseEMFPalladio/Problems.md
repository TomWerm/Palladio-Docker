# Probleme
## P2 Director
- es gibt keine installAll Operation - einzeln installieren
- hat Palladio ein Paket mit allen Features? - nein
- p2 scheint die Referenzen nicht vernünftig aufzulösen - mit der Eclipse Update Site gehts``
## Eclipse
- 
## Idee
- nutzen des dropins folders stattdessen
- Installation scheint grundsätzlich zu funktionieren

## Generelle Ziele
* Experiment-Automation: hat Eclipse Application, die man starten kann. Unklar, ob es ohne XServer startet.
* Retten des EDP2-Repository/CSV: aktuell unklar. Mögliche Lösung mit neuer Launch Typ + Launch Group (zuerst Experiment durchführen, dann Ergebnisse exportieren).

* Dockerfile definieren:
    * lädt einen bestimmten Palladio-Drop herunter, s.o.
    * Run-Configuration + Artefakte kann man von außen in den Container geben, z.B. per ADD

* Schritte:
    * Docker-Image
    * Nightly Aggregator-Seite hineininstallieren (p2 Direktor)
    * Example von Experiment-Automation zum Laufen bekommen [5]

## Errors
```docker
Cannot complete the install because one or more required items could not be found.
        Software being installed: Palladio Component Model - Sirius Editors 4.2.0.201911190149 (org.palladiosimulator.editors.sirius.feature.feature.group 4.2.0.201911190149)
        Missing requirement: MDSD Jobs for Palladio Workflow Engine 4.2.0.201911190033 (de.uka.ipd.sdq.workflow.mdsd 4.2.0.201911190033) requires 'osgi.bundle; org.eclipse.m2m.qvt.oml.runtime 2.0.0' but it could not be found
        Cannot satisfy dependency:
                From: Architectural Templates 4.2.0.201911190146 (org.palladiosimulator.architecturaltemplates.feature.feature.group 4.2.0.201911190146)
                To: org.eclipse.equinox.p2.iu; de.uka.ipd.sdq.workflow.mdsd 2.1.1
        Cannot satisfy dependency:
                From: Palladio Component Model - Sirius Editors 4.2.0.201911190149 (org.palladiosimulator.editors.sirius.feature.feature.group 4.2.0.201911190149)
                To: org.eclipse.equinox.p2.iu; org.palladiosimulator.architecturaltemplates.feature.feature.group 1.0.6
```

## TODO
- Spezieller Release von Palladio, nicht eine sich häufig verändernde
- 

## Docker-Befehle
```docker
RUN apt-get update && \ 
    apt-get install -y openjdk-11-jre-headless && \
    apt-get install wget -y && \
    apt-get install -y vim
```
- vim kann für das finale build entfernt werden, ist nur zur Dateibetrachtung drin
- ausprobieren, ob update notwendig ist

```docker
RUN wget http://ftp.fau.de/eclipse/technology/epp/downloads/release/2019-09/R/eclipse-java-2019-09-R-linux-gtk-x86_64.tar.gz
RUN cd usr && \
    tar xfz ../../eclipse-java-2019-09-R-linux-gtk-x86_64.tar.gz
```
- eclipse runterladen und im ordner usr extrahieren

```docker
RUN cd ./usr/eclipse/dropins &&\
    wget --recursive -nH --cut-dirs=2 \
    --no-parent https://updatesite.palladio-simulator.com/palladio-build-updatesite/nightly/
RUN rm ./usr/eclipse/dropins/p2.index && \
    rm ./usr/eclipse/dropins/index.html && \
    rm ./usr/eclipse/dropins/aggregate/features/index.html && \
    rm ./usr/eclipse/dropins/aggregate/plugins/index.html && \
    rm ./usr/eclipse/dropins/compositeArtifacts.jar && \
    rm ./usr/eclipse/dropins/content.jar && \
    rm ./usr/eclipse/dropins/aggregate/artifacts.jar
```
- palladio in den dropins ordner herunterladen und nicht benötigte Dateien entfernen
- die jars müssen entfernt werden, sonst handelt es sich bereits um ein p2-Repository, das nicht über den dropins folder eingelesen werden kann
- --cut-dirs=2, um die ordnerstruktur zu vereinfachen


## Versuche
```docker
 RUN ./usr/eclipse/eclipse -vm /usr/lib/jvm/java-11-openjdk-amd64/bin \
      -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication \
      -source https://updatesite.palladio-simulator.com/palladio-build-updatesite/nightly/ \
      -destination ./usr/eclipse/dropins && \
      ./usr/eclipse/eclipse -vm /usr/lib/jvm/java-11-openjdk-amd64/bin \
      -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication \
      -source https://updatesite.palladio-simulator.com/palladio-build-updatesite/nightly/ \
      -destination ./usr/eclipse/dropins
```
- mirror der repositories, hat ohne Ergebnis recht lang gearbeitet, hab ich dann abgebrochen

```docker
RUN ./eclipse/eclipse -application org.eclipse.equinox.p2.director \
    -repository https://updatesite.palladio-simulator.com/palladio-build-updatesite/nightly/ \
    # -installIU org.palladiosimulator.monitorrepository.feature.source.feature.group\
    -tag InitialState \
    -destination ./eclipse \
    -profile SDKProfile \
    -profileProperties org.eclipse.update.install.features=true \
    -bundlepool ./eclipse/plugins \
    -p2.os linux \
    -p2.ws gtk \
    -p2.arch x86 \
    -list
```
- p2 director, ergab verschiedene Probleme, unter anderem dependencies auf im repository vorhandene, aber noch nicht installierte packages, die nicht aufgelöst wurden

```docker
RUN ./usr/eclipse/eclipse -application org.eclipse.equinox.p2.director \
    -repository https://updatesite.palladio-simulator.com/palladio-build-updatesite/nightly/ \
    -list
```
- liste alle vorhandenen packages auf

## Quellen
[1] [p2 director](https://help.eclipse.org/kepler/index.jsp?topic=/org.eclipse.platform.doc.isv/guide/p2_director.html)\
[2] [Experiment automation (EA)](https://sdqweb.ipd.kit.edu/wiki/Palladio_Experiment_Automation)\
[3] [EA - Github](https://github.com/PalladioSimulator/Palladio-Addons-ExperimentAutomation)\
[4] [PCM](https://github.com/PalladioSimulator/Palladio-Bench-Product/blob/master/products/org.palladiosimulator.product/org.palladiosimulator.palladiobench.product)\
[5] [Experiment Application](https://github.com/PalladioSimulator/Palladio-Addons-ExperimentAutomation/blob/master/bundles/org.palladiosimulator.experimentautomation.application/src/org/palladiosimulator/experimentautomation/application/ExperimentApplication.java)\
[6] [PCM Nightly](https://updatesite.palladio-simulator.com/palladio-build-updatesite/nightly/)\
[7] [EA espresso - Github](https://github.com/PalladioSimulator/Palladio-Addons-ExperimentAutomation/tree/master/bundles/org.palladiosimulator.experimentautomation.examples.espresso)\
[8] [Docker-MavenXvfb](https://github.com/kit-sdq/Docker-MavenXvfb)\
[9] [UnsatisfiedLinkError](https://bugs.eclipse.org/bugs/show_bug.cgi?id=549244)\
[10] [mirror eclipse plugin sites](https://stackoverflow.com/questions/1371176/downloading-eclipse-plug-in-update-sites-for-offline-installation)\
[11] [Eclipse headless](https://gnu-mcu-eclipse.github.io/advanced/headless-builds/)\
[12] []()\
[13] []()\
[14] []()\
[15] []()\
[16] []()\