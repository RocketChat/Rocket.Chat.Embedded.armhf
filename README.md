# Rocket.Chat deployment (on Raspberry Pi and compatible ARMHF 32bit SoC servers)

DevOps for deploying Rocket.Chat 1.0+ on ARMHF (32 bit) SoC systems and servers.   

Including:
* snap suitable for installation on Raspberry Pi
* docker (possibly kubernetes) support 

This project will be maintained independently of the main Rocket.Chat build, until the end of life of 32 bit ARMHF SoC boards - mainly the Raspberry Pi.

Decision has been made NOT to merge with mainstream snapcraft build files for the following reason:

1) inconsistency in support of Mongo makes one-file-fit-all impossible
2) inconsistency in naming of architecture --  armhf  armv7  armv7l and so on
3) including ARMHF support branching within the snapcraft file often introduces problems and bugs in mainstream x86 builds
4) due to the need to build fibres and sharp library natively - snap build *must* be executed on ARMHF hardware - no known robust emulator is available publicly 
5) End of Life for ARMHF or 32 bit support is quickly arriving; with the latest Raspberry Pi 3+ already supporting full 64bit OSes

## snap and docker

The `snap` directory contains working and tested source to build a Rocket.Chat 1.0 snap for ARMHF 32 bit server on Raspberry Pi or other SoC boards.

The `docker` directory contains working and tested source files to build mongodb and Rocket.Chat docker images for ARMHF 32bit servers.  It also contains a tested docker-compose file for starting mongo, initializing replicaset and oplog, and starting the Rocket.Chat server.
