echo installing "$1"
echo from server "$2"
/usr/eclipse/eclipse \
    -application org.eclipse.equinox.p2.director \
    -repository https://download.eclipse.org/releases/2019-09/,"$2" \
    -installIU "$1"