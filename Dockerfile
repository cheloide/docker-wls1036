FROM    debian:stable

ADD     assets /assets

#Setup
USER    root
RUN     chmod u+x /assets/setup.sh && /assets/setup.sh

#Install 
USER    oracle
RUN     /assets/install.sh

#Cleanup
USER    root
RUN     rm -rf /assets/

#SSH
EXPOSE  22
#Oracle WebLogic Server Listen Port for Administration Server
EXPOSE  7001
#Oracle WebLogic Server Listen Port for Administration Server SSL
EXPOSE  7002
#Oracle WebLogic Server Listen Port for Managed Server
EXPOSE  8001
#Oracle WebLogic Server Node Manager Port
EXPOSE  5556
#Oracle WebLogic Server SSL Listen Port for Administration Server
EXPOSE  7002

USER    oracle
ENTRYPOINT ["bash", "/entrypoint.sh"]