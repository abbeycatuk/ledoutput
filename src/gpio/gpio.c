/*
 * ledoutput
 *
 * Copyright (C) 2017 AbbeyCat (abbeycatuk@gmail.com)
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */



#include "define.h"
#include "gpio.h"



extern void 			put_word( unsigned int *, unsigned int );
extern unsigned int		get_word( unsigned int * );



/*
 * gpio_configure_for_output
 */
void gpio_configure_for_output( unsigned int pin )
{

	unsigned int *address;
	unsigned int value, shift;

	/* calculate the address and shift position */
	address  = (unsigned int *) ARM_GPIO_FUNCTION_SELECT_REGISTERS;
	address += ( pin / 10 );
	shift    = ( pin % 10 ) * 3;

	/* mask out the relevant bits, and then set only the first bit (indicating "pin is for output") */
	value = get_word( address );
	value &= ~( 0b111 << shift );
	value |=  ( 0b001 << shift );
	put_word( address, value );

	/* once configured, start pin from a known (low) state */
	gpio_set( pin, LOW );

}



/*
 * gpio_set
 */
void gpio_set( unsigned int pin, unsigned int value )
{

	unsigned int *address;

	address = (unsigned int *) ( value ? ARM_GPIO_SET_REGISTER : ARM_GPIO_CLEAR_REGISTER );
	put_word( address, 1 << pin );

}

