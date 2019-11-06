FROM ubuntu:20.04
RUN apt-get update && \ 
    apt-get install -y openjdk-11-jre-headless && \
    apt-get install wget -y
RUN wget http://ftp.fau.de/eclipse/technology/epp/downloads/release/2019-09/R/eclipse-java-2019-09-R-linux-gtk-x86_64.tar.gz && \
    tar xfz eclipse-java-2019-09-R-linux-gtk-x86_64.tar.gz
RUN apt-get install -y libgtk-3-dev
RUN apt-get install -y vim
RUN ./eclipse/eclipse -application org.eclipse.equinox.p2.director \
    -repository https://updatesite.palladio-simulator.com/palladio-build-updatesite/nightly/ \
    -installIU org.palladiosimulator.product.feature \
    -tag InitialState \
    -destination ./eclipse \
    -profile SDKProfile \
    -profileProperties org.eclipse.update.install.features=true \
    -bundlepool ./eclipse \
    -p2.os linux \
    -p2.ws gtk \
    -p2.arch x86 \
    -roaming
