# Frage
## Ideen
    - Soll eher die Moeglichkeit gegeben werden ein git repo anzugeben oder
    - Dateien vom lokalen Rechner ins Image kopieren

- Was genau soll alles im Run des docker containers sein und was
- im build? wenn dateien hinzugefuegt werden sollen?

# Probleme
## P2 Director
- es gibt keine installAll Operation - einzeln installieren
- hat Palladio ein Paket mit allen Features? - nein
- p2 scheint die Referenzen nicht vernünftig aufzulösen - mit der Eclipse Update Site gehts
## Eclipse
![](choices.png)
## Idee
- nutzen des dropins folders stattdessen
- Installation scheint grundsätzlich zu funktionieren
- features.txt keine csv, da "," als Trennzeichen beim import, stattdessen % (nicht teil einer validen url) [12]

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
- gefixed mit der eclipse update site
```docker
The installable unit org.palladiosimulator.product.feature.feature.group has not been found.
```
- installing org.palladiosimulator.product.feature.feature.group
- kp

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
ADD InstallEclipse.sh /usr/InstallEclipse.sh
RUN /usr/InstallEclipse.sh
ADD GetPackages.sh /usr/GetPackages.sh
ADD InstallFeature.sh /usr/InstallFeature.sh
RUN /usr/GetPackages.sh
```
- added die skripte, lädt eclipse runter und entpackt es im Ordner usr
- holt die features von [4] und installiert sie mit dem InstallFeature skript im eclipse
- dauert etwas lang ~5min

```docker
 RUN ./eclipse/eclipse -application org.eclipse.cdt.managedbuilder.core.headlessbuild
 org.palladiosimulator.product.feature.group
 /usr/lib/jvm/java-11-openjdk-amd64/bin/java
 http://download.eclipse.org/eclipse/updates/4.13 
 https://www.eclipse.org/downloads/download.php?file=/equinox/drops/R-4.13-201909161045/equinox-SDK-4.13.zip&mirror_id=1190
```
- headless build

## Versuche

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
[12] [Valid URL](https://stackoverflow.com/questions/1547899/which-characters-make-a-url-invalid)\
[13] []()\
[14] []()\
[15] []()\
[16] []()\