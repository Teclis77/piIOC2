#!../../bin/linux-x86_64/piIOC2

#- SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#-
#- SPDX-License-Identifier: EPICS

#- You may have to change piIOC2 to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

epicsEnvSet ("STREAM_PROTOCOL_PATH", "${TOP}/db")
epicsEnvSet ("PORT_PI2_CTS", "serial_pi_2")

## Register all support components
dbLoadDatabase "dbd/piIOC2.dbd"
piIOC2_registerRecordDeviceDriver pdbbase

drvAsynIPPortConfigure($(PORT_PI2_CTS), "100.100.0.11:4003")
asynOctetSetInputEos($(PORT_PI2_CTS),0,"\n")
asynOctetSetOutputEos($(PORT_PI2_CTS),0,"\n")

asynSetTraceMask($(PORT_PI2_CTS),-1,0x9);
asynSetTraceIOMask($(PORT_PI2_CTS),-1,0x2)

## Load record instances
#dbLoadRecords("db/piIOC2.db","user=xlabsrv2")

dbLoadTemplate("db/piIOC2.val")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=xlabsrv2"
