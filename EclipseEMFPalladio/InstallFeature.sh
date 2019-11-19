echo installing "$1"
/usr/eclipse/eclipse \
 -application org.eclipse.equinox.p2.director \
 -repository https://updatesite.palladio-simulator.com/palladio-build-updatesite/nightly/,https://download.eclipse.org/releases/2019-09/ \
 -installIU "$1".feature.group	