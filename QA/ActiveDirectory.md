## Active Directory Interview Questions & Answers

### What is Active Directory?
An active directory is a directory structure used on Microsoft Windows based servers and computers to store data and information about networks and domains. It stores objects like User, Computer, printer, Network information, It facilitate to manage your network effectively with multiple Domain Controllers in different location with AD database, able to manage/change AD from any Domain Controllers and this will be replicated to all other DC.

### What is Active Directory Domain Controller (DC)?
Domain Controller is the server which holds the AD database, All AD changes get replicated to other DC and vise vase
Mention what are the new features in Active Directory (AD) of Windows server 2012?

       •	dcpromo (Domain Controller Promoter) with improved wizard: It allows you to view all the steps and review the detailed results during the installation process
       •	Enhanced Administrative Center: Compared to the earlier version of active directory, the administrative center is well designed in Windows 2012. The exchange management console is well designed
       •	Recycle bin goes GUI: In windows server 12, there are now many ways to enable the active directory recycle bin through the GUI in the Active Directory Administrative Center, which was not possible with the earlier version
       •	Fine grained password policies (FGPP): In windows server 12 implementing FGPP is much easier compared to an earlier  It allows you to create different password policies in the same domain
       •	Windows Power Shell History Viewer: You can view the Windows PowerShell commands that relates to the actions you execute in the Active Directory Administrative Center UI
       
### Which is the default protocol used in directory services?
The default protocol used in directory services is LDAP (Lightweight Directory Access Protocol).
Explain the term FOREST in AD?
A forest is a complete instance of Active Directory. Each forest acts as a top-level container in that it houses all domain containers for that particular Active Directory instance. A forest can contain one or more domain container objects. Forest consists of multiple Domains trees. The Domain trees in a forest do not form a contiguous name space however share a common schema and global catalog (GC)
What is Tree?
Tree is a hierarchical arrangement of windows Domain that share a contiguous name space.
What is Domain?
An Active Directory domain is a collection of objects within a Microsoft Active Directory network. An object can be a single user or a group or it can be a hardware component, such as a computer or printer.
What is OU?
OU (Organizational Unit) are the container in Active Directory where you can put users, groups and computers. It is a similar concept of Namespaces in C#, where you can organize the related objects into one OU.
What is GPO?
GPO (Group Policy Object) is a set of rules which control the working environment of user accounts and computer accounts and an organizational unit is the smallest scope or unit to which you can assign Group Policy settings or delegate administrative authority.
What is Schema?
Active directory schema is the set of definitions that define the kinds of object and the type of information about those objects that can be stored in Active Directory
Active directory schema is Collection of object class and there attributes
Object Class = User
Attributes = first name, last name, email, and others
Explain what is SYSVOL?
The SysVOL folder keeps the server’s copy of the domain’s public files.  The contents such as users, group policy, etc. of the sysvol folders are replicated to all domain controllers in the domain.
What is the difference between domain admin groups and enterprise admins group in AD?
       Enterprise Admin Group             		Domain Admin Group
