Download WebLogic Server 11gR1 (10.3.6) generic installer(For 64-bit JVM) from:
```
 http://download.oracle.com/otn/nt/middleware/11g/wls/1036/wls1036_generic.jar
```

Download Java SE Development Kit 6u45 from:
```
http://download.oracle.com/otn/java/jdk/6u45-b06/jdk-6u45-linux-x64.bin
```

Put both files inside assets directory

```cd``` to dockerfile directory

To build the image run:
```
docker build -t cheloide/docker-wls1036 .
```

Default credentials are:
```
Domain Name: base_domain
Username: weblogic
password:welcome1
```

