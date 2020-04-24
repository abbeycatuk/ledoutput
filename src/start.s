/*
 * ledoutput
 *
 * Copyright (C) 2017 AbbeyCat (abbeycatuk@gmail.com)
 *
 * This software may be modified and distributed under the terms
 * of the MIT license. See the LICENSE file for details.
 */



#include "define.h"



.global  					_start
.global 					put_word
.global 					get_word



.section 					.init



_start:
configure_stack:			LDR 		sp			, top_of_stack
							BL			blinkt_init
							BL			blinkt_test
infinite_loop:				B			infinite_loop



top_of_stack:				.word		stack + 256
stack:						.skip		256



put_word:					STR 		r1			, [r0]
    						BX 			lr



get_word:					LDR 		r0			, [r0]
    						BX 			lr
