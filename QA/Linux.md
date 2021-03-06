Linux Interview Questions

### What is BASH?

BASH is short for Bourne Again SHell. It was written by Steve Bourne as a replacement to the original Bourne Shell (represented by /bin/sh). It combines all the features from the original version of Bourne Shell, plus additional functions to make it easier and more convenient to use. It has since been adapted as the default shell for most systems running Linux.

### What is Linux Kernel?

The Linux Kernel is a low-level systems software whose main role is to manage hardware resources for the user. It is also used to provide an interface for user-level interaction.

The kernel is the program that acts as a middle layer between software and hardware. When a program requires access to certain resources or processing power, the kernel is responsible for sending the correct signals to the CPU and managing all other running programs and services so that the resources are correctly allocated and no conflicts occur.

### What is the basic difference between BASH and DOS?

The key differences between the BASH and DOS console lies in 3 areas:

    – BASH commands are case sensitive while DOS commands are not;
    – under BASH, / character is a directory separator and acts as an escape character. Under DOS, / serves as a command argument delimiter and is the directory separator
    – DOS follows a convention in naming files, which is 8 character file name followed by a dot and 3 character for the extension. BASH follows no such convention.

### What is a swap space?

A swap space is a certain amount of space used by Linux to temporarily hold some programs that are running concurrently. This happens when RAM does not have enough memory to hold all programs that are executing.


### Explain the boot process of Linux System in details?

The following are the 6 high level stages of a typical Linux boot process:

#### 1. BIOS - BIOS stands for Basic Input/Output System

    Performs some system integrity checks.
    Searches, loads, and executes the boot loader program.
    It looks for boot loader in floppy, cd-rom, or hard drive. You can press a key (typically F12 of F2, but it depends on your system) during the BIOS startup to change the boot sequence.
    Once the boot loader program is detected and loaded into the memory, BIOS gives the control to it.
    So, in simple terms BIOS loads and executes the MBR boot loader.

#### 2. MBR - MBR stands for Master Boot Record.

    It is located in the 1st sector of the bootable disk. Typically /dev/hda, or /dev/sda
    MBR is less than 512 bytes in size. This has three components 1) primary boot loader info in 1st 446 bytes 2) partition table info in next 64 bytes 3) mbr validation check in last 2 bytes.
    It contains information about GRUB (or LILO in old systems).
    So, in simple terms MBR loads and executes the GRUB boot loader.

#### 3. GRUB - GRUB stands for Grand Unified Bootloader.

    If you have multiple kernel images installed on your system, you can choose which one to be executed.
    GRUB displays a splash screen, waits for few seconds, if you don’t enter anything, it loads the default kernel image as specified in the grub configuration file.
    GRUB has the knowledge of the filesystem (the older Linux loader LILO didn’t understand filesystem).
    Grub configuration file is /boot/grub/grub.conf (/etc/grub.conf is a link to this). The following is sample grub.conf of CentOS.
        #boot=/dev/sda
        default=0
        timeout=5
        splashimage=(hd0,0)/boot/grub/splash.xpm.gz
        hiddenmenu
        title CentOS (2.6.18-194.el5PAE)
                  root (hd0,0)
                  kernel /boot/vmlinuz-2.6.18-194.el5PAE ro root=LABEL=/
                  initrd /boot/initrd-2.6.18-194.el5PAE.img
        As you notice from the above info, it contains kernel and initrd image.
    So, in simple terms GRUB just loads and executes Kernel and initrd images.

#### 4. Kernel

    Mounts the root file system as specified in the “root=” in grub.conf
    Kernel executes the /sbin/init program
    Since init was the 1st program to be executed by Linux Kernel, it has the process id (PID) of 1. Do a ‘ps -ef | grep init’ and check the pid.
    initrd stands for Initial RAM Disk.
    initrd is used by kernel as temporary root file system until kernel is booted and the real root file system is mounted. It also contains necessary drivers compiled inside, which helps it to access the hard drive partitions, and other hardware.

#### 5. Init

    Looks at the /etc/inittab file to decide the Linux run level.
    Following are the available run levels
    0 – halt
    1 – Single user mode
    2 – Multiuser, without NFS
    3 – Full multiuser mode
    4 – unused
    5 – X11
    6 – reboot
    Init identifies the default initlevel from /etc/inittab and uses that to load all appropriate program.
    Execute ‘grep initdefault /etc/inittab’ on your system to identify the default run level
    If you want to get into trouble, you can set the default run level to 0 or 6. Since you know what 0 and 6 means, probably you might not do that.
    Typically you would set the default run level to either 3 or 5.

