# Docker Image cheloide/wls1036

Docker image with a Weblogic Server 10.3.6 Running and a Domain with standard ports.

Required Files (links provided)
------

1. [WebLogic Server 11gR1 (10.3.6) generic installer(For 64-bit JVM)](http://download.oracle.com/otn/nt/middleware/11g/wls/1036/wls1036_generic.jar)
1. [Java SE Development Kit 6u45](http://download.oracle.com/otn/java/jdk/6u45-b06/jdk-6u45-linux-x64.bin)

Since you're downloading the files from oracle servers you'll need an Oracle Account.

Initial Setup
------

Put the files `wls1036_generic.jar`  and `dk-6u45-linux-x64.bin` you previously downloaded inside the assets assets directory.


Build and Run
------

To build the image just run

```
docker build -t cheloide/wls1036 /path/to/Dockerfile/folder/
```

To run the image run 
```
docker run -t cheloide/wls1036
```

To build the image run:
```
docker build -t cheloide/wls1036 -p 7001:7001 -p 7002:7002 -p 8001:8001 -p 5556:5556
```
the previous command have the default ports for the weblogic server 10.3.6 set up


Aditional Information
------

#### The default credentials are:
```
Domain Name: base_domain
Username: weblogic
password:welcome1
```

you can change the defaults by modifying the file `/assets/wlsdomain.py`, [this document](https://docs.oracle.com/middleware/1221/wls/WLSTG/domains.htm#WLSTG157)  has all the needed information to customize your domain, just remember to edit the DOMAIN_PATH variable on `assets/entrypoint.sh`.

#### List of exposed Ports

- **22** SSH
- **7001** Oracle WebLogic Server Listen Port for Administration Server
- **7002** Oracle WebLogic Server SSL Listen Port for Administration Server
- **8001** Oracle WebLogic Server Listen Port for Managed Server
- **5556** Oracle WebLogic Server Node Manager Port
