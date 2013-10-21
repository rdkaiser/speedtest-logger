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
        echo " Either you don't have permission to run this script or your system    "
        echo " is not properly configured to run this script in its current context. "
        echo " Try running 'sudo config-speedtest-logger' to reconfigure your system "
        echo " or simply edit the variable 'filename' so that is points somewere to  " 
        echo " which you have write access.                                          "

        exit 1
fi
