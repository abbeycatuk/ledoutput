/*
 * ledoutput
 *
 * Copyright (C) 2017 AbbeyCat (abbeycatuk@gmail.com)
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */



#ifndef BLINKT_H
#define BLINKT_H



	void blinkt_init		( void );
	void blinkt_test		( void );
	void blinkt_send_sof    ( void );
	void blinkt_send_word	( unsigned int word );
	void blinkt_send_bit 	( unsigned int bit, unsigned int n );



#endif
