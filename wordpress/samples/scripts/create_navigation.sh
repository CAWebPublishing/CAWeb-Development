#!/bin/bash

# Create Navigation Menus
function create_navigation(){
	menu_name="$1"
	IFS=';' read -r -a menu <<< "$3"
	IFS=';' read -r -a icons <<< "$4"
	menu_names=$(wp menu list --fields=term_id,name,locations --format=json --path=$WEB_ROOT --allow-root)
	menu_exists=$(echo $menu_names | jq -c '.[]|select(.name=="'"$menu_name"'")')

	if [ -z "$menu_exists" ]; then
		menu_id=$( wp menu create "$menu_name" --path=$WEB_ROOT --allow-root --porcelain )

		for mn in "${!menu[@]}"; 
		do
			fn="${menu[$mn]}"
			in="${icons[$mn]}"
			IFS=',' read -r -a submenu <<< "$fn"
			IFS=',' read -r -a subicons <<< "$in"
			
			icon="${subicons[0]}"
			parent_id=$( insert_post "${submenu[0]}" "$menu_id" "" )
	
			wp eval "update_post_meta($parent_id, '_caweb_menu_icon', '$icon');" --path=$WEB_ROOT --allow-root

			if [ "${#submenu[@]}" -gt 1 ]; then
				unset submenu[0]
				unset subicons[0]
				for smn in "${!submenu[@]}";
				do
					icon="${subicons[$smn]}"
					sub_menu_id=$( insert_post "${submenu[$smn]}" "$menu_id" "$parent_id" )

					# Update Nav Menu Item Meta
					wp eval "update_post_meta($sub_menu_id, '_caweb_menu_icon', '$icon');" --path=$WEB_ROOT --allow-root
					wp eval "update_post_meta($sub_menu_id, '_caweb_menu_unit_size', 'unit1');" --path=$WEB_ROOT --allow-root
					wp eval "update_post_meta($sub_menu_id, '_caweb_menu_media_image', '');" --path=$WEB_ROOT --allow-root
					wp eval "update_post_meta($sub_menu_id, '_caweb_menu_image', '');" --path=$WEB_ROOT --allow-root
					wp eval "update_post_meta($sub_menu_id, '_caweb_menu_image_side', 'left');" --path=$WEB_ROOT --allow-root
					wp eval "update_post_meta($sub_menu_id, '_caweb_menu_image_size', 'quarter');" --path=$WEB_ROOT --allow-root
					wp eval "update_post_meta($sub_menu_id, '_caweb_menu_column_count', '');" --path=$WEB_ROOT --allow-root
					wp eval "update_post_meta($sub_menu_id, '_caweb_nav_media_image_alt_text', '');" --path=$WEB_ROOT --allow-root
				done
			fi

		done

		# Assing menu to location
	 	if [ -n "$2" ] && ( [ "$2" == "header-menu" ] || [ "$2" == "footer-menu" ] ); then
	 		wp menu location assign $menu_id $2 --path=$WEB_ROOT --allow-root
		fi	
	fi
}

function insert_post(){
	if [ -n "$1" ] && [ -n "$2" ]; then
		toplink="$1"
		post_type=$( echo "$toplink" | cut -d '/' -f1 | cut -d 's' -f1 )
		meta_query="array( 'post_type' => '$post_type', 'fields' => 'ids', 'meta_value' => '$toplink' )"
		id=$( wp eval '$p=get_posts('"$meta_query"');print ! empty( $p ) ? $p[0] : "";' --path=$WEB_ROOT --allow-root )
		parent_id=""

		wp menu item add-post $2 $id --parent-id="$3" --path=$WEB_ROOT --allow-root --porcelain

	fi
}

create_navigation "$HEADER_MENU_NAME" "header-menu" "$HEADER_MENU" "$HEADER_MENU_ICONS" 
create_navigation "$FOOTER_MENU_NAME" "footer-menu" "$FOOTER_MENU" "$FOOTER_MENU_ICONS" 


