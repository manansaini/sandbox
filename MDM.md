 Mobile Device Management (MDM) Interview Questions & Answers

MobileIron MDM Interview Questions & Answers



<b>What is the Virtual Smartphone Platform (VSP)?</b>

The MobileIron Virtual Smartphone Platform ("VSP") is the central hub of the MobileIron solution. It may be deployed as a physical hardware appliance or as a virtual appliance using VMware ESX or Hyper-V. The VSP interfaces with the MobileIron application and enterprise resources such as LDAP, Exchange ActiveSync, certificate authorities.

How many devices can you support on one VSP?
MobileIron VSP has been tested to manage up to 100,000 devices per server and up to 200 simultaneous device registrations.

What is Sentry?
MobileIron Sentry provides access control for email. Sentry connects to Microsoft ActiveSync-enabled email systems such as Microsoft Exchange, IBM Lotus Notes, Google Gmail, and Microsoft Office 365. Like the VSP, it may be deployed as a physical hardware appliance or a virtual appliance using VMware ESX. MobileIron Sentry is included in the MobileIron Advanced Management package, though the hardware appliance is sold separately.


What is the Connected Cloud?
The MobileIron Connected Cloud solution is a subscription-based SaaS service that allows the customer to administer the MobileIron solution using a web browser over the Internet. There is a Connector, which sits on-premise in the customer's data center and ensures that Connected Cloud syncs with enterprise resources such as LDAP. Sentry, which provides access control for email, is optional and not required.

What is Docs@Work?
Docs@Work is a solution for securely managing mobile access to enterprise content. It gives the end user an intuitive way to access, store, and view documents from email and SharePoint and lets the administrator establish data loss prevention controls to protect these documents from unauthorized distribution

How is using Docs@Work different from using the VPN client on my device?
Docs@Work provides VPN-less access to corporate content repositories like SharePoint via the MobileIron Sentry. End-users have seamless connectivity to enterprise resources behind the firewall. Traditional VPN clients require end-users to manually establish a remote connection to the enterprise to access corporate resources. In addition to seamless access, Docs@Work also provides additional security. Since Docs@Work connects to the intranet via MobileIron Sentry, other applications on the device cannot access sensitive corporate information. Traditional device level VPNs provide device level access to corporate resources. Once the VPN tunnel is established any application on the device can access sensitive corporate resources.

Can you view documents offline with Docs@Work?
If enabled by the admin, end-users can save content locally, within the Docs@Work container for offline viewing.

What CMS software does Docs@Work support?
MobileIron Docs@Work works with all CMS systems that support IIS and Apache based WebDAV interfaces.

Does Docs@Work support editing?
The current version of Docs@Work does not support document editing.

What is AppConnect?
MobileIron AppConnect creates a secure app container through either an SDK and wrapper for iOS or a wrapper for Android. This container is connected to other secure app containers and to the MobileIron console for ongoing management. Security features provided by the AppConnect platform include data-at-rest encryption, SSO, DLP controls, dynamic configuration/ policy updates and selective wipe of app-specific data.

What kind of apps does AppConnect work with? HTML5, etc.
AppConnect can secure both in-house and 3rd party applications. Apps can be made AppConnect enabled through either an SDK and wrapper for iOS or a wrapper for Android. Security for HTML5 app is provided by the AppConnect enabled Web@Work secure browser.

Does an app developer need to do anything different to enable the app to be AppConnect ready?
Mobile Apps can be made AppConnect enabled by either using the AppConnect SDK or wrapper for iOS and the AppConnect wrapper for Android.

What is Web@Work?
Web@Work is an Enterprise Mobile Browser that enables immediate, secure access to internal websites and web applications, while preserving a native and high-fidelity web browsing experience.

What is MyPhone@Work?
MyPhone@Work is the employee's interface to MobileIron, and operates in conjunction with the VSP and Sentry. It can be accessed in two ways: through a web browser or through the MobileIron application on the employee's smart device. With MyPhone@Work an employee can perform basic administrative tasks without contacting the IT department, such as registering new devices and wiping lost devices. On iOS and Android, MyPhone@Work provides an enterprise app storefront for the discovery and distribution of enterprise apps and the recommendation of external third-party apps.

