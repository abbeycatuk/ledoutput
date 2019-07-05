#
# ledoutput
#
# Copyright (C) 2017 AbbeyCat (abbeycatuk@gmail.com)
#
# This software may be modified and distributed under the terms
# of the MIT license. See the LICENSE file for details.
#



GCC     = /usr/local/gcc-arm-none-eabi-4_9-2014q4/bin/arm-none-eabi-gcc
AS      = /usr/local/gcc-arm-none-eabi-4_9-2014q4/bin/arm-none-eabi-as
LD      = /usr/local/gcc-arm-none-eabi-4_9-2014q4/bin/arm-none-eabi-ld
OBJDUMP = /usr/local/gcc-arm-none-eabi-4_9-2014q4/bin/arm-none-eabi-objdump
OBJCOPY = /usr/local/gcc-arm-none-eabi-4_9-2014q4/bin/arm-none-eabi-objcopy
RM		= rm
MKDIR   = mkdir
GCCOPTS = -march=armv8-a -mtune=cortex-a53 -mfloat-abi=hard -Wall -O0 -nostdlib -nostartfiles -ffreestanding -mapcs-frame -mno-thumb-interwork -Isrc



clean:
	$(RM)    src/blinkt/blinkt.o
	$(RM)    src/gpio/gpio.o
	$(RM)    src/start.o
	$(RM)    -rf bin
	$(MKDIR) bin
	


all:

	$(GCC) -c -o src/start.o src/start.S
	$(GCC) -c -o src/blinkt/blinkt.o     $(GCCOPTS) src/blinkt/blinkt.c
	$(GCC) -c -o src/gpio/gpio.o         $(GCCOPTS) src/gpio/gpio.c

	$(LD) -o bin/kernel.elf linker.ld src/blinkt/blinkt.o src/gpio/gpio.o src/start.o

	$(OBJCOPY) bin/kernel.elf -O ihex   bin/kernel.hex
	$(OBJCOPY) bin/kernel.elf -O binary bin/kernel.img
	$(OBJDUMP) -D bin/kernel.elf >      bin/kernel.list