•	Members of this group have complete control of all domains in the forest
•	By default, this group belongs to the administrators group on all domain controllers in the forest
•	As such this group has full control of the forest, add users with caution	•	 Members of this group have complete control of the domain
•	By default, this group is a member of the administrators group on all domain controllers, workstations and member servers at the time they are linked to the domain
•	As such the group has full control in the domain, add users with caution
Explain where does the AD database is held? What other folders are related to AD?
AD database is saved in %systemroot%/ntds. In the same folder, you can also see other files; these are the main files controlling the AD structures they are
•	dit
•	log
•	res 1.log
•	log
•	chk
What is Kerberos?
Kerberos is an authentication protocol for network.  It is built to offer strong authentication for server/client applications by using secret-key cryptography.
What system state data contains?
System state data contains
•	Contains startup files
•	Registry
•	Com + Registration Database
•	Memory page file
•	System files
•	AD information
•	SYSVOL Folder
•	Cluster service information
Tel me about the FSMO roles?
•	Schema Master
•	Domain Naming Master
•	Infrastructure Master
•	RID Master
•	PDC
Schema Master and Domain Naming Master are forest wide role and only available one on each Forest, Other roles are Domain wide and one for each Domain
AD replication is multi master replication and change can be done in any Domain Controller and will get replicated to others Domain Controllers, except above file roles, this will be flexible single master operations (FSMO), these changes only be done on dedicated Domain Controller so it’s single master replication
How to check which server holds which role?
Netdom query FSMO
Which FSMO role is the most important? And why?
Interesting question which role is most important out of 5 FSMO roles or if one role fails that will impact the end-user immediately
Most armature administrators pick the Schema master role, not sure why maybe they though Schema is very critical to run the Active Directory
Correct answer is PDC, now the next question why? Will explain role by role what happens when a FSMO role holder fails to find the answer
Schema Master – Schema Master needed to update the Schema, we don’t update the schema daily right, when will update the Schema? While the time of operating system migration, installing new Exchange version and any other application which requires extending the schema
So if are Schema Master Server is not available, we can’t able to update the schema and no way this will going to affect the Active Directory operation and the end-user
Schema Master needs to be online and ready to make a schema change, we can plan and have more time to bring back the Schema Master Server
Domain Naming Master – Domain Naming Master required to creating a new Domain and creating an application partition, Like Schema Master we don’t create Domain and application partition frequently
So if are Domain Naming Master Server is not available, we can’t able to create a new Domain and application partition, it may not affect the user, user event didn’t aware Domain Naming Master Server is down
Infrastructure Master – Infrastructure Master updates the cross domain updates, what really updates between Domains? Whenever user login to Domain the TGT has been created with the list of access user got through group membership (user group membership details) it also contain the user membership details from trusted domain, Infrastructure Master keep this information up-to-date, it update reference information every 2 days by comparing its data with the Global Catalog (that’s why we don’t keep Infrastructure Master and GC in same server)
In a single Domain and single Forest environment there is no impact if the Infrastructure Master server is down
In a Multi Domain and Forest environment, there will be impact and we have enough time to fix the issue before it affect the end-user
RID Master –Every DC is initially issued 500 RID’s from RID Master Server.  RID’s are used to create a new object on Active Directory, all new objects are created with Security ID (SID) and RID is the last part of a SID. The RID uniquely identifies a security principal relative to the local or domain security authority that issued the SID
When it gets down to 250 (50%) it requests a second pool of RID’s from the RID master.  If RID Master Server is not available the RID pools unable to be issued to DC’s and DC’s are only able to create a new object depends on the available RID’s, every DC has anywhere between 250 and 750 RIDs available, so no immediate impact
PDC – PDC required for Time sync, user login, password changes and Trust, now you know why the PDC is important FSMO role holder to get back online, PDC role will impact the end-user immediately and we need to recover ASAP
The PDC emulator Primary Domain Controller for backwards compatibility and it’s responsible for time synchronizing within a domain, also the password master. Any password change is replicated to the PDC emulator ASAP. If a logon request fails due to a bad password the logon request is passed to the PDC emulator to check the password before rejecting the login request.
What is PDC emulator and how would one know whether PDC emulator is working or not?
PDC Emulators: There is one PDC emulator per domain, and when there is a failed authentication attempt, it is forwarded to PDC emulator.  It acts as a “tie-breaker” and it controls the time sync across the domain.
These are the parameters through which we can know whether PDC emulator is working or not.
•	Time is not syncing
•	User’s accounts are not locked out
•	Windows NT BDCs are not getting updates
•	If pre-windows 2000 computers are unable to change their passwords
what are lingering objects?
A lingering object is a deleted AD object that re-appears (“lingers”) on the restored domain controller (DC) in its local copy of Active Directory. Lingering objects can exists if a domain controller does not replicate for an interval of time that is longer than the tombstone lifetime (TSL). 
what is TOMBSTONE lifetime?
Tombstone lifetime in an Active Directory determines how long a deleted object is retained in Active Directory.  The deleted objects in Active Directory are stored in a special object referred as TOMBSTONE.  Usually, windows will use a 60- day tombstone lifetime if time is not set in the forest configuration.
Explain what is Active Directory Schema?
Schema is an active directory component describes all the attributes and objects that the directory service uses to store data.
Explain what is a child DC?
CDC or child DC is a sub domain controller under root domain controller which share name space

Explain what is RID Master?
RID master stands for Relative Identifier for assigning unique IDs to the object created in AD.
What are the components of AD?
Components of AD includes
•	Logical Structure: Trees, Forest, Domains and OU
•	Physical Structures: Domain controller and Sites

