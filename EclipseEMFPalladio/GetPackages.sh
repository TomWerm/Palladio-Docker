/usr/bin/wget -O /usr/packages.xml 'https://raw.githubusercontent.com/PalladioSimulator/Palladio-Bench-Product/master/products/org.palladiosimulator.product/org.palladiosimulator.palladiobench.product' 
sed -n 's|<feature id="\(.*\).*|\1|p' /usr/packages.xml | tail -n +2 | sed 's/".*//' | xargs -n1 /usr/InstallFeature.sh
echo asdf