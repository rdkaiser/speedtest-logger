#! /bin/bash

SPEEDTEST_CLI='/usr/local/bin/speedtest-cli'
filename='/var/log/speedtest-cli.log'
IPAddress=$(curl -s ifconfig.me)
HostName=$(host $IPAddress | awk '{print $5}')

# All invocations will be logged in the normally write-restriced
# system log directory, regardless of administrative status, 
# provieded that this script is properly configued, i.e. the file 
# exists with mode 1666. 

if [ -w  $filename ]; then
    
    echo $(date) >> $filename
    echo $IPAddress >> $filename
    echo $HostName >> $filename
    
    $SPEEDTEST_CLI --simple >> $filename 
   
    exit 0
    
    else 
        echo " Either you don't have the proper permissions to run this script or     "
        echo " it is not properly configured. Please run sudo config-speedtest-logger "
        echo " to reconfigure or contact your local system administrator.             "
        echo " writing to stdout..."
        
        $SPEDTEST_CLI 
        
        exit 1
fi
