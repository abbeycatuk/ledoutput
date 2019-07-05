OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")		/* Define supported output formats - elf32-littlearm default */
OUTPUT_ARCH(arm)														/* Define the target architecture */
ENTRY(_start)															/* Define the system entry point */

SECTIONS
{

	PROVIDE ( base = 0x00008000 );
	
	.init base : {
       	PROVIDE (__init_start = .);
		*(.init)
	}
	
    .text :
    {
       	PROVIDE (__text_start = .);
        *(.text); 
    }

    .data :
    {
       	PROVIDE (__data_start = .);
        *(.data); 
    }

    .bss :
    {
      	PROVIDE (__bss_start = .);
        *(.bss) *(COMMON); 
    }

    /* Define linker variable to reference end address of this section */
    PROVIDE (end   = .);
    PROVIDE (__end = .);

}
