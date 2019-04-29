#!/bin/bash

#install WLS1036 Silently
/opt/java/jdk1.6.0_45/bin/java -jar /assets/wls1036_generic.jar -mode=silent -silent_xml=/assets/wlssilent.xml

#Set up domain
. /opt/oracle/wls1036/server/bin/setWLSEnv.sh && /opt/java/jdk1.6.0_45/bin/java weblogic.WLST /assets/wlsdomain.py