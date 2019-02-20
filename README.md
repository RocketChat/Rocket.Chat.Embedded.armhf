# armhf deployment support for Rocket.Chat  (Raspberry Pi and compatible servers)

Files for deploying Rocket.Chat on ARMHF (32 bit) SoC systems and servers.   Including:

* snap suitable for installation on Raspberry Pi
* docker and kubernetes support 

This project will be maintained independently of the main Rocket.Chat build, until the end of life of 32 bit ARMHF SoC boards - mainly the Raspberry Pi.

Decision has been made NOT to merge with mainstream snapcraft build files for the following reason:

1) inconsistency in support of Mongo makes one-file-fit-all impossible
2) inconsistency in naming of architecture --  armhf  armv7  armv7l and so on
3) including ARMHF support branching within the snapcraft file often introduces problems and bugs in mainstream x86 builds
4) due to the need to build fibres and sharp library natively - snap build *must* be executed on ARMHF hardware - no known robust emulator is available publicly 
5) End of Life for ARMHF or 32 bit support is quickly arriving; with the latest Raspberry Pi 3+ already supporting full 64bit OSes

