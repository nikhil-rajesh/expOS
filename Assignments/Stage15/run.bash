#!/bin/bash
. ../../load_env.bash
shopt -s expand_aliases

xi fdisk

spl os_startup.spl
xi load --os os_startup.xsm
rm os_startup.xsm

spl BOOT_MODULE.spl
xi load --module 7 BOOT_MODULE.xsm
rm BOOT_MODULE.xsm

spl SCHEDULER.spl
xi load --module 5 SCHEDULER.xsm
rm SCHEDULER.xsm

spl DEVICE_MANAGER.spl
xi load --module 4 DEVICE_MANAGER.xsm
rm DEVICE_MANAGER.xsm

spl RESOURCE_MANAGER.spl
xi load --module 0 RESOURCE_MANAGER.xsm
rm RESOURCE_MANAGER.xsm

spl haltprog.spl
xi load --exhandler haltprog.xsm
rm haltprog.xsm

spl int10.spl
xi load --int=10 int10.xsm
rm int10.xsm

expl even100.expl
xi load --exec even100.xsm
rm even100.xsm

expl odd100.expl
xi load --init odd100.xsm
rm odd100.xsm

spl int7.spl
xi load --int=7 int7.xsm
rm int7.xsm

spl timer.spl
xi load --int=timer timer.xsm
rm timer.xsm

xi load --library $OS_LAB_PROJ_DIR/myexpos/expl/library.lib

expl idle.expl 
xi load --idle idle.xsm
rm idle.xsm

Xsm
