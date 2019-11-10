FROM ubuntu:20.04
RUN apt-get update && \ 
    apt-get install -y openjdk-11-jre-headless && \
    apt-get install wget -y && \
    apt-get install -y vim
RUN wget http://ftp.fau.de/eclipse/technology/epp/downloads/release/2019-09/R/eclipse-java-2019-09-R-linux-gtk-x86_64.tar.gz
RUN cd usr && \
    tar xfz ../../eclipse-java-2019-09-R-linux-gtk-x86_64.tar.gz
RUN ./usr/eclipse/eclipse -vm /usr/lib/jvm/java-11-openjdk-amd64/bin \
    -application org.eclipse.equinox.p2.director \
   -repository https://updatesite.palladio-simulator.com/palladio-build-updatesite/nightly/ \
#    -installIU org.palladiosimulator.editors.commons.feature.group \
   -tag PalladioNightly \
   -destination ./usr/eclipse/ \
   -profile SDKProfile \
   -list
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

# RUN ./eclipse/eclipse -application org.eclipse.cdt.managedbuilder.core.headlessbuild
# org.palladiosimulator.product.feature.group
# /usr/lib/jvm/java-11-openjdk-amd64/bin/java