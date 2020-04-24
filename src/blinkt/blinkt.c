/*
 * ledoutput
 *
 * Copyright (C) 2017 AbbeyCat (abbeycatuk@gmail.com)
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */



#include "blinkt.h"
#include "gpio/gpio.h"
#include "define.h"


typedef struct led
{
	unsigned int brightness, red, green, blue;
} led;

led leds[8];


/*
 * blinkt_init
 */
void blinkt_init( void )
{

	/* enable for output both GPIO 23 (data) and GPIO 24 (clock) */
	gpio_configure_for_output( GPIO_DATA  );
	gpio_configure_for_output( GPIO_CLOCK );

	/* prepare the brightness and RGB settings of each LED (simple rainbow for test) */
	leds[ 0 ] = (led) { .brightness = 0x01, .red = 0xff, .green = 0x00, .blue = 0x00 };
	leds[ 1 ] = (led) { .brightness = 0x01, .red = 0xff, .green = 0x4f, .blue = 0x00 };
	leds[ 2 ] = (led) { .brightness = 0x01, .red = 0xff, .green = 0xff, .blue = 0x00 };
	leds[ 3 ] = (led) { .brightness = 0x01, .red = 0x00, .green = 0xff, .blue = 0x00 };
	leds[ 4 ] = (led) { .brightness = 0x01, .red = 0x00, .green = 0x00, .blue = 0xff };
	leds[ 5 ] = (led) { .brightness = 0x01, .red = 0x4b, .green = 0x00, .blue = 0x82 };
	leds[ 6 ] = (led) { .brightness = 0x01, .red = 0x94, .green = 0x00, .blue = 0xd3 };
	leds[ 7 ] = (led) { .brightness = 0x01, .red = 0xff, .green = 0xff, .blue = 0xff };

	/* start frame */
	blinkt_send_sof();

}



/*
 * blinkt_send_sof
 */
void blinkt_send_sof( void )
{

	/*
	 * put the blinkt into a "ready" state by
	 * - sending 32 zeroes to indicate "ready" state, and
	 * - sending an extra bit per LED pair, flushing existing state
	 */
	blinkt_send_bit( LOW, 32 + NUMBER_OF_LEDS / 2 );

}



/*
 * blinkt_test
 */
void blinkt_test( void )
{

	unsigned int i;

	/* send a word defining the state of each LED */
	for ( i = 0; i < NUMBER_OF_LEDS; i++ )
	{
		/* format: 0b111[Br:5][B:8][G:8][R:8] */
		blinkt_send_word( ( 0b111 << 30 ) + ( leds[ i ].brightness << 24 ) + ( leds[ i ].blue << 16 ) + ( leds[ i ].green << 8 ) + leds[ i ].red );
	}

	/* prepare for next frame */
	blinkt_send_sof();

}



/*
 * blinkt_send_word
 */
void blinkt_send_word( unsigned int word )
{

	unsigned int i;

	/* set the data, and then cycle the clock to register it */
	for ( i = 0; i < 32; i++ )
	{
		gpio_set( GPIO_DATA, ( ( word >> (31-i) ) & 1 ) ? HIGH : LOW );
		gpio_set( GPIO_CLOCK, HIGH );
		gpio_set( GPIO_CLOCK, LOW  );
	}

}



/*
 * blinkt_send_bit
 */
void blinkt_send_bit( unsigned int bit, unsigned int n )
{

	/* set the data, then cycle the clock n times */
	gpio_set( GPIO_DATA, bit );
	while ( n-- )
	{
		gpio_set( GPIO_CLOCK, HIGH );
		gpio_set( GPIO_CLOCK, LOW  );
	}

}
