#netstat Command Usage on Linux

netstat (network statistics) is a command-line tool that displays network connections (both incoming and outgoing), routing tables, and a number of network interface statistics. It is available on Unix, Unix-like, and Windows NT-based operating systems.

<b>To View Only Established Connection</b>

netstat -natu | grep 'ESTABLISHED'

<b>To View Only Connection are in Listen Status</b>

netstat -an | grep 'LISTEN'

<b>To View Port Number used by PID</b></b>

netstat -anlp | grep $PID

<b>Show statistics for all protocols</b>

netstat -s

<b>Show kernel routing information</b>

netstat -r

<b>Show which process using particular port</b>

netstat -anlp | grep portnumber

AIX : # netstat -Aan | grep portnumber  (This will display address of Protocol Control Block in hexdecimal)

Once you have hexdecimal then can execute below to get wich process is holding port number.

rmsock $address_of_pcb tcpcb

<b>Show the list of network interfaces</b>

netstat -i
