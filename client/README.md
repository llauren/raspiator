# Client bits

## client.rc

Settings file for the Raspiator client. Currently holds the DISPLAY (for X) and
when to switch the screen saver on and off.

## screensaver-control

screensaver-control is used for scheduling the DPMS screensaver. The system
assumes that the monitor connected is DPMS capable; a sensible default if you
don't want to burn out your display prematurely (you can of course set the day
to begin and end so that the screen never goes out). The schedule is set from
the `client.rc` file. It's possible to "work weekends", where "weekends" are
currently defined as saturdays and sundays (apologies for my cultural
insensitivity). 

`screensaver-control` is supposed to be run from cron every few minutes. I do
not know if this creates unnecessary stress to the Raspberry Pi or its SD card,
or if the stress induced is of any relevance.
