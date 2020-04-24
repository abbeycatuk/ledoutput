/*
 * ledoutput
 *
 * Copyright (C) 2017 AbbeyCat (abbeycatuk@gmail.com)
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */



#ifndef DEFINE_H
#define DEFINE_H



	/*
	 * raspberry pi 3 peripheral base address
	 */
	#define		ARM_PERIPHERAL_BASE_ADDRESS						0x3f000000



	/*
	 * gpio
	 */
	#define		ARM_GPIO_BASE									( ARM_PERIPHERAL_BASE_ADDRESS + 0x00200000 )

	#define		ARM_GPIO_FUNCTION_SELECT_REGISTERS				( ARM_GPIO_BASE + 0x00 )

	#define		ARM_GPIO_SET_REGISTER							( ARM_GPIO_BASE + 0x1c )
	#define		ARM_GPIO_CLEAR_REGISTER							( ARM_GPIO_BASE + 0x28 )

	#define		GPIO_DATA										23 /* GPIO 23 = physical pin 16 */
	#define		GPIO_CLOCK										24 /* GPIO 24 = physical pin 18 */
	#define		HIGH											1
	#define		LOW												0



	/*
	 * blinkt
	 */
	#define		NUMBER_OF_LEDS									8



#endif /*DEFINE_H*/