What is Infrastructure Master?
Infrastructure Master is accountable for updating information about the user and group and global catalogue.
What is the Global Catalog?
The global catalog contains a complete replica of all objects in Active Directory for its Host domain, and contains a partial replica of all objects in Active Directory for every other domain in the forest.
The global catalog is a distributed data repository that contains a searchable, partial representation of every object in every domain in a multidomain Active Directory forest. The global catalog is stored on domain controllers that have been designated as global catalog servers and is distributed through multimaster replication. Searches that are directed to the global catalog are faster because they do not involve referrals to different domain controllers.
In addition to configuration and schema directory partition replicas, every domain controller in a Windows 2000 Server or Windows Server 2003 forest stores a full, writable replica of a single domain directory partition. Therefore, a domain controller can locate only the objects in its domain. Locating an object in a different domain would require the user or application to provide the domain of the requested object.
The global catalog provides the ability to locate objects from any domain without having to know the domain name. A global catalog server is a domain controller that, in addition to its full, writable domain directory partition replica, also stores a partial, read-only replica of all other domain directory partitions in the forest. The additional domain directory partitions are partial because only a limited set of attributes is included for each object. By including only the attributes that are most used for searching, every object in every domain in even the largest forest can be represented in the database of a single global catalog server.


How do you view all the GCs in the forest?
C:\>repadmin/showreps
domain_controller
OR
You can use Replmon.exe for the same purpose.
OR
AD Sites and Services and nslookup gc._msdcs.%USERDNSDOMAIN%

Why not make all DCs in a large forest as GCs?
The reason that all DCs are not GCs to start is that in large (or even Giant) forests the DCs would all have to hold a reference to every object in the entire forest which could be quite large and quite a replication burden.
For a few hundred, or a few thousand users even, this not likely to matter unless you have really poor WAN lines.

Trying to look at the Schema, how can I do that?
adsiedit.exe
option to view the schema
register schmmgmt.dll using this command
c:\windows\system32>regsvr32 schmmgmt.dll
Open mmc –> add snapin –> add Active directory schema
name it as schema.msc
Open administrative tool –> schema.msc

What are the Support Tools? Why do I need them?
Support Tools are the tools that are used for performing the complicated tasks easily. These can also be the third party tools. Some of the Support tools include DebugViewer, DependencyViewer, RegistryMonitor, etc.  -edit by Casquehead  I beleive this question is reffering to the Windows Server 2003 Support Tools, which are included with Microsoft Windows Server 2003 Service Pack 2. They are also available for download here:
http://www.microsoft.com/downloads/details.aspx?familyid=96A35011-FD83-419D-939B-A772EA2DF90&displaylang=en
You need them because you cannot properly manage an Active Directory network without them.
Here they are, it would do you well to familiarize yourself with all of them.
Acldiag.exe
Adsiedit.msc
Bitsadmin.exe
Dcdiag.exe
Dfsutil.exe
Dnslint.exe
Dsacls.exe
Iadstools.dll
Ktpass.exe
Ldp.exe
Netdiag.exe
Netdom.exe
Ntfrsutl.exe
Portqry.exe
Repadmin.exe
Replmon.exe
Setspn.exe
What is REPLMON? What is ADSIEDIT? What is NETDOM? What is REPADMIN?
ADSIEdit is a Microsoft Management Console (MMC) snap-in that acts as a low-level editor for Active Directory. It is a Graphical User Interface (GUI) tool. Network administrators can use it for common administrative tasks such as adding, deleting, and moving objects with a directory service. The attributes for each object can be edited or deleted by using this tool. ADSIEdit uses the ADSI application programming interfaces (APIs) to access Active Directory. The following are the required files for using this tool:
· ADSIEDIT.DLL
· ADSIEDIT.MSC
Regarding system requirements, a connection to an Active Directory environment and Microsoft Management Console (MMC) is necessary

