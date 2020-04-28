#!/bin/bash

# State Template Version
if [ -n "$TEMPLATE_VER" ]; then
	wp option set 'ca_site_version' $TEMPLATE_VER --path=$WEB_ROOT --allow-root
fi

# Fav Icon
if [ -n "$FAV_ICON" ]; then
	wp option set 'ca_fav_ico' $FAV_ICON --path=$WEB_ROOT --allow-root
fi

# Header Menu Type
if [ -n "$NAV_MENU_STYLE" ]; then
	wp option set 'ca_default_navigation_menu' $NAV_MENU_STYLE --path=$WEB_ROOT --allow-root
fi

# Colorscheme
if [ -n "$COLORSCHEME" ]; then
	wp option set 'ca_site_color_scheme' $COLORSCHEME --path=$WEB_ROOT --allow-root
fi

# Title Display 
if [ -n "$TITLE_DISPLAY" ] && [ "$TITLE_DISPLAY" == true ]; then
	wp option set 'ca_default_post_title_display' $TITLE_DISPLAY --path=$WEB_ROOT --allow-root
fi

# Sticky Navigation
if [ -n "$STICKY_NAV" ] && [ "$STICKY_NAV" == true ]; then
	wp option set 'ca_sticky_navigation' $STICKY_NAV --path=$WEB_ROOT --allow-root
fi

# Menu Home Link
if [ -n "$MENU_HOME_LINK" ] && [ "$MENU_HOME_LINK" == true ]; then
	wp option set 'ca_home_nav_link' $MENU_HOME_LINK --path=$WEB_ROOT --allow-root
fi

# Display Date for non-Divi Posts
if [ -n "$DISPLAY_POSTS_DATE" ] && [ "$DISPLAY_POSTS_DATE" == true ]; then
	wp option set 'ca_default_post_date_display' $DISPLAY_POSTS_DATE --path=$WEB_ROOT --allow-root
fi

# Legacy Browser Support
if [ -n "$X_UA_COMPATIBILITY" ] && [ "$X_UA_COMPATIBILITY" == true ]; then
	wp option set 'ca_x_ua_compatibility' $X_UA_COMPATIBILITY --path=$WEB_ROOT --allow-root
fi

# Show Search on FrontPage
if [ -n "$FRONTPAGE_SEARCH" ] && [ "$FRONTPAGE_SEARCH" == true ]; then
	wp option set 'ca_frontpage_search_enabled' $FRONTPAGE_SEARCH --path=$WEB_ROOT --allow-root
fi

# Contact Us Page
if [ -n "$CONTACT_US_PAGE" ]; then
	wp option set 'ca_contact_us_link' $CONTACT_US_PAGE --path=$WEB_ROOT --allow-root
fi

# Enable Geo Locator
if [ -n "$GEO_LOCATOR" ] && [ "$GEO_LOCATOR" == true ]; then
	wp option set 'ca_geo_locator_enabled' $GEO_LOCATOR --path=$WEB_ROOT --allow-root
fi

# Utility Header Home Link
if [ -n "$UTILITY_HOME_LINK" ] && [ "$UTILITY_HOME_LINK" == true ]; then
	wp option set 'ca_utility_home_icon' $UTILITY_HOME_LINK --path=$WEB_ROOT --allow-root
fi

# Utility Header Custom Link 1 Enabled
if [ -n "$UTILITY_LINK1_ENABLED" ] && [ "$UTILITY_LINK1_ENABLED" == true ]; then
	wp option set 'ca_utility_link_1_enable' 'init' --path=$WEB_ROOT --allow-root
	wp option set 'ca_utility_link_1_enable' "$t" --path=$WEB_ROOT --allow-root
fi

# Utility Header Custom Link 1 Label
if [ -n "$UTILITY_LINK1_LABEL" ]; then
	wp option set 'ca_utility_link_1_name' $UTILITY_LINK1_LABEL --path=$WEB_ROOT --allow-root
fi

# Utility Header Custom Link 1 URL
if [ -n "$UTILITY_LINK1_URL" ]; then
	wp option set 'ca_utility_link_1' $UTILITY_LINK1_URL --path=$WEB_ROOT --allow-root
fi

# Utility Header Custom Link 1 Target
if [ -n "$UTILITY_LINK1_NEW_WINDOW" ] && [ "$UTILITY_LINK1_NEW_WINDOW" == true ]; then
	wp option set 'ca_utility_link_1_new_window' $UTILITY_LINK1_NEW_WINDOW --path=$WEB_ROOT --allow-root
fi

# Utility Header Custom Link 2 Enabled
if [ -n "$UTILITY_LINK2_ENABLED" ] && [ "$UTILITY_LINK2_ENABLED" == true ]; then
	wp option set 'ca_utility_link_2_enable' 'init' --path=$WEB_ROOT --allow-root
	wp option set 'ca_utility_link_2_enable' $UTILITY_LINK2_ENABLED --path=$WEB_ROOT --allow-root
fi

