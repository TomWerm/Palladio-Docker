sed '1d;s/\([^,]*\),\([^,]*\)/ "\1" "\2"/' /usr/features.csv | xargs /usr/InstallFeature.sh