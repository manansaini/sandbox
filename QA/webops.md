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


### Explain chroot, and why it would be useful in the context of a web server?

A chroot on Unix operating systems is an operation that changes the apparent root directory for the current running process and its children. A program that is run in such a modified environment cannot normally access files outside the designated directory tree.

When you make this system call, you basically change the "root" of your process, where root in this context is the root of the file system. If you have a typical file system layout and you call chroot("/tmp"), your / (the root of the file system) is now really /tmp/. This comes with a number of potential issues as your process now cannot see any binaries or libraries. It would only see what is in /tmp/ as being the new file system root. 

#### Uses:

1. A chroot environment can be used to create and host a separate virtualized copy of the software system.
2. Testing and development : A test environment can be set up in the chroot for software that would otherwise be too risky to deploy on a production system.
3. Dependency control : Software can be developed, built and tested in a chroot populated only with its expected dependencies. 
4. Recovery :Should a system be rendered unbootable, a chroot can be used to move back into the damaged environment after bootstrapping from an alternate root file system (such as from installation media.



### A static web page on one of your servers is not loading. Where would you look for more information?

Apache webserver is used to host static web pages. Need to check if Apache webserver is running fine.

### What would be the consequences of having two DHCP servers that don’t know about each other on the same subnet? What might the symptoms be?

Multiple DHCP servers can be used in the same network either: split scope or DHCP Failover cluster 

If scope is same, Ip conflict will happen, multiple devices may get same IP assigned and windows might display the message of IP conflict that such IP has already been assigned.

### How does traceroute work? What is TTL?

In Linux, traceroute by default sends a sequence of User Datagram Protocol (UDP) packets addressed to a destination host; ICMP Echo Request or TCP SYN packets can also be used. In Windows, traceroute sends ICMP echo requests instead of UDP packets.

Traceroute works by sending packets with gradually increasing TTL value, starting with TTL value of one. The first router receives the packet, decrements the TTL value and drops the packet because it then has TTL value zero. The router sends an ICMP Time Exceeded message back to the source. The next set of packets are given a TTL value of two, so the first router forwards the packets, but the second router drops them and replies with ICMP Time Exceeded. Proceeding in this way, traceroute uses the returned ICMP Time Exceeded messages to build a list of routers that packets traverse, until the destination is reached and returns an ICMP Echo Reply message.

The timestamp values returned for each router along the path are the delay (latency) values, typically measured in milliseconds for each packet.

Each IP packet that you send on the internet has got a field called as TTL. TTL stands for Time To Live. TTL is not measured by the no of seconds but the no of hops. Its the maximum number of hops that a packet can travel through across the internet, before its discarded.

If the destination is not found after traveling through too many routers in between ( hops ) and TTL value becomes 0 (which means no further travel) the receiving router will drop the packet and informs the original sender.

### How many useable addresses are in a /25 subnet? /24? /30? What are some conceivable uses for a /30?

    Subnet Addresses	Hosts
    /30	4	2
    /25	128	126	
    /24	256	254


Uses of /30 applies to a point to point network connection. For example completely applies to a point to point private network leased line (not on the Internet).

### What are some IP address ranges that are not routable on the public internet?



    10.0.0.0/8 IP addresses: 10.0.0.0 -- 10.255.255.255
    172.16.0.0/12 IP addresses: 172.16.0.0 -- 172.31.255.255
    192.168.0.0/16 IP addresses: 192.168.0.0 – 192.168.255.255


### What tools would you use to capture network traffic? What about analysis of the packet capture?

Wireshark - All in one

Cain and Abel - Packet sniffer

tcpdump - network sniffer


### Name some flags that can be set on TCP packets.

    SYN - Initiates a connection
    ACK - Acknowledges received data
    FIN - Closes a connection
    RST - Aborts a connection in response to an error
    PSH (push) 
    URG (urgent)

### How would you display only lines containing at least one number from a bunch of text files? 

### What about only lines without uppercase letters? Upper or lowercase letters? 

grep is a great way to find phrases, words, and characters in text.  One of the biggest stumbling blocks is case – is the word “Hello”, “hello”, “HELLO”, or even “HeLLo”?  All of these are different, and a “grep “Hello”” would only find lines containing the first “Hello” example.

You can, however, exclude case from a grep to make it not case sensitive – simply add -i:

    grep -i “Hello” textfile.txt

Alternatively, you could use it in conjunction with cat and tac (Reverse Cat)

    cat textfile.txt | grep -i “Hello”
    
### Lines that start with H and end with Q?

    grep '^a.*e$' file

### What text editor are you most comfortable with? Describe how you'd comment out everything from line 250 to the end of a ~500 line script

To comment out blocks in vim:

    press Esc (to leave editing or other mode)
    hit ctrl + v (visual block mode)
    use the up/down arrow keys to select lines you want (it won't highlight everything - it's OK!)
    Shift + i (capital I)
    insert the text you want, i.e. '#'
    press Esc.

### What does the execute bit do on a directory?

Read bit = If set, you can read this list. So, for example, if you have a directory named poems:

    You can ls poems and you'll get a list of items living within (-l won't reveal any details!).
    You can use command-line completion i.e. touch poems/so <TAB> poems/somefile.
    You cannot make poems your working directory (i.e. cd into it).