A: Replmon is the first tool you should use when troubleshooting Active Directory replication issues. As it is a graphical tool, replication issues are easy to see and somewhat easier to diagnose than using its command line counterparts. The purpose of this document is to guide you in how to use it, list some common replication errors and show some examples of when replication issues can stop other network installation actions. 
NETDOM is a command-line tool that allows management of Windows domains and trust relationships. It is used for batch management of trusts, joining computers to domains, verifying trusts, and secure channels
A:
Enables administrators to manage Active Directory domains and trust relationships from the command prompt.
Netdom is a command-line tool that is built into Windows Server 2008. It is available if you have the Active Directory Domain Services (AD DS) server role installed. To use netdom, you must run the netdom command from an elevated command prompt. To open an elevated command prompt, click Start, right-click Command Prompt, and then click Run as administrator.
REPADMIN.EXE is a command line tool used to monitor and troubleshoot replication on a computer running Windows. This is a command line tool that allows you to view the replication topology as seen from the perspective of each domain controller.
REPADMIN is a built-in Windows diagnostic command-line utility that works at the Active Directory level. Although specific to Windows, it is also useful for diagnosing some Exchange replication problems, since Exchange Server is Active Directory based.
REPADMIN doesn’t actually fix replication problems for you. But, you can use it to help determine the source of a malfunction.
What are sites? What are they used for?
Active directory sites, which consist of well-connected networks defined by IP subnets that help define the physical structure of your AD, give you much better control over replication traffic and authentication traffic than the control you get with Windows NT 4.0 domains.
Using Active Directory, the network and its objects are organized by constructs such as domains, trees, forests, trust relationships, organizational units (OUs), and sites.
What’s the difference between a site link’s schedule and interval?
Schedule enables you to list weekdays or hours when the site link is available for replication to happen in the give interval. Interval is the re occurrence of the inter site replication in given minutes. It ranges from 15 – 10,080 mins. The default interval is 180 mins.
What is the KCC?
The KCC is a built-in process that runs on all domain controllers and generates replication topology for the Active Directory forest. The KCC creates separate replication topologies depending on whether replication is occurring within a site (intrasite) or between sites (intersite). The KCC also dynamically adjusts the topology to accommodate new domain controllers, domain controllers moved to and from sites, changing costs and schedules, and domain controllers that are temporarily unavailable.
What are the requirements for installing AD on a new server?
· An NTFS partition with enough free space (250MB minimum)
· An Administrator’s username and password
· The correct operating system version
· A NIC
· Properly configured TCP/IP (IP address, subnet mask and – optional – default gateway)
· A network connection (to a hub or to another computer via a crossover cable)
· An operational DNS server (which can be installed on the DC itself)
· A Domain name that you want to use
· The Windows 2000 or Windows Server 2003 CD media (or at least the i386 folder)
How can you forcibly remove AD from a server, and what do you do later? • Can I get user passwords from the AD database?
Demote the server using dcpromo /forceremoval, then remove the metadata from Active directory using ndtsutil. There is no way to get user passwords from AD that I am aware of, but you should still be able to change them.
Another way out too
Restart the DC is DSRM mode
a. Locate the following registry subkey:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ProductOptions
b. In the right-pane, double-click ProductType.
c. Type ServerNT in the Value data box, and then click OK.
Restart the server in normal mode
its a member server now but AD entries are still there. Promote teh server to a fake domain say ABC.com and then remove gracefully using DCpromo. Else after restart you can also use ntdsutil to do metadata as told in teh earlier post



