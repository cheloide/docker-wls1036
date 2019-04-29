#!/bin/bash

#Set up java
mkdir -p /opt/java
chmod +x /assets/jdk-6u45-linux-x64.bin
cd /opt/java && /assets/jdk-6u45-linux-x64.bin

#set up user oracle
adduser --disabled-password --gecos "" --shell /bin/bash oracle
mkdir -p /opt/oracle/
chown -R oracle /opt/oracle/
mv /assets/entrypoint.sh /entrypoint.sh

chown oracle /assets/install.sh
chown oracle /entrypoint.sh
chmod u+x /entrypoint.sh
chmod u+x /assets/install.sh