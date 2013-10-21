speedtest-logger
----------------
A bash script that logs the current IP Address, hostname, and download/upload speed with a timestamp.


To confugure with some convenient settings, make config-speedtest-logger executable and invoke.

The script config-speedtest-logger is completely optional. It is merely a tool to ease the
configuration of some convenient settings. Feel free to modify it according to your needs.

If you choose to use the config script, make sure logrotate is installed and $LOGROTATE_D
points to the correct location. On most Debian/Ubuntu installatons the default location should suffice.

By default, output is written to /var/log/speedtest-cli.log, regardless of a user's administrative
status, provided it has been properly configured with config-speedtest-logger.

Change $filename if you want to write to a different path.
Remove the sticky bit applied to the output file by the config script to prevent logging of
speedtest-logger invocations without administrative privileges. 

You also might need to adjust the variable $SPEEDTEST_CLI.
However, if you installed speedtest-cli using setup.py on most Debian/Ubuntu installatons the default should be correct.


Dependencies
------------
- [speedtest-cli] (https://github.com/sivel/speedtest-cli.git)
- python

Recommended
-----------
- logrotate
