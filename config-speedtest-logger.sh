#!/bin/bash

LOGROTATE_D='/etc/logrotate.d'
filename='/var/log/speedtest-cli.log'

if [ $UID == 0 ]; then

    # add a logrotate.d entry for our new log file
    echo -e "$filename { \n\tcreate 0600 root root\n\trotate 4\n\tmonthly\n\tmissingok\n\tnotifempty\n}" > $LOGROTATE_D/speedtest-logger
    
    # create the file
    touch /var/log/speedtest-cli.log
    
    # Our file exists in the system-wide log directory,
    # to which only root can write by default. Applying 
    # the sticky bit operator [chmod +t] allows logging
    # of invoncatinos by all users, regardless of admin
    # status, while still preventing its deletion (and 
    # therefore causing  the deconfiguration of 
    # speedtest-logger in its original context) by anyone
    # other than its creator (root).
    
    # give write access and apply the stick bit       
    chmod gu+rwt /var/log/speedtest-cli.log

    # make speedtest-logger accessible to everyone
    cp speedtest-logger.sh /usr/local/bin/speedtest-logger
    chmod +x /usr/local/bin/speedtest-logger
    
    cp config-speedtest-logger.sh /usr/local/bin/config-speedtest-logger
    chmod +x  /usr/local/bin/config-speedtest-logger
    
    echo " /var/log/speedtest-cli.log created with mode 1666          "
    echo " speedtest-logger successfully configured.                  "
    echo " Note that all invocations of speedtest-logger, regardless  "
    echo " regardless of the user's administrative status, will be    "
    echo " logged in the system log directory by default. To change   "
    echo " this, run 'sudo chmod gu-wt'                               "  
    
    exit 0
    
    else
        echo "Only root can run this script!"
        
        exit 1
fi
