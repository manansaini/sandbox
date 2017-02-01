<b>1) Explain what is Jasper?</b>

    Jasper is a Tomcat’s JSP engine
    It parses JSP files to compile them into JAVA code as servlets
    At runtime, Jasper allows to automatically detect JSP file changes and recompile them

<b>2) Mention what is the output of select * from tab?</b>

It displays the default tables in the database

<b>3) Explain how you can configure Tomcat to work with IIS and NTLM?</b>

You have to follow the standard instructions for when the isapi_redirector.dll

Configure IIS to use “integrated windows security”

Ensure that in the server.xml you have disable tomcat authentication

<Connector port = “8009” enableLooksup = “false” redirect port = “8443” protocol = “AJP/1.3” tomcatAuthentication = “false” />

<b>4) Explain when you can use . and when you can use []?</b>

If you are running a bean property, use the .operator, and if you are executing a map value or an array index, it is preferred to use the [] operator. Although you can use these operators interchangeably.

<b>5) Mention what is the default port for Tomcat?</b>

The default port for Tomcat is 8080.  After initialising Tomcat on your local machine, you can verify if Tomcat is running the URL: http://localhost:8080

home-oss-logos-tomcat

<b>6) Mention what are the connectors used in Tomcat?</b>

In Tomcat, two types of connectors are used

    HTTP Connectors: It has many attributes that can be changed to determine exactly how it works and access functions such as redirects and proxy forwarding
    AJP Connectors: It works in the same manner as HTTP connectors, but they practice the AJP protocol in place of HTTP. AJP connectors are commonly implemented in Tomcat through the plug-in technology mod_jk.

<b>7) Mention what are the Catalina’s Configuration files?</b>

Catalina consists of configuration files are

    policy
    properties
    properties
    xml
    xml
    Tomcat-users.xml
    xml

<b>8) Explain how running Tomcat as a windows service provides benefits?</b>

Running Tomcat as a windows service provides benefits like

    Automatic startup: It is crucial for environment where you may want to remotely re-start a system after maintenance
    Server startup without active user login: Tomcat is run oftenly on blade servers that may not even have an active monitor attached to them. Windows services can be started without an active user
    Security: Tomcat under window service enables you to run it under a special system account, which is protected from the rest of the user accounts

<b>9) Explain when to use SSL with Tomcat?</b>

You would use Tomcat to handle connection, when you are running Tomcat as a stand-alone web server.

<b>10) Explain how you can deploy a web application using WAR files?</b>

JSPs, servlets, and their supporting files are placed in the proper subdirectories under the web apps directory in Tomcat.  You can make all the files under the web apps directory into one compressed file, which ends with .war file extension.  You can execute a web application by placing a WAR file in the webapps directory.  When a web server starts executing, it pulls out the WAR file’s contents into the appropriate webapps sub-directories.

<b>11) Explain what is Tomcat Valve?</b>

A tomcat valve- a new technology is introduced with Tomcat 4 which enables you to link an instance of a Java class with a specific Catalina container.

<b>12) Mention with how many valves does Tomcat configured with?</b>

Four types of valves Tomcat is configured with

    Access Log
    Remote Address Filter
    Remote Host Filter
    Request Dumper

<b>13) Explain how servlet life cycles?</b>

The life-cycle of a typical servlet running on Tomcat

    Tom-cat receives a request from a client through one of its connectors
    For processing, this request Tomcat maps this request to appropriate
    Once the request has been directed to the appropriate servlet, Tomcat verifies that servlet class has been loaded. If it is not than Tomcat wraps the servlet into Java Bytecode, that is executable by the JVM and forms an instance of the servlet
    Tomcat initiates the servlet by calling its init The servlet contains code that is able to screen Tomcat configuration files and act accordingly, as well as declare any resources it might require
    Once the servlet has been started, Tomcat can call the servlet’s service method to proceed the request
    Tomcat and the servlet can co-ordinate or communicate through the use of listener classes during the servlet’s lifecycle, which tracks the servlet for a variety of state changes.
    To remove the servlet, Tomcat calls the servlets destroy method.

<b>14) Explain what is the purpose of NAT protocol?</b>

The purpose of NAT protocol is to hide private IP address from public IP address and give a certain level of security to the organization.

<b>15) Explain what does the MAC stands for?</b>

MAC means Medium Access Control

<b>16) Explain what is Tomcat Coyote?</b>

Tom coyote is an HTTP connector based on HTTP/ 1.1 specification which receives and transport web requests to the Tomcat engine by listening to a TCP/IP port and sent request back to the requesting client.
