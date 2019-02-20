# pi-armhf-snap

Files for building ARMHF snaps suitable for installation on Raspberry Pi.

This project will be maintained independently of the main Rocket.Chat build, until the end of life of 32 bit ARMHF SoC boards - mainly the Raspberry Pi.

Decision has been made not to merge with mainstream snapcraft build files for the following reason:

1) inconsistency in support of Mongo makes one-file-fit-all impossible
2) inconsistency in naming of architecture --  armhf  armv7  armv7l and so on
3) including ARMHF support branching within the snapcraft file often introduces problems and bugs in mainstream x86 builds
4) due to the need to build fibres and sharp library natively - snap build *must* be executed on ARM HF hardware - no known robust emulator is available publicly 

