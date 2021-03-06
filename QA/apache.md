#Apache
<b>1. How to stop/start Apache Web Server?</b>

You can restart by going to Apache instance location >> bin folder and execute apachectl script.

./apachectl stop
./apachectl start

You may also use script located in /etc/init.d/. Mostly it will be named either “apache” or “httpd”

/etc/init.d/apache stop
/etc/init.d/apache start

Another procedure would be using services

httpd stop
service httpd start

<b>2. What is the default port for HTTP and HTTPS?</b>

The default port for HTTP is 80 and HTTPS 443. Checkout default ports for other applications listed here.

<b>3. Can you tell me the important configuration file name?</b>

httpd.conf is the main configuration file used in Apache.

<b>4. How to check the version of running Apache Web Server?</b>

There is multiple ways to find this but more accurately would be;

    Login to web server
    Go to apache instance and bin folder
    Executed httpd with -v to get the version details.

[root@lab sbin]# ./httpd -v
Server version: Apache/2.2.15 (Unix)
Server built:   Jul 18 2016 15:24:00
[root@lab sbin]#

Alternatively, you can also use the rpm command to check the installed version.

[root@lab ~]# rpm -qa |grep httpd
httpd-2.2.15-54.el6.centos.x86_64
httpd-tools-2.2.15-54.el6.centos.x86_64
[root@lab ~]#

<b>5. How to know if web server running?</b>

There are multiple ways to find this.

    Login to web server and grep for “httpd” process

ps -ef |grep httpd

    Check for any alert in your monitoring dashboard.
    Check if your apache IP:port is accessible in the browser

Ex: http://yourapacheserver.com

    Check if configured IP and port is listening on the server with netstat

netstat -anlp |grep 80

<b>6. How to install Apache web server?</b>

There are three possible ways to get this installed.

    Using source code – you can download the source and compile it.
    YUM repository – if your server is connected to the Internet or have internal repository then you can use yum to install it.

yum install httpd

    RPM – You can download the necessary RPM package and use rpm command.

rpm -ivh packagename.rpm

<b>7. How to ensure Apache listen on only one IP address on the server?</b>

This is often needed when you have multiple IPs on the server. In order to ensure Apache listen only on specified IP then you need to explicitly mention IP and port in Listen directive.

Ex:

Listen 10.10.10.10:80

<b>8. How to ensure Apache process run with non-root/nobody user?</b>

This is doable by adding User & Group directive in httpd.conf file

User apache
Group apache

Above configuration example will ensure it starts with “apache” user. You must ensure user exist on the server before configuring it.

<b>9. How do I disable directory indexing?</b>

You can use “Options -Indexes” in respective directory directive.

Ex:

<Directory />
       Options -Indexes
</Directory>

<b>10. Which module is required to have redirection possible?</b>

mod_rewrite is responsible for the redirection and this must be uncommented in httpd.conf file.

LoadModule rewrite_module modules/mod_rewrite.so

<b>11. Can you change the listening port from default to something else?</b>

Yes, it’s possible by specifying the port number in Listen directive.

For ex: to make Apache listen on 9000 port to 10.10.10.10 IP address.

Listen 10.10.10.10:9000

<b>12. How to secure Website hosted on Apache Web Server?</b>

There are multiple ways to secure the Apache web server including the following.

    Implementing SSL
    Integrating with WAF (Web Application Firewall) like ModSecurity, etc.
    Using cloud-based security provider

<b>13. What are the log files generated by Apache?</b>

There are two popular log files created;

    access.log – all request details with the status code
    error.log – capture all the errors within apache or connecting in backend

<b>14. How to create a CSR?</b>

You can either use the following OpenSSL command or generate CSR online.

To create new CSR with private key

openssl req -out geekflare.csr -newkey rsa:2048 -nodes -keyout geekflare.key

Check out OpenSSL cheat sheet for more commands.

<b>15. What is Virtual Hosting?</b>

Virtual Hosting in Apache allows you to host multiple websites on a single instance. You can either create IP based or Name based in virtual hosting.

<b>16. What module is needed to connect to WebSphere?</b>

mod_was_ap22_http.so must be added in httpd.conf file to integrate with IBM WAS.

<b>17. How to put Log level in Debug mode?</b>

Often needed when you are troubleshooting the issue and wish to capture more details. You can change the logging level to debug by ensuring the following in httpd.conf file.

LogLevel debug

<b>18. Which module is required to enable SSL?</b>

The mod_ssl module must be uncommented prior to SSL implementation.

LoadModule auth_basic_module modules/mod_ssl.so

<b>19. What’s the WebLogic module name?</b>

mod_wl_22.so

<b>20. What are the log level available in Apache?</b>

The default configuration is set to “warn” however, the following is possible too.

    debug
    info
    warn
    notice
    crit
    alarm
    emerg
    error

<b>21. What is DocumentRoot?</b>

DocumentRoot directive is the configuration where you can specify the folder location from where the static files will be served. It’s also called as Web Root.

Default DocumentRoot location is /var/www/html

<b>22. How to deploy war or JAVA applications in Apache?</b>

I am afraid, Apache is a Web Server and Java based application deployment is not possible with it. However, you can integrate Java application server like WebLogic, WebSphere, JBoss where you can deploy war, ear files.

