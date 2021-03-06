# IT Security Analyst

### What is OWASP
The Open Web Application Security Project (OWASP) is a non-profit organization dedicated to providing unbiased, practical information about application security. 


### CIA Triad:  
  CIA Triad is a model designed to guide policies for information security within an organization.
  
  C: Confidientiality :Confidentiality is the ability to hide information from those people unauthorised to view it.
  
    Compromise: Steal user session info form the session cookies, injection attacks (SQL, URI, Log, LDAP etc)
  
  I: Integrity: The ability to ensure that data is an accurate and unchanged representation of the original secure information.
  
    Compromise: Attacker can corrupt or destroy the data using URI ,SQL ,log injection attacks
  
  A: Availbility: It is important to ensure that the information concerned is readily accessible to the authorised viewer at all times.. System and network must be up and running.
  
    Compromise: Can be impacted via DoS attack.
  
  
###  SA&A Process:
  
Security Assessment and Authorization (SA&A) is the process by which agencies examine their information technology infrastructure and develop supporting evidence necessary for security assurance accreditation.

The National Institute of Standards and Technology (NIST) Risk Management Framework (Special Publication 800-37) has created a new model for risk analysis for federal agencies by moving from the traditional Certification & Accreditation (C&A) approach to a Security Assessment & Authorization (SA&A) model – a more real-time, dynamic view of risk.


  
### AAA:
  
  Authentication: refers to unique identifying information from each system user, generally in the form of a username and password.
  
  Authorization: refers to the process of adding or denying individual user access to a computer network and its resources.
  
  Accounting: refers to the record-keeping and tracking of user activities on a computer network. 
  
### Cross-site scripting (XSS)

XSS is a type of computer security vulnerability typically found in web applications. XSS enables attackers to inject client-side scripts into web pages viewed by other users. XSS attacks occur when an attacker uses a web application to send malicious code, generally in the form of a browser side script, to a different end user.

### ISO 27001

ISO 27001 (formally known as ISO/IEC 27001:2005) is a specification for an information security management system (ISMS). An ISMS is a framework of policies and procedures that includes all legal, physical and technical controls involved in an organisation's information risk management processes.

ISO 27001 uses a topdown, risk-based approach and is technology-neutral. The specification defines a six-part planning process:

    Define a security policy.
    Define the scope of the ISMS.
    Conduct a risk assessment.
    Manage identified risks.
    Select control objectives and controls to be implemented.
    Prepare a statement of applicability.

### CoBIT

The name COBIT originally stood for "Control Objectives for Information and Related Technology," but the spelled-out version of the name was dropped in favor of the acronym in the fifth iteration of the framework.

COBIT  is a framework for developing, implementing, monitoring and improving information technology (IT) governance and management practices.The goal of the framework is to provide a common language for business executives to communicate with each other about goals, objectives and results.

COBIT 5 is based on five key principles for governance and management of enterprise IT:

     Principle 1: Meeting Stakeholder Needs
     Principle 2: Covering the Enterprise End-to-End
     Principle 3: Applying a Single, Integrated Framework
     Principle 4: Enabling a Holistic Approach
     Principle 5: Separating Governance From Management
    

### SAML

Security Assertion Markup Language (SAML, pronounced sam-el) is an XML-based, open-standard data format for exchanging authentication and authorization data between parties.


    Service Provider (Resource Server) - this is the web-server you are trying to access information on.

    Client - this is how the user is interacting with the Resource Server, like a web app being served through a web browser.

    Identity Provider (Authorization Server) - this is the server that owns the user identities and credentials. It's who the user actually authenticates with.

The most common SAML flow is shown below:


