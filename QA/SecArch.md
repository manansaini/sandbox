# CIA Triad:
  C: Confidientiality :Confidentiality is the ability to hide information from those people unauthorised to view it.
  
    Compromise: Steal user session info form the session cookies, injection attacks (SQL, URI, Log, LDAP etc)
  
  I: Integrity: The ability to ensure that data is an accurate and unchanged representation of the original secure information.
  
    Compromise: Attacker can corrupt or destroy the data using URI ,SQL ,log injection attacks
  
  A: Availbility: It is important to ensure that the information concerned is readily accessible to the authorised viewer at all times.. System and network must be up and running.
  
    Compromise: Can be impacted via DoS attack.
  
  
#  SA&A Process:
  
Security Assessment and Authorization (SA&A) is the process by which agencies examine their information technology infrastructure and develop supporting evidence necessary for security assurance accreditation.

The National Institute of Standards and Technology (NIST) Risk Management Framework (Special Publication 800-37) has created a new model for risk analysis for federal agencies by moving from the traditional Certification & Accreditation (C&A) approach to a Security Assessment & Authorization (SA&A) model – a more real-time, dynamic view of risk.


  
# AAA:
  
  Authentication: refers to unique identifying information from each system user, generally in the form of a username and password.
  
  Authorization: refers to the process of adding or denying individual user access to a computer network and its resources.
  
  Accounting: refers to the record-keeping and tracking of user activities on a computer network. 
  
# Cross-site scripting (XSS)

XSS is a type of computer security vulnerability typically found in web applications. XSS enables attackers to inject client-side scripts into web pages viewed by other users. XSS attacks occur when an attacker uses a web application to send malicious code, generally in the form of a browser side script, to a different end user.

# ISO 27001

ISO 27001 (formally known as ISO/IEC 27001:2005) is a specification for an information security management system (ISMS). An ISMS is a framework of policies and procedures that includes all legal, physical and technical controls involved in an organisation's information risk management processes.

ISO 27001 uses a topdown, risk-based approach and is technology-neutral. The specification defines a six-part planning process:

    Define a security policy.
    Define the scope of the ISMS.
    Conduct a risk assessment.
    Manage identified risks.
    Select control objectives and controls to be implemented.
    Prepare a statement of applicability.

# CoBIT
COBIT  is a framework for developing, implementing, monitoring and improving information technology (IT) governance and management practices.The goal of the framework is to provide a common language for business executives to communicate with each other about goals, objectives and results.

The name COBIT originally stood for "Control Objectives for Information and Related Technology," but the spelled-out version of the name was dropped in favor of the acronym in the fifth iteration of the framework.

COBIT 5 is based on five key principles for governance and management of enterprise IT:

   Principle 1: Meeting Stakeholder Needs
   Principle 2: Covering the Enterprise End-to-End
   Principle 3: Applying a Single, Integrated Framework
   Principle 4: Enabling a Holistic Approach
   Principle 5: Separating Governance From Management
    

# SAML



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


# OAuth



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

 
 # What is the difference between a threat, vulnerability, and a risk?
 
 
 Asset – People, property, and information. An asset is what we’re trying to protect.
 
 Threat – Anything that can exploit a vulnerability, intentionally or accidentally, and obtain, damage, or destroy an asset.
 
 Vulnerability – Weaknesses or gaps in a security program that can be exploited by threats to gain unauthorized access to an asset.
 
 Risk – The potential for loss, damage or destruction of an asset as a result of a threat exploiting a vulnerability.
 
 Asset + Threat + Vulnerability = Risk.
 
 
 # What port does ping work over?
 
 
 Ping uses the ICMP ECHO facilities in Layer 3. Real ping uses ICMP, which doesn't use ports at all. ICMP Works At Layer Three (3) While ICMP sits “on top of”, i.e. is embedded in, IP , ICMP is not a layer 4 protocol.
 
 # What’s the difference between encoding, encryption, and hashing?
 
 
Encoding: The purpose of encoding is to transform data so that it can be properly (and safely) consumed by a different type of system, e.g. binary data being sent over email, or viewing special characters on a web page. The goal is not to keep information secret, but rather to ensure that it’s able to be properly consumed.
 
Encryption: The purpose of encryption is to transform data in order to keep it secret from others, e.g. sending someone a secret letter that only they should be able to read, or securely sending a password over the Internet. Examples: AES, Blowfish, RSA
 
Hashing: Hashing serves the purpose of ensuring integrity, i.e. making it so that if something is changed you can know that it’s changed. Technically, hashing takes arbitrary input and produce a fixed-length string that has the following attributes:

    The same input will always produce the same output.
    Multiple disparate inputs should not produce the same output.
    It should not be possible to go from the output to the input.
    Any modification of a given input should result in drastic change to the hash.
    
Examples: SHA-3, MD5 (Now obsolete), etc.

# How are PCI compliance levels determined for each business?


PCI compliance level is determined by the number or volume of credit card transactions accumulated by a vendor.
There are four levels of PCI compliance. The first level is any merchant that uses credit card transactions for purchases, and the final fourth level are high volume merchants that take over a million transactions a year.


 
 
 