Name some OU design considerations?
OU design requires balancing requirements for delegating administrative rights – independent of Group Policy needs – and the need to scope the application of Group Policy. The following OU design recommendations address delegation and scope issues:
Applying Group Policy An OU is the lowest-level Active Directory container to which you can assign Group Policy settings.
Delegating administrative authority
Usually don’t go more than 3 OU levels
What do you do to install a new Windows 2003 R2 DC in a Windows 2003 AD?
A. If you’re installing Windows 2003 R2 on an existing Windows 2003 server with SP1 installed, you require only the second R2 CD-ROM. Insert the second CD and the r2auto.exe will display the Windows 2003 R2 Continue Setup screen.
If you’re installing R2 on a domain controller (DC), you must first upgrade the schema to the R2 version (this is a minor change and mostly related to the new Dfs replication engine). To update the schema, run the Adprep utility, which you’ll find in the Cmpnents\r2\adprep folder on the second CD-ROM. Before running this command, ensure all DCs are running Windows 2003 or Windows 2000 with SP2 (or later)
How would you find all users that have not logged on since last month?
Goto Active Directory Users and Computers. Right click new query, click on define query. Then select Days since logged on to 30 days. Save the query with a name.
What are the DScommands?
New DS (Directory Service) Family of built-in command line utilities for Windows Server 2003 Active Directory
New DS built-in tools for Windows Server 2003
The DS (Directory Service) group of commands are split into two families. In one branch are DSadd, DSmod, DSrm and DSMove and in the other branch are DSQuery and DSGet.
When it comes to choosing a scripting tool for Active Directory objects, you really are spoilt for choice. The the DS family of built-in command line executables offer alternative strategies to CSVDE, LDIFDE and VBScript.
Let me introduce you to the members of the DS family:
DSadd – add Active Directory users and groups
DSmod – modify Active Directory objects
DSrm – to delete Active Directory objects
DSmove – to relocate objects
DSQuery – to find objects that match your query attributes
DSget – list the properties of an object
How do you backup AD?
Backing up Active Directory is essential to maintain an Active Directory database. You can back up Active Directory by using the Graphical User Interface (GUI) and command-line tools that the Windows Server 2003 family provides.
You frequently backup the system state data on domain controllers so that you can restore the most current data. By establishing a regular backup schedule, you have a better chance of recovering data when necessary.
To ensure a good backup includes at least the system state data and contents of the system disk, you must be aware of the tombstone lifetime. By default, the tombstone is 60 days. Any backup older than 60 days is not a good backup. Plan to back up at least two domain controllers in each domain, one of at least one backup to enable an authoritative restore of the data when necessary.
System State Data
Several features in the windows server 2003 family make it easy to backup Active Directory. You can backup Active Directory while the server is online and other network function can continue to function.
System state data on a domain controller includes the following components:
Active Directory system state data does not contain Active Directory unless the server, on which you are backing up the system state data, is a domain controller. Active Directory is present only on domain controllers.
The SYSVOL shared folder: This shared folder contains Group policy templates and logon scripts. The SYSVOL shared folder is present only on domain controllers.
The Registry: This database repository contains information about the computer’s configuration.
System startup files: Windows Server 2003 requires these files during its initial startup phase. They include the boot and system files that are under windows file protection and used by windows to load, configure, and run the operating system.
The COM+ Class Registration database: The Class registration is a database of information about Component Services applications.
The Certificate Services database: This database contains certificates that a server running Windows server 2003 uses to authenticate users. The Certificate Services database is present only if the server is operating as a certificate server.
System state data contains most elements of a system’s configuration, but it may not include all of the information that you require recovering data from a system failure. Therefore, be sure to backup all boot and system volumes, including the System State, when you back up your server.
Why can’t you restore a DC that was backed up 4 months ago?
Because of the tombstone life which is set to only 60 days
What is the order in which GPOs are applied?
Local, Site, Domain, OU
Group Policy settings are processed in the following order:
1:- Local Group Policy object-each computer has exactly one Group Policy object that is stored locally. This processes for both computer and user Group Policy processing.
2:- Site-Any GPOs that have been linked to the site that the computer belongs to are processed next. Processing is in the order that is specified by the administrator, on the Linked Group Policy Objects tab for the site in Group Policy Management Console (GPMC). The GPO with the lowest link order is processed last, and therefore has the highest precedence.
3:- Domain-processing of multiple domain-linked GPOs is in the order specified by the administrator, on the Linked Group Policy Objects tab for the domain in GPMC. The GPO with the lowest link order is processed last, and therefore has the highest precedence.
4:- Organizational units-GPOs that are linked to the organizational unit that is highest in the Active Directory hierarchy are processed first, then GPOs that are linked to its child organizational unit, and so on. Finally, the GPOs that are linked to the organizational unit that contains the user or computer are processed.
At the level of each organizational unit in the Active Directory hierarchy, one, many, or no GPOs can be linked. If several GPOs are linked to an organizational unit, their processing is in the order that is specified by the administrator, on the Linked Group Policy Objects tab for the organizational unit in GPMC. The GPO with the lowest link order is processed last, and therefore has the highest precedence.
This order means that the local GPO is processed first, and GPOs that are linked to the organizational unit of which the computer or user is a direct member are processed last, which overwrites settings in the earlier GPOs if there are conflicts. (If there are no conflicts, then the earlier and later settings are merely aggregated.)
What’s the difference between software publishing and assigning?
ANS An administrator can either assign or publish software applications.
Assign Users
The software application is advertised when the user logs on. It is installed when the user clicks on the software application icon via the start menu, or accesses a file that has been associated with the software application.
Assign Computers
The software application is advertised and installed when it is safe to do so, such as when the computer is next restarted.
Publish to users
The software application does not appear on the start menu or desktop. This means the user may not know that the software is available. The software application is made available via the Add/Remove Programs option in control panel, or by clicking on a file that has been associated with the application. Published applications do not reinstall themselves in the event of accidental deletion, and it is not possible to publish to computers.