What is the Enterprise App Storefront?
The MobileIron enterprise app storefront provides the employee a catalog of mobile applications tailored to the needs of the enterprise. These apps are either approved by IT and available in commercial app stores or created by IT for internal business use. When the enterprise app storefront is on a device registered with MobileIron, it is tied to a specific user so the user can discover applications easily and IT can secure the distribution of enterprise apps.

Why is preserving the “native experience” important?
“Native experience” refers to the particular design choices, user interaction paradigms, and feature sets chosen by operating system developers to promote and enhance their respective platforms. It is these “native” features that make a Blackberry a Blackberry and an iPhone an iPhone.
A crucial factor in the use and adoption of mobile technology are these individual design decisions and interfaces chosen by operating system developers and embraced by users.
For example the native experience of the iPhone includes the Apple email app for communication, the Safari app for browsing, the iTunes app for media, and the ability to download a wide range of other apps to the device. If the user can’t use these features, they can’t take advantage of the full potential of the device and will generally be unhappy.
There are mobile device management solutions that do not preserve the native experience because they create an artificial, closed environment on the device. Users are forced to use enterprise capabilities only within this closed environment -- email, browsing and apps are limited to what’s in this walled garden, detracting from the user experience. In addition, these “container-based” solutions often don’t follow industry standards.

Why is jailbreak and root detection important?
To jailbreak (or root) a phone circumvents the built-in security and protection of the operating system, opening up the phone to malware and unsupported uses. Jailbroken devices also allow any application to be installed on the phone and malicious applications to steal contacts and corporate data.

Why is having an application (or agent) on the device important?
An application (or agent) is a piece of software that is installed on a user’s device. In order to detect jailbroken devices — and thus keep corporate data secure — smart devices must have an agent on the device itself, and the agent must be part of the registration process to ensure that the agent and device is identified with a specific enterprise user.
The agent also can check the device and analyze its current state, monitoring for compliance with corporate policies. Without an agent, the device could be compliant during the initial registration process but non-compliant later. Based on the current state of the device, the agent can block the device from corporate resources and send alerts.


Why is having an enterprise app store important?
An enterprise app store is similar to other app stores, but tailor-made to the needs of a corporation by providing a centralized location for business applications. These applications can be ones that are already readily available in other app stores, or ones that have been created by the enterprise for internal use.
When the enterprise app store is on a registered device and tied to a specific user, not only can the user discover applications easily, but they can also be notified of the apps that are appropriate while keeping inappropriate ones from the user.
What is the Trust/Verify Model?
Lockdown security models fail in mobile because they damage the user experience. MobileIron introduces a less autocratic and more sustainable model of security: IT sets the central policy and then monitors devices for compliance. When a device falls out of compliance, IT can take several remediation actions including notifying the user, blocking access to the enterprise, or wiping the mobile device.

Can you restrict voice, SMS, and data?
No, because most operating systems do not allow it. Restricting voice calls also introduces liability in an emergency situation. Instead, the MobileIron solution allows administrators to set thresholds and usage caps for any time period, and provides real-time event monitoring and warning of non-compliance.

Can you prevent or force OS upgrades?
No, because most operating systems do not allow it. Instead, the MobileIron solution allows for real-time insight into operating system version (and policy compliance, including whether a phone is jailbroken/rooted) and informs administrators of non-compliance.
However, administrators can set policies based on OS version and block certain versions from accessing enterprise resources.

Can you prevent or force application installation or removal?
No, because most operating systems do not allow it. It is not in the interest of the OS vendor to restrict what applications can be installed on the device. Instead, MobileIron allows monitoring of applications that are installed on a device and inform administrators and users of non-compliance. The VSP comes pre-loaded with certain bad strings (like "porn") and disallow apps with those titles.
Please note that web-clips are not applications, though they appear similar; web-clips, in contrast to apps, may be forcibly removed or installed at will.

Can you filter web access?
Yes, iOS 6 devices supervised by Apple's Configurator tool can be configured to globally use a third-party HTTP proxy

How does single sign on work for Apps?
MobileIron provides time-based app-level sign-on across all applications secured using the AppConnect platform.

How do you make sure a rogue app does not capture corporate data?
MobileIron AppConnect encrypts and stores all AppConnect Enabled (ACe) app data in a virtual container on the device. Rogue applications cannot access the data stored in the virtual container. In addition IT administrators can also define policy on how data is shared between ACe applications.
What is the difference between the virtual and physical VSP?
The virtual VSP is a software image downloaded from the MobileIron Support website that can be installed on customer-owned servers. MobileIron supports VMware ESX. The physical VSP is a standalone hardware appliance that ships with VSP software already installed.

