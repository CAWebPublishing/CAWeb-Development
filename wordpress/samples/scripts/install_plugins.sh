#!/bin/bash

# Remove default WP Plugins
wp plugin delete akismet --path=$WEB_ROOT --allow-root
wp plugin delete hello --path=$WEB_ROOT --allow-root

# List of CAWeb Approved Plugins
declare -a plugins=( "classic-editor" "wpforms-lite")

for plugin in "${plugins[@]}"
	do
		# Install CAWeb Approved Plugins
		wp plugin install $plugin --activate --path=$WEB_ROOT --allow-root
	done

