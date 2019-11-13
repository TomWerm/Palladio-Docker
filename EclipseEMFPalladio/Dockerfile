FROM ubuntu:20.04
RUN apt-get update && \ 
    apt-get install -y openjdk-11-jre-headless && \
    apt-get install wget -y && \
    apt-get install -y vim
RUN wget http://ftp.fau.de/eclipse/technology/epp/downloads/release/2019-09/R/eclipse-java-2019-09-R-linux-gtk-x86_64.tar.gz
RUN cd usr && \
    tar xfz ../../eclipse-java-2019-09-R-linux-gtk-x86_64.tar.gz
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
# RUN ./usr/eclipse/eclipse -vm /usr/lib/jvm/java-11-openjdk-amd64/bin
# COPY source dest
# RUN apt-get install -y libgtk-3-dev
# RUN ./usr/eclipse/eclipse -vm /usr/lib/jvm/java-11-openjdk-amd64/bin \
#      -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication \
#      -source https://updatesite.palladio-simulator.com/palladio-build-updatesite/nightly/ \
#      -destination ./usr/eclipse/dropins && \
#      ./usr/eclipse/eclipse -vm /usr/lib/jvm/java-11-openjdk-amd64/bin \
#      -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication \
#      -source https://updatesite.palladio-simulator.com/palladio-build-updatesite/nightly/ \
#      -destination ./usr/eclipse/dropins
# RUN ./eclipse/eclipse -application org.eclipse.equinox.p2.director \
#     -repository https://updatesite.palladio-simulator.com/palladio-build-updatesite/nightly/ \
#     # -installIU org.palladiosimulator.monitorrepository.feature.source.feature.group\
#     -tag InitialState \
#     -destination ./eclipse \
#     -profile SDKProfile \
#     -profileProperties org.eclipse.update.install.features=true \
#     -bundlepool ./eclipse/plugins \
#     -p2.os linux \
#     -p2.ws gtk \
#     -p2.arch x86 \
#     -list
# RUN ./usr/eclipse/eclipse -vm /usr/lib/jvm/java-11-openjdk-amd64/bin \
#     -application org.eclipse.equinox.p2.director \
#    -repository https://updatesite.palladio-simulator.com/palladio-build-updatesite/nightly/ \
#    -installIUs ALL

# RUN ./usr/eclipse/eclipse -application org.eclipse.equinox.p2.director \
#     -repository https://updatesite.palladio-simulator.com/palladio-build-updatesite/nightly/ \
#     -list

# RUN ./eclipse/eclipse -application org.eclipse.cdt.managedbuilder.core.headlessbuild
# org.palladiosimulator.product.feature.group
# /usr/lib/jvm/java-11-openjdk-amd64/bin/java
# http://download.eclipse.org/eclipse/updates/4.13 
# https://www.eclipse.org/downloads/download.php?file=/equinox/drops/R-4.13-201909161045/equinox-SDK-4.13.zip&mirror_id=1190