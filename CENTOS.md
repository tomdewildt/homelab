# CentOS
Use the following guide to setup the individual hosts of the cluster. This guide contains settings for language, date/time, storage and networking.

[CentOS ISO](http://ftp.tudelft.nl/centos.org/7.7.1908/isos/x86_64/)

### Language

1. Select ```English (United States)``` as the language.

### Date/Time

1. Set the region to ```Europe```.
2. Set the city to ```Amsterdam```.
3. Remove all existing ntp servers.
4. Add ```10.20.0.1``` as the main ntp server.
5. Leave the rest of the settings at their default values and click done.

### Storage

1. Select the disk you want to use for CentOS and tick the ```I will configure partitioning``` box.
2. Leave the rest of the settings at their default values and click done.
3. Click the ```Click here to create them automatically``` button to create the base partitions.
4. Set the file system for the ```/home```, ```/boot``` and ```/``` partition to ```ext4``` and click update settings.
5. Add a new partition. Use ```/data``` as the mount point and ```100 GiB``` as the capacity for masters or ```1250 GiB``` as the capacity for workers.
6. Set the file system for the ```/data``` partition to ```ext4``` and click update settings.
7. Resize the home partition to take up the remaining space of the drive.
8. Leave the rest of the settings at their default values and click done.

### Network

**Bond**

1. Set the hostname to ```[NAME].meijldoorn.nl```.
2. Add a new connection of type ```Bond```.
3. Use ```bond0``` as the connection and interface name.
4. Add the ethernet adapters that are part of the bond, use the following naming scheme ```bond0-slave0```.
5. In the IPv4 Settings tab set method to ```Manual``` and add a new address with netmask set to ```24```, gateway set to ```10.20.0.1``` and dns servers set to ```10.20.0.1```.
6. In the IPv6 Settings tab set method to ```Ignore```.
7. Leave the rest of the settings at their default values and click save.