![SAML flow](https://d9s067m9cf0lb.cloudfront.net/assets/2013/04/09/saml2-flow-c21af65008358283906cf90aec68c18fb9b8da17704d1f10f3ced6d8c8fa4cc2.png)

Here's a fictitious scenario describing the above diagram:

    A - a user opens their web-browser and goes to MyPhotos.com which stores all of their photos. MyPhotos.com doesn't handle authentication itself.

    B - to authenticate the user MyPhotos.com constructs a SAML Authnrequest, signs it, optionally encrypts it, and encodes it. After which, it redirects the user's web browser to the Identidy Provider (IdP) in order to authenticate. The IdP receives the request, decodes it, decrypts it if necessary, and verifies the signature.

    C - With a valid Authnrequest the IdP will present the user with a login form in which they can enter their username and password.

    D- Once the user has logged in, the IdP generates a SAML token that includes identity information about the user (such as their username, email, etc). The Id takes the SAML token and redirects the user back to the Service Provider (MyPhotos.com).

    E - MyPhotos.com verifies the SAML token, decrypts it if necessary, and extracts out identity information about the user, such as who they are and what their permissions might be. MyPhotos.com now logs the user into its system, presumably with some kind of cookie and session.


### OAuth

OAuth is an open standard for authorization, commonly used as a way for Internet users to authorize websites or applications to access their information on other websites but without giving them the passwords.

    Resource Server (Service Provider) - this is the web-server you are trying to access information on.

    Client - this is how the user is interacting with the Resource Server. This could be a browser-based web app, a native mobile app, a desktop app, a server-side app.

    Authorization Server (Identity Provider) - this is the server that owns the user identities and credentials. It's who the user actually authenticates and authorizes with.

At a high level, the OAuth2 flow is not that different from the earlier SAML flow:

![OAuth flow](https://d9s067m9cf0lb.cloudfront.net/assets/2013/04/09/oauth2-flow-4da2c3e38ecf5a77b38607d527c320bda93714ce2d6163e122aabb534390df43.png)


Let's walk through the same scenario we walked through with SAML earlier:

    A - a user opens their web-browser and goes to MyPhotos.com which stores all of their photos. MyPhotos.com doesn't handle authentication itself, so the user is redirected to the Authorization Server with a request for authorization. The user is presented with a login form and is asked if they want to approve the Resource Server (MyPhotos.com) to act on their behalf. The user logs in and they are redirected back to MyPhotos.com.

    B - the client receives an authorization grant code as a part of the redirect and then passes this along to the client.

    C - the Client then uses that authorization grant code to request an access token from the Authorization Server.

    D - if the authorization grant code is valid, then the Authorization Server grants an access token. The access token is then used by the client to request resources from the Resource Server (MyPhotos.com).

    E - MyPhotos.com receives the request for a resource and it receives the access token. In order to make sure it's a valid access token it sends the token directly to the Authorization Server to validate. If valid, the Authorization Server sends back information about the user.

    F - having validated the user's request MyPhotos.com sends the requested resource back to the user.

 
### What is the difference between a threat, vulnerability, and a risk?
 
 
 Asset – People, property, and information. An asset is what we’re trying to protect.
 
 Threat – Anything that can exploit a vulnerability, intentionally or accidentally, and obtain, damage, or destroy an asset. It is the potential to harm an asset.
 
 Vulnerability – Weaknesses or gaps in a security program that can be exploited by threats to gain unauthorized access to an asset.
 
 Risk – The potential for loss, damage or destruction of an asset as a result of a threat exploiting a vulnerability.
 
 Asset + Threat + Vulnerability = Risk.
 
 
### What port does ping work over?
 
Ping uses the ICMP ECHO facilities in Layer 3. Real ping uses ICMP, which doesn't use ports at all. ICMP Works At Layer Three (3) While ICMP sits “on top of”, i.e. is embedded in, IP , ICMP is not a layer 4 protocol.
 
 
### What’s the difference between encoding, encryption, and hashing?

Encoding: The purpose of encoding is to transform data so that it can be properly (and safely) consumed by a different type of system, e.g. binary data being sent over email, or viewing special characters on a web page. The goal is not to keep information secret, but rather to ensure that it’s able to be properly consumed.
 
Encryption: The purpose of encryption is to transform data in order to keep it secret from others, e.g. sending someone a secret letter that only they should be able to read, or securely sending a password over the Internet. Examples: AES, Blowfish, RSA
 
Hashing: Hashing serves the purpose of ensuring integrity, i.e. making it so that if something is changed you can know that it’s changed. Technically, hashing takes arbitrary input and produce a fixed-length string that has the following attributes:

    The same input will always produce the same output.
    Multiple disparate inputs should not produce the same output.
    It should not be possible to go from the output to the input.
    Any modification of a given input should result in drastic change to the hash.
    
Examples: SHA-3, MD5 (Now obsolete), etc.

### How are PCI compliance levels determined for each business?

PCI compliance level is determined by the number or volume of credit card transactions accumulated by a vendor.
There are four levels of PCI compliance. The first level is any merchant that uses credit card transactions for purchases, and the final fourth level are high volume merchants that take over a million transactions a year.


### Explain what is the 80/20 rule of networking?

80/20 is a thumb rule used for describing IP networks, in which 80% of all traffic should remain local while 20% is routed towards a remote network.
 
### Common Web Application Vulnerabilities

An application vulnerability is a system flaw or weakness in an application that could be exploited to compromise the security of the application. Once an attacker has found a flaw, or application vulnerability, and determined how to access it, the attacker has the potential to exploit the application vulnerability to facilitate a cyber crime. 

* Buffer Overflow:  A Buffer overflow is a common software coding mistake. A buffer overflow, or “buffer overrun” occurs when more data is put into a fixed-length buffer than the buffer can handle. Adjacent memory space becomes overwritten and corrupted. When this occurs – bad things happen. Usually system crashes, but also the opportunity for an attacker to run arbitrary code.

      The most reliable way to avoid or prevent buffer overflows is to use automatic protection at the language level. Another fix is “bounds checking” enforced at run-time, which prevents buffer overrun by automatically checking that data written to a buffer is within acceptable boundaries. Also we should include regular testing to detect and fix buffer overflows.
      
* Cross-Site Request Forgery (CSRF) attack: It is an attack whereby a malicious website will send a request to a web application that a user is already authenticated against from a different website. This way an attacker can access functionality in a target web application via the victim's already authenticated browser. 

  The vulnerability lies in the affected web application, not the victim’s browser or the site hosting the CSRF.
  The most common method to prevent Cross-Site Request Forgery (CSRF) attacks is to append unpredictable challenge tokens to each request and associate them with the user’s session. Such tokens should at a minimum be unique per user session, but can also be unique per request. By including a challenge token with each request, the developer can ensure that the request is valid and not coming from a source other than the user.
  
* Cross-Site Scripting (XSS) : XSS is one of the most common application-layer web attacks. XSS vulnerabilities target scripts embedded in a page that are executed on the client-side (in the user’s web browser) rather than on the server-side. A cross-site scripting vulnerability may be used by attackers to bypass access controls
  
  In XSS attacks, the victim is the user and not the application. XSS vulnerabilities may occur if:

    Input coming into web applications is not validated
    Output to the browser is not HTML encoded

* Failure to Restrict URL Access: If your application fails to appropriately restrict URL access, security can be compromised through a technique called forced browsing. Forced browsing can be a very serious problem if an attacker tries to gather sensitive data through a web browser by requesting specific pages, or data files. Using this technique, an attacker can bypass website security by accessing files directly instead of following links. This enables the attacker to access data source files directly instead of using the web application. The attacker can then guess the names of backup files that contain sensitive information, locate and read source code, or other information left on the server, and bypass the "order" of web pages.
  
  To prevent forced browsing, you can use appropriate permissions or ACLs to disallow anonymous reading. Also, do not allow anonymous web visitors user read permissions to any sensitive data files.

  Secondly, define the list of file types available for remote reading on the server. Many servers allow you to define which file extensions can be served remotely. For example, .log, .dat and database files are not files that all users should have access to - except through secure channels.

  Also, remove all unnecessary files from web-accessible directories. That is, if files are unneeded within the directory, remove them, even though they may be secure. ACLs may need to change in the future, and this could pose a security risk.


* LDAP Injection: LDAP Injection is an attack used to exploit web-based applications that construct LDAP statements based on user input. When an application fails to properly sanitize user input, it’s possible to modify LDAP statements using a local proxy. This could result in the execution of arbitrary commands, such as granting permissions to unauthorized queries, and content modification inside the LDAP tree. 

  Incoming Data Validation - All client-supplied data needs to be cleaned of any characters or strings that could possibly be used maliciously.
  
  Outgoing Data Validation - All data returned to the user should be validated, and the amount of data returned by the queries should be restricted as an added layer of security.
  
  LDAP Configuration - Implementing tight access control on the data in the LDAP directory is imperative, especially when configuring the permissions on user objects, and even more importantly if the directory is used for single sign-on solution. 
  
* SQL Injection: SQL injection (SQLi) is an application security weakness that allows attackers to control an application’s database – letting them access or delete data, change an application’s data-driven behavior, and do other undesirable things – by tricking the application into sending unexpected SQL commands.

  Discover SQLi vulnerabilities by routinely testing your applications both using static testing and dynamic testing.
  
  Avoid and repair SQLi vulnerabilities by using parameterized queries. These types of queries specify placeholders for parameters so that the database will always treat them as data rather than part of a SQL command. 
  
  Mitigate the impact of SQLi vulnerabilities by enforcing least privilege on the database. Ensure that each application has its own database credentials, and that these credentials have the minimum rights the application needs.
  
## RISK Management

### Why Is It Important to Manage Risk?
  The principle reason for managing risk in an organization is to protect the mission and assets of the organization. Therefore, risk management must be a management function rather than a technical function. The fact is that all organizations have limited resources and risk can never be reduced to zero. So, understanding risk, especially the magnitude of the risk, allows organizations to the system owner to protect the information system commensurate with its value to the organization.

 
### How Is Risk Assessed? 
Risk is assessed by identifying threats and vulnerabilities, then determining the likelihood and impact for each risk. Risk assessment is a complex undertaking, usually based on imperfect information. The general process of risk assessment is:
 
* Quantitative Risk Assessment :
  Quantitative risk assessment draws upon methodologies used by financial institutions and insurance companies. By assigning values to information, systems, business processes, recovery costs, etc., impact, and therefore risk, can be measured in terms of direct and indirect costs. 

* Qualitative Risk Assessment
  Qualitative risk assessments assume that there is already a great degree of uncertainty in the likelihood and impact values and defines them, and thus risk, in somewhat subjective or qualitative terms.Similar to the issues in quantitative risk assessment, the great difficulty in qualitative risk assessment is defining the likehood and impact values.
 
#### Assessing Risk
Assessing risk is the process of determining the likelihood of the threat being exercised against
the vulnerability and the resulting impact from a successful compromise. When assessing
likelihood and impact, take the current threat environment and controls into consideration.
Likelihood and impact are assessed on the system as it is operating at the time of the assessment


### How Is Risk Managed?

Recall that the purpose of assessing risk is to assist management in determining where to direct resources. There are four basic strategies for managing risk: mitigation, transference, acceptance and avoidance. 

* Mitigation
Mitigation is the most commonly considered risk management strategy. Mitigation involves fixing the flaw or providing some type of compensatory control to reduce the likelihood or impact associated with the flaw. A common mitigation for a technical security flaw is to install a patch provided by the vendor. Sometimes the process of determining mitigation strategies is called control analysis. 

* Transference
Transference is the process of allowing another party to accept the risk on your behalf. This is not widely done for IT systems, but everyone does it all the time in their personal lives. Car, health and life insurance are all ways to transfer risk. In these cases, risk is transferred from the individual to a pool of insurance holders, including the insurance company.

* Acceptance
Acceptance is the practice of simply allowing the system to operate with a known risk. Many low risks are simply accepted. Risks that have an extremely high cost to mitigate are also often accepted. Beware of high risks being accepted by management. Ensure that this strategy is in writing and accepted by the manager(s) making the decision. Often risks are accepted that should not have been accepted, and then when the penetration occurs, the IT security personnel are held responsible. Typically, business managers, not IT security personnel, are the ones authorized to accept risk on behalf of an organization. 
 
* Avoidance
Avoidance is the practice of removing the vulnerable aspect of the system or even the system itself. For instance, during a risk assessment, a website was uncovered that let vendors view their invoices, using a vendor ID embedded in the HTML file name as the identification and no authentication or authorization per vendor. When notified about the web pages and the risk to the
organization, management decided to remove the web pages and provide vendor invoices via another mechanism. In this case, the risk was avoided by removing the vulnerable web pages.



### Network log consolidatioN:  Splunk TOOL

You can collect, store, index, search, correlate, visualize, analyze and report on any machine-generated data to identify and resolve operational and security issues. Turn searches into real-time alerts, reports or dashboards with a few mouse clicks.Index, search and correlate any data for complete insight across your infrastructure.Securely make operational data available without requiring access to production systems.


### NETWORK INFRASTRUCTURE VULNERABILITIES:

When you assess your company’s network infrastructure security, you need to look at the following:

      Where devices, such as a firewall or an IPS, are placed on the network and how they’re configured

      What external attackers see when they perform port scans and how they can exploit vulnerabilities in your network hosts

      Network design, such as Internet connections, remote access capabilities, layered defenses, and placement of hosts on the network

      Interaction of installed security devices, such as firewalls, intrusion prevention systems (IPSs), antivirus, and so on

      What protocols are in use

      Commonly attacked ports that are unprotected

      Network host configurations

      Network monitoring and maintenance

If someone exploits a vulnerability in one of the items in the preceding list or anywhere in your network’s security, bad things can happen:

      A hacker can launch a denial of service (DoS) attack, which can take down your Internet connection — or your entire network.

      A malicious employee using a network analyzer can steal confidential information in e-mails and files sent over the network.

      A hacker can set up back-door access into your network.

      A hacker can attack specific hosts by exploiting local vulnerabilities across the network.

      Before assessing your network infrastructure security, remember to do the following:

      Test your systems from the outside in, the inside out, and the inside in (that is, on and between internal network segments and demilitarized zones [DMZs]).

      Obtain permission from partner networks to check for vulnerabilities on their systems that can affect your network’s security, such as open ports, lack of a firewall, or a misconfigured router.

#### Top 8 vulnerabilities inside the network:

1. USB thumb drives:  Believe it or not, USB drives are actually one of, if not the most, common ways you can infect a network from inside a firewall.

2. Laptop and netbooks:  Laptops are discreet, portable, include full operating systems, can operate using an internal battery and come with a handy Ethernet port for tapping directly into a network.
    What to do: Implement an encrypted file system for sensitive data. There are a number of off-the-shelf solutions out there to choose from, along with open source ones such as TrueCrypt.
  
3. Wireless access points: Wireless APs provide immediate connectivity to any user within proximity of the network. Wireless attacks by wardrivers (people in vehicles searching for unsecured Wi-Fi networks) are common and have caused significant damage in the past.
      What to do: WPA2 Enterprise using RADIUS is recommended along with an AP that is capable of performing authentication and enforcing security measures.
      
4. Inside connections:  Internal company employees can also inadvertently or intentionally access areas of the network that they wouldn't or shouldn't otherwise have access to and compromise endpoints using any of the means outlined in this article.Maybe the employee asks a fellow worker for help accessing an area of the network that he doesn't have access to.

  What to do: Passwords should be changed regularly. Authentication and access levels are a must for any employee -- he should only have access to systems, file shares, etc. that are needed to fulfill his duties. Any special requests should always be escalated to a team (not a single user with authority) who can authorize the request.
  
5. The Trojan human:  Like the Trojan horse, the Trojan human comes into a business in some type of disguise. He  could be in business attire or dressed like legitimate repairman (appliance, telecom, HVAC). These types of tricksters have been known to penetrate some pretty secure environments, including server rooms. Through our own social conditioning, we have the tendency to not stop and question an appropriately attired person we don't recognize in our office environment. An employee may not think twice about swiping their access card to allow a uniformed worker into their environment for servicing. It can take less than a minute for an unsupervised person in a server room to infect the network.

   What to do: Reminders should be sent to employees about authorizing third parties. Identify the source by asking questions, not making assumptions.
   
6. Optical media:  In June 2010, an Army intelligence analyst was arrested after being charged with stealing and leaking confidential data to public networks. Sources claim the analyst did so by bringing in music CDs labeled with popular recording artists, using this medium only as a guise. Once he had access to a networked workstation, he would access the classified information he had authorized credentials for and store the data on the "music" CDs in encrypted archives. To help cover his tracks, the analyst would lip sync to the music that was supposedly stored on the CDs while at his workstation. Recordable media that appear to be legitimate can and has been used to piggyback data in and out of networks. And, like the thumb drives mentioned above, they can be used as a source for network infection.

    What to do: As with the USB tip, it's important to implement and enforce asset control and policies around what devices can enter the environment and when. And then follow that up with frequent policy reminders.
    
7. Smartphones and other digital devices
8. E-mail


### Security Assessment Services

#### Network Based (Attack & Penetration):
 
An attack and penetration test will answer questions like:

            How vulnerable is the network, host, and application(s) to attacks from the internet or intranet?
            Can an intruder obtain unauthorized access to critical resources?
            Are social engineering techniques effective?
            Are operational controls effective?

This would involve the ISO acting as an attacker and looking at the system as an outsider.  The ISO would look for:

            Remotely exploitable vulnerabilities
            Patch levels (OS and Apps)
            Unnecessary services
            Weakness of encryption
            Weakness of authentication
            Etc.
#### Host Based
This is an assessment of the health and security of given workstation or server.  Automated scanning tools (e.g. Nessus) are the primary vehicle for this type of assessment.  Additional hands-on inspection may also be necessary to assess conformance to security best practice. 
 
This assessment will answer questions like:.

            Is patching up to date?
            Are unnecessary services running?
            Are anti-virus/anti-malware signatures up to date?
 
This would involve the ISO acting as a Sys Admin and auditing the system and applications looking for:

            Locally exploitable vulnerabilities
            Patch levels (OS and Apps)
            Access rights
            Security best practices
            Etc.

#### Application

This is an assessment of the functionality and resilience of the compiled application to known threats.  This assessment focuses on the compiled and installed elements of the entire system: how the application components are deployed, communicate or otherwise interact with both the user and server environments. 
 
Application scanning tools as well as manual testing with and without application credentials are used to perform this assessment. Typically some host, network, and general information security practices are assessed as part an application vulnerability assessment.
 
This assessment will answer questions like:

            Does the application expose the underlying servers and software to attack
            Can a malicious user access, modify, or destroy data or services within the system
 
This would involve the ISO auditing an application (typically web based) and looking for vulnerabilities like:

            SQL Injection
            Cross Site Scripting
            Cross Site Request Forgery
            Improper data sanitization
            Buffer overflows (limited)
            Mis-configured/weak authentication
            Etc.
 
####  Compliance

This would involve the Information Security Office auditing (or assisting in the coordination of an audit if the ISO is not trained to conduct the specific audit) systems for compliance with specific regulations:

            HIPAA
            FERPA
            GLBA
            PCI

#### Why DNS traffic is important

DNS has an important role in how end users in your enterprise connect to the internet. Each connection made to a domain by the client devices is recorded in the DNS logs. Inspecting DNS traffic between client devices and your local recursive resolver could reveal a wealth of information for forensic analysis.

DNS queries can reveal:

      Botnets/Malware connecting to C&C servers
      What websites visited by an employee
      Which malicious and DGA domains were accessed
      Which dynamic domains (DynDNS) accessed
      DDOS attack detection like NXDomain, phantom domain. random subdomain

Identifying the threats using EventTracker

While parsing each DNS log, we verify each domain accessed against:

      Malicious domain database (updated on regular basis)
      Domain Generation Algorithm (DGA)

#### From an audit and compliance perspective, here’s a generalized list of how we map to standards (e.g. required by GDPR, HIPAA, NERC, FFIEC, FISMA, FERPA, PCI, SOX).

    Identity, Audit and Authenticate Administrator and 3rd Party Access
    Assign a Unique ID to each person and Authenticate access to systems
    Control and Audit of all privileged users access 
    Logging, monitoring user access
    Track and Monitor all Access
    Access Policy and reporting for Forensics and Investigations on incidents
    Continuous Security Training Awareness with Recording Message
    Remote Access Session Monitoring and Authentication to Servers
    Logging Access, Alert on Unauthorized Access to Sensitive systems
    Ports and Services Monitoring, Logging All Server and user activity
    Incident Response with Session Replay on Event logs


### 
 
### 
 
### 

 