# Utility Header Custom Link 2 Label
if [ -n "$UTILITY_LINK2_LABEL" ]; then
	wp option set 'ca_utility_link_2_name' $UTILITY_LINK2_LABEL --path=$WEB_ROOT --allow-root
fi

# Utility Header Custom Link 2 URL
if [ -n "$UTILITY_LINK2_URL" ]; then
	wp option set 'ca_utility_link_2' $UTILITY_LINK2_URL --path=$WEB_ROOT --allow-root
fi

# Utility Header Custom Link 2 Target
if [ -n "$UTILITY_LINK2_NEW_WINDOW" ] && [ "$UTILITY_LINK2_NEW_WINDOW" == true ]; then
	wp option set 'ca_utility_link_2_new_window' $UTILITY_LINK2_NEW_WINDOW --path=$WEB_ROOT --allow-root
fi

# Utility Header Custom Link 3 Enabled
if [ -n "$UTILITY_LINK3_ENABLED" ] && [ "$UTILITY_LINK3_ENABLED" == true ]; then
	wp option set 'ca_utility_link_3_enable' 'init' --path=$WEB_ROOT --allow-root
	wp option set 'ca_utility_link_3_enable' $UTILITY_LINK3_ENABLED --path=$WEB_ROOT --allow-root
fi

# Utility Header Custom Link 3 Label
if [ -n "$UTILITY_LINK3_LABEL" ]; then
	wp option set 'ca_utility_link_3_name' $UTILITY_LINK3_LABEL --path=$WEB_ROOT --allow-root
fi

# Utility Header Custom Link 3 URL
if [ -n "$UTILITY_LINK3_URL" ]; then
	wp option set 'ca_utility_link_3' $UTILITY_LINK3_URL --path=$WEB_ROOT --allow-root
fi

# Utility Header Custom Link 3 Target
if [ -n "$UTILITY_LINK3_NEW_WINDOW" ] && [ "$UTILITY_LINK3_NEW_WINDOW" == true ]; then
	wp option set 'ca_utility_link_3_new_window' $UTILITY_LINK3_NEW_WINDOW --path=$WEB_ROOT --allow-root
fi

# Organization Logo-Brand
if [ -n "$ORG_LOGO" ]; then
	wp option set 'header_ca_branding' $ORG_LOGO --path=$WEB_ROOT --allow-root
fi

# Organization Logo-Brand Alt Text
if [ -n "$ORG_LOGO_ALT_TEXT" ]; then
	wp option set 'header_ca_branding_alt_text' "$ORG_LOGO_ALT_TEXT" --path=$WEB_ROOT --allow-root
fi

# Google Search ID
if [ -n "$SEARCH_ENGINE_ID" ]; then
	wp option set 'ca_google_search_id' $SEARCH_ENGINE_ID --path=$WEB_ROOT --allow-root
fi

# Google Analytics ID
if [ -n "$ANALYTICS_ID" ]; then
	wp option set 'ca_google_analytic_id' $ANALYTICS_ID --path=$WEB_ROOT --allow-root
fi

# Google Meta ID
if [ -n "$META_ID" ]; then
	wp option set 'ca_google_meta_id' $META_ID --path=$WEB_ROOT --allow-root
fi

# Google Translate
if [ -n "$TRANSLATE_MODE" ]; then
	wp option set 'ca_google_trans_enabled' $TRANSLATE_MODE --path=$WEB_ROOT --allow-root

	# Google Translate is Custom
	if [ "$TRANSLATE_MODE" == "custom" ]; then
		# Google Translate Page
		if [ -n "$TRANSLATE_PAGE" ]; then
			wp option set 'ca_google_trans_page' $TRANSLATE_PAGE --path=$WEB_ROOT --allow-root
		fi

		# Google Translate Page New Window
		if [ -n "$TRANSLATE_PAGE_NEW_WINDOW" ] && [ "$TRANSLATE_PAGE_NEW_WINDOW" == true ]; then
			wp option set 'ca_google_trans_page_new_window' $TRANSLATE_PAGE_NEW_WINDOW --path=$WEB_ROOT --allow-root
		fi

		# Google Translate Icon
		if [ -n "$TRANSLATE_ICON" ]; then
			wp option set 'ca_google_trans_icon' $TRANSLATE_ICON --path=$WEB_ROOT --allow-root
		fi

	fi
fi

# GitHub API Username
if [ -n "$CAWEB_GIT_USER" ]; then
	wp option set 'caweb_username' $CAWEB_GIT_USER --path=$WEB_ROOT --allow-root
fi

# GitHub Is Private Repo?
if [ -n "$CAWEB_PRIVATE_REPO" ] && [ "$CAWEB_PRIVATE_REPO" == true ]; then
	wp option set 'caweb_private_theme_enabled' $CAWEB_PRIVATE_REPO --path=$WEB_ROOT --allow-root
fi

# GitHub API Access Token
if [ -n "$CAWEB_ACCESS_TOKEN" ]; then
	wp option set 'caweb_password' "$CAWEB_ACCESS_TOKEN" --path=$WEB_ROOT --allow-root
fi
