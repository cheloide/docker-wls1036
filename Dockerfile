FROM debian:stable

ADD assets /assets

USER root

#Set up java
RUN mkdir -p /opt/java
RUN chmod +x /assets/jdk-6u45-linux-x64.bin
RUN cd /opt/java && /assets/jdk-6u45-linux-x64.bin

#set up user oracle
RUN adduser --disabled-password --gecos "" --shell /bin/bash oracle
RUN mkdir -p /opt/oracle/
RUN chown -R oracle /opt/oracle/

#install wls
USER oracle
RUN ls /opt/java/
RUN /opt/java/jdk1.6.0_45/bin/java -jar /assets/wls1036_generic.jar -mode=silent -silent_xml=/assets/wlssilent.xml

#create domain
RUN . /opt/oracle/wls1036/server/bin/setWLSEnv.sh && /opt/java/jdk1.6.0_45/bin/java weblogic.WLST /assets/wlsdomain.py

#SSH
EXPOSE 22
#Oracle WebLogic Server Listen Port for Administration Server
EXPOSE 7001
#Oracle WebLogic Server Listen Port for Managed Server
EXPOSE 8001
#Oracle WebLogic Server Node Manager Port
EXPOSE 5556
#Oracle WebLogic Server SSL Listen Port for Administration Server
EXPOSE 7002


CMD /opt/oracle/wls1036/user_projects/domains/base_domain/bin/startWebLogic.sh