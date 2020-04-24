/*
 * ledoutput
 *
 * Copyright (C) 2017 AbbeyCat (abbeycatuk@gmail.com)
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */



#ifndef GPIO_H
#define GPIO_H



	void gpio_configure_for_output	( unsigned int pin );
	void gpio_set					( unsigned int pin, unsigned int value );


#endif
