EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
EXTRA_CFLAGS += -O1

EXTRA_CFLAGS += -Wno-unused-variable
EXTRA_CFLAGS += -Wno-unused-value
EXTRA_CFLAGS += -Wno-unused-label
EXTRA_CFLAGS += -Wno-unused-parameter
EXTRA_CFLAGS += -Wno-unused-function
EXTRA_CFLAGS += -Wno-unused


EXTRA_CFLAGS += -g -I$(src)/include


export TopDIR ?= $(shell pwd)



RTL871X = rtl8723b
MODULE_NAME = my8723bu


SUBARCH := $(shell uname -m | sed -e s/i.86/i386/ | sed -e s/ppc/powerpc/ | sed -e s/armv.l/arm/)
ARCH ?= $(SUBARCH)
CROSS_COMPILE ?=
KVER  := $(shell uname -r)
KSRC := /lib/modules/$(KVER)/build
MODDESTDIR := /lib/modules/$(KVER)/kernel/drivers/net/wireless/
INSTALL_PREFIX :=


ifneq ($(USER_MODULE_NAME),)
MODULE_NAME := $(USER_MODULE_NAME)
endif


ifneq ($(KERNELRELEASE),)


$(MODULE_NAME)-y +=  mac80211.o  rtl8723.o  rtl8723usb.o


obj-$(CONFIG_RTL8723BU) := $(MODULE_NAME).o

else

export CONFIG_RTL8723BU = m

all: modules

modules:
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KSRC) M=$(shell pwd)  modules

strip:
	$(CROSS_COMPILE)strip $(MODULE_NAME).ko --strip-unneeded

install:
	install -p -m 644 $(MODULE_NAME).ko  $(MODDESTDIR)
	/sbin/depmod -a ${KVER}

uninstall:
	rm -f $(MODDESTDIR)/$(MODULE_NAME).ko
	/sbin/depmod -a ${KVER}

config_r:
	@echo "make config"
	/bin/bash script/Configure script/config.in


.PHONY: modules clean

clean:
	cd hal ; rm -fr *.mod.c *.mod *.o .*.cmd */*.ko
	cd core ; rm -fr *.mod.c *.mod *.o .*.cmd *.ko
	cd os_dep ; rm -fr *.mod.c *.mod *.o .*.cmd *.ko
	cd platform ; rm -fr *.mod.c *.mod *.o .*.cmd *.ko
	rm -fr Module.symvers ; rm -fr Module.markers ; rm -fr modules.order
	rm -fr *.mod.c *.mod *.o .*.cmd *.ko *~
	rm -fr .tmp_versions
endif

