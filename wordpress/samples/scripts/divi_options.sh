#!/bin/bash

# Product Tour
if [ ! -z "$PRODUCT_TOUR" ]; then
	p='on'
	if [ "$PRODUCT_TOUR" == false ] || [ "$PRODUCT_TOUR" == "off" ]; then 
		p='off' 
	fi
	wp eval '$o = get_option("et_divi"); $o["et_pb_product_tour_global"] = '"'$p'"'; update_option("et_divi", $o ); ' --path=$WEB_ROOT --allow-root
fi

# Enable The Latest Divi Builder Experience
if [ ! -z "$NEW_BUILDER_EXPERIENCE" ]; then
	p='on'
	if [ "$NEW_BUILDER_EXPERIENCE" == false ] || [ "$NEW_BUILDER_EXPERIENCE" == "off" ]; then 
		p='off' 
	fi
	wp eval '$o = get_option("et_bfb_settings"); $o["enable_bfb"] = '"'$p'"'; update_option("et_bfb_settings", $o ); ' --path=$WEB_ROOT --allow-root
fi

# Enable Classic Editor
if [ ! -z "$CLASSIC_EDITOR" ]; then
	p='on'
	if [ "$CLASSIC_EDITOR" == false ] || [ "$CLASSIC_EDITOR" == "off" ]; then 
		p='off' 
	fi
	wp eval '$o = get_option("et_divi"); $o["et_enable_classic_editor"] = '"'$p'"'; update_option("et_divi", $o ); ' --path=$WEB_ROOT --allow-root
fi