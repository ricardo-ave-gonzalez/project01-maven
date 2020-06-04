(Example Project) Project Maven carried out in Educacion It, professor Carlos Rios
=========================================

The demonstration project includes a single module Maven project with example POM and source code. The POM is 
configured to build both an executable JPS, a web bundle.

To demonstrate some Maven practices and benefits, the source code also includes style sheet, 
images, and makes use of some third-party dependencies. These 
are all optional additions and included just to get you started. You can delete these references and add your own 
as needed. 


Setting up
=========================================

Please refer to the 'Before you start' section of the Maven Plugin documentation: 


Get the Example Code
=========================================

Download a ZIP of the source code (hit the "ZIP" button above) and extract anywhere on your local directory.


Build the Project 
=========================================

Note that Maven will download a lot of third-party dependencies the first time it runs (meaning you don't have to). The first
run can be slow but subsequent runs will be much faster. If you are new to Maven, see 
http://maven.apache.org/guides/getting-started/maven-in-five-minutes.html

https://mvnrepository.com/

Once this command completes successfully you will find an executable JAR at: 
```
    {Proyecto.Web.Cursos.Alumnos.con.Maven}/target/Clase10-1.0-SNAPSHOT/Cursos.jsp
```

The exact format of the native bundle will depend on the OS you ran your build on i.e. if you built on Windows an MSI
will have been created, if you built on Mac a RPM should be there). These bundles can be distributed as normal for that
platform. 

Note: currently it is not possible to build installers for other platforms than your current one so you have to run this
build once on each platform you are targeting. 

Make your own changes 
=========================================

To edit the source code you can just open the POM file (i.e. pom.xml) in the base directory of the project in most
popular IDEs. IntelliJ supports the POM file out of the box. In Eclipse there is good support for Maven but you may
have to install the plugin (I'm not sure).
In my case I use Netbeans 11.0 with dependency for MySQL Connector / J »5.1.49

<! - https://mvnrepository.com/artifact/mysql/mysql-connector-java ->
<dependency>
     <groupId> mysql </groupId>
     <artifactId> mysql-connector-java </artifactId>
     <version> 5.1.49 </version>
</dependency>

You free to take the example project and change it as much as you like. You can delete everything that is there and start
from scratch, or you can add to what's there.


Problems and Support
=========================================

This example project is distributed as is with no warranty or promise of support. 


Licence
=========================================


Ricardo.ave.gonzalez@gmail.com


