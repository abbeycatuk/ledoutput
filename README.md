ledoutput
=========

Demonstrates use of the Blinkt! for fast and easy access to a simple LED output medium.

This project is built around the Raspberry Pi 3.

building
--------

The makefile should be updated to identify the location of all relevant build tools (gcc, as, ld, objdump, objcopy, find):

```makefile
GCC     = /usr/local/gcc-arm-none-eabi-4_9-2014q4/bin/arm-none-eabi-gcc
AS      = /usr/local/gcc-arm-none-eabi-4_9-2014q4/bin/arm-none-eabi-as
LD      = /usr/local/gcc-arm-none-eabi-4_9-2014q4/bin/arm-none-eabi-ld
OBJDUMP = /usr/local/gcc-arm-none-eabi-4_9-2014q4/bin/arm-none-eabi-objdump
OBJCOPY = /usr/local/gcc-arm-none-eabi-4_9-2014q4/bin/arm-none-eabi-objcopy
RM	  	= rm
MKDIR   = mkdir
```

---

*Copyright (C) 2017 AbbeyCat (abbeycatuk@gmail.com)*

*This software may be modified and distributed under the terms*
*of the MIT license.  See the LICENSE file for details.*
