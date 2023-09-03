ifneq ($(KERNELRELEASE),)
# kbuild part of makefile
obj-m := spidev.o

else
# normal makefile
KDIR ?= /lib/modules/`uname -r`/build

default:
	make -C $(KDIR) M=$$PWD

modules_install:
	cp *.ko  /lib/modules/`uname -r`/kernel
	depmod

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

endif