<b>23. What’s difference between Apache Web Server and Apache Tomcat?</b>

Apache Web is HTTP server to serve static contents where Tomcat is servlet container to deploy JSP files.

You can always integrate Apache HTTP with Tomcat, however, based on the requirement you need to choose either one. If you need proper web server then Apache HTTP else Tomcat for JSP-Servlet Container.

<b>24. How can Apache act a Proxy Server?</b>

You can use a mod_proxy module to use as a proxy server. The mod_proxy module can be used to connect to the backend server like Tomcat, WebLogic, WebSphere, etc.

<b>25. How to configure Apache log so it captures time taken to serve a request?</b>

You can add “%D” in httpd.conf file under LogFormat directive to capture the response time taken to serve the request. It will show time in microseconds.

LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %D" combined

Restart the apache web server and you can see the results.

182.19.197.23 - - [02/Oct/2016:10:32:25 +0000] "GET / HTTP/1.1" 403 4961 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36" 1515
182.19.197.23 - - [02/Oct/2016:10:32:25 +0000] "GET /icons/apache_pb.gif HTTP/1.1" 304 - "http://lab.geekflare.com/" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36" 424
182.19.197.23 - - [02/Oct/2016:10:32:25 +0000] "GET /icons/poweredby.png HTTP/1.1" 304 - "http://lab.geekflare.com/" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36" 472

<b>26. What tool do you use for log analysis?</b>

You got to speak the truth but to given you an idea you can use GoAccess, SumoLogic or few mentioned here.

<b>27. What are the Web Servers you’ve worked on along with Apache?</b>

Again, you better tell the truth but to make you aware there are many web servers in the market including the following.

    Nginx
    Microsoft IIS
    LiteSpeed
    GWS

<b>28. How to verify httpd.conf file to ensure no configuration syntax error?</b>

httpd –t will help you to verify the syntax.

[root@lab httpd]# /usr/sbin/httpd -t
Syntax OK
[root@lab httpd]#

Alternatively, you may use apachectl command as well.

[root@lab ~]# /usr/sbin/apachectl configtest
Syntax OK
[root@lab ~]#

<b>29. How to perform Apache performance benchmark?</b>

You can use a tool like ApacheBench, SIEGE to perform the load test on web servers including Apache. Another option to perform stress test online to see the overall how web application performs under load.

<b>30. How to get support for Apache Web Server if something wrong?</b>

Apache is an Open Source web server so there is no enterprise level support however, you can raise a bug report or ask a question on Stack Overflow.

<b>31. How to ensure web server is getting started after server reboot?</b>

If running Linux, then you can put a script in /etc/init.d/ and enable to start on boot using chkconfig command

Let’s say you create a file called apache and put under /etc/init.d

chkconfig --add apache

chkconfig apache on

if on Windows, then ensure startup type is selected “Automatic”

<b>32. what is a difference between Apache and Nginx web server?</b>

Both are categorized as a Web Server and here are some of the main differences.

    Nginx is event-based web server where Apache is process based
    Nginx is known for better performance than Apache
    Apache supports wide range of OS where Nginx doesn’t support OpenVMS and IBMi
    Apache has large number of modules integration with backend application server where Nginx is still catching up
    Nginx is lightweight and capturing the market share rapidly. If you are new to Nginx then you may be interested to check out my articles on Nginx.

<b>33. How would you kill the Apache process if graceful stop doesn’t work?</b>

If running on Linux, then can use kill command.

Find out the PID of Apache by using ps -ef |grep http

Then kill it

kill $PIDNUMBER

if normal kill doesn’t work then try kill -9

kill -9 $PIDNUMBER

if on Windows, then end the apache task from Task Manager.

<b>34. How to find httpd.conf file if you don’t know installation location?</b>

In Linux, you can use find command.

Let’s assume, you know it must be in /apps file system then you can use the following command.

find /apps -name httpd.conf

But if you are not sure on which file system then you can do find on / file system but keep it in mind it may take a long time based on the overall file system size.

find / -name httpd.conf

<b>35. What are the different flavor of Apache web server you know?</b>

    IBM HTTP Server – known as IHS and often used with IBM WebSphere Application Server
    Oracle HTTP Server- known as OHS often used with Oracle Weblogic server

<b>36. Where is Apache web server located in data center location?</b>

You can explain based on your experience, however, typically for Internet-facing applications it would be in Internet DMZ network and for intranet, core network.

But again this will differ based on application/organization.

<b>37. How to hide server version details in HTTP response header?</b>

Add the following in httpd.conf file and restart the web server

ServerTokens Prod
ServerSignature Off

This will hide the version and show Server as “Apache” Only.

<b>38. What does 200, 403 & 503 HTTP error code mean?</b>

    200 – content found and served OK
    403 – tried to access restricted file/folder
    503 – server is too busy to serve the request and in another word – service unavailable.
    Refer HTTP Response Code infographic for more.

<b>39. How to disable trace HTTP request?</b>

Add the following in httpd.conf file and restart the instance

TraceEnable off

<b>40. How to troubleshoot port conflict issue?</b>

netstat would be useful to troubleshoot the port conflict issue. If running multiple instances on a single server then it would be recommended to have absolute IP:Port configured in Listen directive.
