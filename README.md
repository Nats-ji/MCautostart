# MCautostart
Simple bash script to auto restarting Minecraft server when it crash.

## Installation
1. Copy `MCautostart.sh` to some place on server.
1. Add script to crontab, by running `crontab -e` command. Example entry below.
```
*/5 * * * * bash /home/minecraft/MCautostarter/MCautostart.sh
```

## Configuration
Script contains some predefined variables, which should be modified for every server.
* `MCPATH` - full path to instalation folder of minecraft
* `MCRUNSCRIPT` - script which will be fired to run minecraft
* `MCNAME` - name which distinguishe minecraft from process list. Best would be jar file name. E.g. `FTBserver-1.10.2-12.18.3.2316-universal.jar`
* `LOCK` - name of the lock file, which prevents of running script twice
* `SCREENNAME` - screen where minceraft is running