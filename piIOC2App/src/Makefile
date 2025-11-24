# SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#
# SPDX-License-Identifier: EPICS

TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = piIOC2
# piIOC2.dbd will be created and installed
DBD += piIOC2.dbd

# piIOC2.dbd will be made up from these files:
piIOC2_DBD += base.dbd

# Include dbd files from all support applications:
#piIOC2_DBD += xxx.dbd
piIOC2_DBD += stream-base.dbd
piIOC2_DBD += drvAsynIPPort.dbd
piIOC2_DBD += asyn.dbd
piIOC2_DBD += calc.dbd

# Add all the support libraries needed by this IOC
#piIOC2_LIBS += xxx
piIOC2_LIBS += stream
piIOC2_LIBS += asyn
piIOC2_LIBS += calc

# piIOC2_registerRecordDeviceDriver.cpp derives from piIOC2.dbd
piIOC2_SRCS += piIOC2_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
piIOC2_SRCS_DEFAULT += piIOC2Main.cpp
piIOC2_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#piIOC2_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

ifdef EPICS_QSRV_MAJOR_VERSION
    piIOC2_LIBS += qsrv
    piIOC2_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    piIOC2_DBD += PVAServerRegister.dbd
    piIOC2_DBD += qsrv.dbd
endif

# Finally link to the EPICS Base libraries
piIOC2_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