Write bit = If set, you can modify this list i.e. you can {add,rename,delete} names on it. But! You can actually do it only if the execute bit is set too.

Execute bit = Make this directory your working directory i.e. cd into it. You need this permission if you want to:

    access (read, write, execute) items living within.
    modify the list itself i.e. add, rename, delete names on it (of course the write bit must be set on the directory).


### What does the setuid bit do? Setgid? Sticky?

Set-user Identification (SUID): When a command or script with SUID bit set is run, its effective UID becomes that of the owner of the file, rather than of the user who is running it.
        
        # chmod 4555 [path_to_file]
        
Set-group identification (SGID): SGID permission on executable file – SGID permission is similar to the SUID permission, only difference is – when the script or command with SGID on is run, it runs as if it were a member of the same group in which the file is a member.

    # chmod 2555 [path_to_file]
    
Sticky Bit: The sticky bit is primarily used on shared directories. Users can create files, read and execute files owned by other users, but are not allowed to remove files owned by other users. It is useful for shared directories such as /var/tmp and /tmp.
 
 – root user (Off course!) and owner of the files can remove their own files.

### How would you locate all files under a particular directory that have been modified within the last three days?

cd /path_to_dir
find -mtime -3

### What's the difference between moving a file between directories that are on the same filesystem and moving it between directories that are on two different filesystems? (Bonus: How does the mv command tell the difference?)

When using the mv command on files located on the same filesystem, the file's timestamp is not updated.


### What are some different types of filesystem objects? (besides regular file?)

Drive
file
folder
textstream

### Network filesystems in /etc/fstab are not mounting on boot. Once the system is up, they can be mounted with no error. What could the problem be?

Remote nodes tried to mount their home directories before the partition on the master node was finished mounting, causing the remote nodes to hang.

Running all the scripts under /etc/rc.d is the last step of successful booting a Linux OS.
As per the 5th step /etc/inittab file is executed which tells the OS to boot into a particular level as defined in the config file.

        #   2 - Multiuser, without NFS (The same as 3, if you do not have networking)
        #   3 - Full multiuser mode
        
If Linux machine will boot into runlevel 3. So in the next and last step the OS will execute all the scripts stored under /etc/rc3.d where rc3.d is used for runlevel 3.

As you see all the scripts are nothing but a softlink pointing to their original scripts in some other directory.All the scripts are either starting with S or K, Here S means start and K means Kill. The numerical value specifies the order in which the script will be executed.

S20eventlogd will be executed before S21lsassd when the OS boots similarly K10psacct will be executed before K15httpd when the system starts to shut down.

----------------------------------------------------------

My servers boot into runlevel 3. Turns out if you look in /etc/rc3.d on CentOS 5, you'll probably see some files called:

K75netfs
S10network

K75netfs takes care of mounting network volumes, and S10network takes care of bringing up network interfaces.