#### 6. Runlevel programs

    When the Linux system is booting up, you might see various services getting started. For example, it might say “starting sendmail …. OK”. Those are the runlevel programs, executed from the run level directory as defined by your run level.
    Depending on your default init level setting, the system will execute the programs from one of the following directories.
    Run level 0 – /etc/rc.d/rc0.d/
    Run level 1 – /etc/rc.d/rc1.d/
    Run level 2 – /etc/rc.d/rc2.d/
    Run level 3 – /etc/rc.d/rc3.d/
    Run level 4 – /etc/rc.d/rc4.d/
    Run level 5 – /etc/rc.d/rc5.d/
    Run level 6 – /etc/rc.d/rc6.d/
    Please note that there are also symbolic links available for these directory under /etc directly. So, /etc/rc0.d is linked to /etc/rc.d/rc0.d.
    Under the /etc/rc.d/rc*.d/ directories, you would see programs that start with S and K.
    Programs starts with S are used during startup. S for startup.
    Programs starts with K are used during shutdown. K for kill.
    There are numbers right next to S and K in the program names. Those are the sequence number in which the programs should be started or killed.
    For example, S12syslog is to start the syslog deamon, which has the sequence number of 12. S80sendmail is to start the sendmail daemon, which has the sequence number of 80. So, syslog program will be started before sendmail.

### What does nslookup do?
nslookup is a network administration command-line tool available for many computer operating systems for querying the Domain Name System (DNS) to obtain domain name or IP address mapping or for any other specific DNS record.

###  How do you display the top most process utilizing CPU process?

 ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head
 
###  How to check all open ports on a Linux machine and block the unused ports?
netstat  command can be used to find the status of ports, for eg:

netstat -latu

-l : listening
-a : all
-t : tcp
-u : udp

iptables can be used to block the port.

    To block incoming port:

    /sbin/iptables -A INPUT -p tcp --destination-port {PORT-NUMBER-HERE} -j DROP

    Block Outgoing Port:

    /sbin/iptables -A OUTPUT -p tcp --dport {PORT-NUMBER-HERE} -j DROP

### How do you change the permissions? How to create a file that’s read-only property?

chmod command is used to change the permission in Linux. In order to create read only file, file permission will be 0444, So command you can use:

chmod 444 < path to file/file name or directory >

