Disable /etc/ssh/sshd_config:

PermitRootLogin no


### Tasks
 
#### 1. Secure System
 
SSH into the AWS server using the key provided for the user **ubuntu**. Initial setup includes:
 
- a) disable ssh login for root
- b) disable ssh password based login
- c) create a user for yourself and include the user in the **sudo** group
- d) ensure that all the packages installed below are locked to the version installed, however,
security updates need to be installed on every run
- e) implement a firewall to restrict network access (ports only)
 
#### 2. Install required packages
 
Setup Mariadb 10+, PostgreSQL 9.4 and MongoDB. In Mariadb:
 
- a) create a secure root user login
- b) create a user (do not create a super user), create a database owned by that user
- c) allow remote access to the database created using the user above
- d) enforce ssl connection for the user (optional)
 
#### 3. System Monitoring
 
Install M/Monit on the server and ensure:
 
- a) all services created above are monitored
- b) Monit service is started automatically on port 9812
- c) secure Monit, to be visible only with credentials
 
#### 4. Setup secure static webservice (Optional)
 
Setup a secure welcome page:
 
- a) install and configure an nginx with a static sample page (take any basic html page), http
redirected to https
- b) using the dynamic dns solution (enlightNS.com) and the enlightns-cli from github, setup a
dynamically updated domain name for the server
- c) using letsencrypt, generate a valid ssl certificate for the subdomain above and setup the server
to auto-renew the certificate
- d) ensure that the https welcome page requires authentication to be visible to anyone, except those
requests coming from a 172.0.0.0/18 subnet
 
