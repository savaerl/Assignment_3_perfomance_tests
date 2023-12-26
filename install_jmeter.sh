#!/bin/bash

# download and install Apache JMeter
curl -O  https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.6.2.zip

mkdir jmeter
unzip apache-jmeter-5.6.2.zip
mv apache-jmeter-5.6.2/* jmeter/
rm -rv apache-jmeter-5.6.2
rm -v apache-jmeter-5.6.2.zip

# download and install JMeter Plugins Manager
PLUGIN_MANAGER_JAR=./jmeter/lib/ext/jmeter-plugins-manager-1.6.jar
if [ -f "PLUGIN_MANAGER_JAR" ]; then
    echo "PLUGIN_MANAGER_JAR exists."
else
   echo "PLUGIN_MANAGER_JAR does not exists."
   curl -O https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/1.6/jmeter-plugins-manager-1.6.jar --output-dir ./jmeter/lib/ext/
fi
# download and install JMeter Plugins Manager Command Line and install jpgc-casutg plugin(Custom Thread Groups)
curl -O https://repo1.maven.org/maven2/kg/apc/cmdrunner/2.2.1/cmdrunner-2.2.1.jar --output-dir ./jmeter/lib/
java  -jar ./jmeter/lib/cmdrunner-2.2.1.jar --tool org.jmeterplugins.repository.PluginManagerCMD install jpgc-casutg