### Explain SUDO in detail. What are its disadvantages?
Sudo stands for either "substitute user do" or "super user do". Using the su command to gain root privileges. You can even issue the command su - to effectively log in as the root (root's home becomes your home).  Now with sudo-based distributions you will most likely notice that you can not log in as a root user. All you can do is issue commands with the help of sudo to gain administrative privileges.
Sudo (su "do") allows a system administrator to give certain users (or groups of users) the ability to run some (or all) commands as root while logging all commands and arguments.

### What is the difference between UDP and TCP?
Both of these protocols are used to send data over the Internet or a local network. These two protocols are used for different types of data. TCP and UDP aren’t the only protocols that work on top of IP. However, they are the most widely used. The widely used term “TCP/IP” refers to TCP over IP. UDP over IP could just as well be referred to as “UDP/IP”, although this isn’t a common term.

e.g.: When you load a web page, your computer sends TCP packets to the web server’s address, asking it to send the web page to you.

TCP stands for Transmission Control Protocol. TCP guarantees the recipient will receive the packets in order by numbering them. The recipient sends messages back to the sender saying it received the messages. If the sender doesn’t get a correct response, it will resend the packets to ensure the recipient received them. Packets are also checked for errors. TCP is all about this reliability. so no data is lost or corrupted in transit. 

UDP stands for User Datagram Protocol. The UDP protocol works similarly to TCP, but it throws all the error-checking stuff out. All the back-and-forth communication and deliverability guarantees slow things down. The sender won’t wait to make sure the recipient received the packet — it will just continue sending the next packets. If you’re the recipient and you miss some UDP packets, too bad — you can’t ask for those packets again. There’s no guarantee you’re getting all the packets and there’s no way to ask for a packet again if you miss it, but losing all this overhead means the computers can communicate more quickly.

UDP is used when speed is desirable and error correction isn’t necessary. For example, UDP is frequently used for live broadcasts and online games.

### What are different levels of RAID and what level will you use for a web server and database server?

RAID stands for Redundant Array of Inexpensive (Independent) Disks. RAID is traditionally implemented in businesses and organizations where disk fault tolerance and optimized performance are must-haves, not luxuries.

popular RAID levels:

        RAID 0
        RAID 1
        RAID 5
        RAID 10 (also known as RAID 1+0)
        
#### RAID 0 : Blocks Stripped, No Mirror, No Parity

        Minimum 2 disks.
        Excellent performance ( as blocks are striped ).
        No redundancy ( no mirror, no parity ).
        Don’t use this for any critical system.


#### RAID 1: Blocks Mirrored, No Stripe, No parity

    Minimum 2 disks.
    Good performance ( no striping. no parity ).
    Excellent redundancy ( as blocks are mirrored ).

#### RAID 5: Blocks Striped, Distributed parity
    
    Minimum 3 disks.
    Good performance ( as blocks are striped ).
    Good redundancy ( distributed parity ).
    Best cost effective option providing both performance and redundancy. Use this for DB that is heavily read oriented. Write operations will be slow.


#### RAID 6: Blocks Striped, Distributed DOUBLE parity
     
     Increased redundancy of Raid 5, Two disks can be failed.
     Minimum 4 disks.


#### RAID 10: Blocks Mirroed, Blocks Striped

    Minimum 4 disks.
    This is also called as “stripe of mirrors”
    Excellent redundancy ( as blocks are mirrored )
    Excellent performance ( as blocks are striped )
    If you can afford the dollar, this is the BEST option for any mission critical applications (especially databases).


### How can you find out how much memory Linux is using?

From a command shell, use the “concatenate” command: cat /proc/meminfo for 

### What is typical size for a swap partition under a Linux system?

The preferred size for a swap partition is twice the amount of physical memory available on the system. If this is not possible, then the minimum size should be the same as the amount of memory installed.


### What is the maximum length for a filename under Linux?

Any filename can have a maximum of 255 characters. This limit does not include the path name, so therefore the entire pathname and filename could well exceed 255 characters.


### What are filenames that are preceded by a dot?

In general, filenames that are preceded by a dot are hidden files. These files can be configuration files that hold important data or setup info. Setting these files as hidden makes it less likely to be accidentally deleted.

### What does a nameless directory represent in a Linux system?
This empty directory name serves as the nameless base of the Linux file system. This serves as an attachment for all other directories, files, drives and devices.


### A UNIX fie system has been reported at 100% full. You log in and clear what appears to be the offending file. However, the file system still reports to be 100% full. What could cause this?

The file that you cleared was still open by the calling application. The file handle was still in use and the file system was not recognizing that the space had been released.


### How will you troubleshoot an issue like when the application is down or unreachable?

Smoke test the application, then tail the webserver and application server logs. - Then investigate the issue based on the logs. - Find the root cause of why the application was down, what caused it. - Take steps to make sure this issue doesn't re-occur again.

### User has lost root password, how do you reset?


"init 1" doesn't always work, if you're not already root some systems will ask you for root password, and if you're not logged into the system ? What always works is to boot of a live CD, mount the file system with /etc, edit the /etc/passwd, /etc/shadow file.

Another easy way to do this is to single the box in run-level 1 then use the standard passwd tools to update the hash. That's far simpler than using a live cd and editing the shadow file. 

### What is a zombie process? State its causes?

A zombie process or defunct process is a process that has completed execution (via the exit system call) but still has an entry in the process table: it is a process in the "Terminated state".

When the process that created the zombies ends, init inherits the zombie processes and becomes their new parent. (init is the first process started on Linux at boot and is assigned PID 1.) init periodically executes the wait() system call to clean up its zombie children, so init will make short work of the zombies.

Zombie processes are when a parent starts a child process and the child process ends, but the parent doesn't pick up the child's exit code. The process object has to stay around until this happens - it consumes no resources and is dead, but it still exists - hence, 'zombie'.


### How to change the default run level in a Linux system?

During the boot process the init command opens the /etc/inittab file to decide what "runlevel" the system should be booted to. The /etc/inittab file is a plain text file that can be opened with text editor. The relavent section of a sample /etc/inittab file is as follows:

    # Default runlevel. The runlevels used by RHS are:
    #   0 - halt (Do NOT set initdefault to this)
    #   1 - Single user mode
    #   2 - Multiuser, without NFS (The same as 3, if you do not have networking)
    #   3 - Full multiuser mode
    #   4 - unused
    #   5 - X11
    #   6 - reboot (Do NOT set initdefault to this)
    #
    id:3:initdefault:

The key line in the example above is:

id:3:initdefault:

This tells the init process that the default run level for the system is run level 3. To change to a different run level simply change the number and save the /etc/inittab file. Before doing this, however, be absolutely sure you know which run level you want. 

### What is difference between Telnet and SSH?

SSH is a network protocol used to remotely access and manage a device. The key difference between Telnet and SSH is that SSH uses encryption, which means that all data transmitted over a network is secure from eavesdropping. Like Telnet, a user accessing a remote device must have an SSH client installed.

Telnet uses port 23 and SSH uses port 22



### What is the difference between df and du ?

du                   (1)  - estimate file space usage

df                   (1)  - report file system disk space usage

du == Disk Usage. It walks through directory tree and counts the sum size of all files therein. It may not output exact information due to the possibility of unreadable files, hardlinks in directory tree, etc. It will show information about the specific directory requested. Think, "How much disk space is being used by these files?"

df == Disk Free:  reports the space used by the file system. Looks at disk used blocks directly in filesystem metadata. Because of this it returns much faster that du but can only show info about the entire disk/partition. Think, "How much free disk space do I have?"


### What is a forward and reverse proxy? Why would it be useful?



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



### 

### 

### 

### 

### 

### 


### 

### 

### 

### 

### 

### 

### 

### 

