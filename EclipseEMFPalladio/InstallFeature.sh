echo installing "$1"
/usr/eclipse/eclipse \
    -application org.eclipse.equinox.p2.director \
    -repository https://download.eclipse.org/releases/2019-09/,"$2" \
    -installIU "$1".feature.group