What is the difference between the standalone and integrated Sentry?
Standalone Sentry sits inline between the mobile device and the email server. It may be deployed as either a virtual or physical appliance. Integrated Sentry, which only supports Exchange 2007 and 2010, does not sit inline and is instead installed on the ActiveSync server. For most customers, standalone Sentry is the preferred option because it provides greater access control across a greater variety of email systems.
The Standalone Sentry acts as a proxy between clients and the mail infrastructure.
Integrated Sentry is a Windows service that connects the Microsoft Exchange Server ActiveSync service and the Mobile Iron VSP.
The Integrated Sentry can be installed on a Windows 7 or Windows 2008R2 server, or a Windows 2003 server with Power shell 2.0 and .NET 3.5 installed. There is no need for Exchange Management tools to be installed on that machine. However, you need to set up a local or remote support depending on the targeted server (i.e., Local Exchange).

What is the difference between MobileIron's on-premise and cloud solution?
The MobileIron Connected Cloud solutions is a subscription-based SaaS offering that gives customers all VSP features and functionality without the need to install the MobileIron solution in a data center. For an on-premise MobileIron VSP installation, the appliance must reside at an in-house data center or third-party datacenter.

What is the difference between a perpetual license and subscription license?
MobileIron software can be purchased as either a perpetual license with an additional annual support fee, or as a monthly subscription that includes support.

What is the difference between professional services and independent installation?
MobileIron and its partners offers a variety of professional services for guided assistance in installing the MobileIron solution, including training and deployment services.

Do you support delegated admin?
Customers can use Atlas, Mobile Iron’s advanced management and reporting tool for delegated admin features.
Do you replace BES?
No. The MobileIron solution is complementary to BES (BlackBerry Enterprise Server), providing additional features such as real-time telecom expense monitoring.

Do you replace ActiveSync?
No. The MobileIron solution is complementary to ActiveSync. ActiveSync mobilizes email and provides a handful of basic management settings. MobileIron provides advanced device management, security, and application management.

How does the client-side application work?
On platforms like iOS and Android, MobileIron makes available a client application that resides on the employee's device. The application allows employee access to MyPhone@Work, enabling the employee to communicate with IT, but also provides real-time application, usage, and security insight into the phone.
Where possible, the application runs unobtrusively in the background. Battery impact, space and memory usage are nominal. Since many platforms do not prevent application removal, the MobileIron VSP automatically notifies an IT administrator if the client application has been removed from the employee's phone.

Which encryption methods are used and supported?
MobileIron does not provide encryption and is agnostic to native encryption methods. Depending on the operating system, MobileIron is able to create and enforce polices based on the encryption status.

Can you perform selective wipe and restore?
Yes. MobileIron can wipe and restore corporate data while keeping employee data intact.

Can you perform jailbreak/root detection?
Yes. MobileIron can detect if an iOS or Android device has been compromised and can block the device from accessing corporate resources.

Can you provide a secure app store?
Yes. MobileIron can determine whether or not the device is compliant with security polices at any given moment in time, ensuring that the app store and the apps only appear on devices that meet enterprise standards.

What are policies and how do you use them?
Policies are a set of rules the VSP uses to secure, manage and regulate the behavior of the smart devices. One example is a policy that blocks a device from enterprise resources if it is rooted or jailbroken.


What is an alert?
An alert is a notification that is sent to a device and is triggered by a policy rule. It can be a notification using native OS capabilities, a text message or a badge that appears on the MobileIron icon. One example of an alert would be a notification that the device has a banned app installed.

What can you do over the air?
"Over the air" is remote configuration with no physical connection from the employee device to a computer server. Any data transfer occurs over wireless (WiFi or 3G). In this mode MobileIron can provision, wipe, encrypt and lock phones, but cannot backup data or upgrade the OS. This limitation is in the process of being addressed by various OS vendors.

What can you push?
To "push" means to send data or configurations to an employee's device without the employee having to take an action. MobileIron pushes security settings, application configurations and profiles. Note that no management platform can push applications to iOS or Android devices without the user’s permission, though MobileIron does publish the catalog of available apps to the user and then provisions the app at the user’s request.
