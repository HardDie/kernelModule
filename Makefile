obj-m := main.o

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

default: compile install

compile:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

install:
	mv *.o .*.cmd *.ko *.mod.c *.order *.symvers .tmp_* bin/

clean:
	rm -rf bin/*
