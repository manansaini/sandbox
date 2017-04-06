### What is a reverse proxy? Why would it be useful?



#### Forward proxy:
A forward proxy is usually a client side concept used for anonymity, to subvert censorship, and as a web accelerator.

A forward proxy provides proxy services to a client or a group of clients. When one of these clients makes a connection attempt to that file transfer server on the Internet, its requests have to pass through the forward proxy first. Depending on the forward proxy's settings, a request can be allowed or denied. If allowed, then the request is forwarded to the firewall and then to the server. From the point of view of the server, it is the proxy server that issued the request, not the client. So when the server responds, it addresses its response to the proxy.

#### Forward Proxies are good for:

    Content Filtering
    eMail security
    NAT’ing
    Compliance Reporting

#### Reverse Proxy:
A reverse proxy is mostly a server-side concept, and is usually used in the context of CDNs (content distribution networks) for caching static HTTP content. 

A reverse proxy accepts requests from external clients on behalf of servers stationed behind it. To the client in our example, it is the reverse proxy that is providing file transfer services. The client is oblivious to the file transfer servers behind the proxy, which are actually providing those services.

In effect, whereas a forward proxy hides the identities of clients, a reverse proxy hides the identities of servers.

#### Uses:

Caching:

    A server-side reverse proxy would be used in this context to cache static content, like images, CSS, and static HTML.

Load Balancing: 

    Reverse proxy servers also act as load balancers for the servers behind it. Load balancers play a crucial role in providing high availability to network services that receive large volumes of requests. When a reverse proxy performs load balancing, it distributes incoming requests to a cluster of servers, all providing the same kind of service.

SSL Offload/Acceleration:

    Another popular use of reverse proxies is for "transparent" HTTPS. Rather than load and setup every webserver with an SSL certificate, single a reverse proxy can sit in front of all the webservers, to encrypt and serve to clients over HTTPS. Usually, transparent HTTPS reverse proxy servers have dedicated hardware for SSL acceleration.

Authentication

Single Sign On


### Explain chroot, and why it would be useful in the context of a web server

### A static web page on one of your servers is not loading. Where would you look for more information?

### What would be the consequences of having two DHCP servers that don’t know about each other on the same subnet? What might the symptoms be?

### How does traceroute work? What is TTL?

### How many useable addresses are in a /25 subnet? /24? /30? What are some conceivable uses for a /30?

### What are some IP address ranges that are not routable on the public internet?

### What tools would you use to capture network traffic? What about analysis of the packet capture?

### Name some flags that can be set on TCP packets.

### How would you display only lines containing at least one number from a bunch of text files? What about only lines without uppercase letters? Upper or lowercase letters? Lines that start with H and end with Q?

### What text editor are you most comfortable with? Describe how you'd comment out everything from line 250 to the end of a ~500 line script

### What does the execute bit do on a directory?

### What does the setuid bit do? Setgid? Sticky?

### How would you locate all files under a particular directory that have been modified within the last three days?

### What's the difference between moving a file between directories that are on the same filesystem and moving it between directories that are on two different filesystems? (Bonus: How does the mv command tell the difference?)

### What are some different types of filesystem objects? (besides regular file?)

### Network filesystems in /etc/fstab are not mounting on boot. Once the system is up, they can be mounted with no error. What could the problem be?

