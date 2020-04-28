#!/bin/bash

function init(){
	find "$1"/* -name "*" -prune -print0 >tmpfile
	while IFS=  read -r -d $'\0'; do
		arr+=("$REPLY")
	done <tmpfile
	
	rm tmpfile
	
	for pn in "${!arr[@]}"; 
	do
		fn=${arr[$pn]}
		
		# if file is a directory
		if [ -d "$fn" ];then
			# get directory main page
			main_page=$( basename "$fn" )
			main_page=$( find "$fn"/* -name "$main_page.*" -prune -type f )

			# if directory has a main page
			if [ ! -z "$main_page" ]; then
				ids[0]=$( page_creation "$main_page" "" )
			fi

			walk_tree "$fn" "$( basename "$main_page" )" 0 "${ids}"

		else
			page_creation "$fn" ""
		fi
	done
}

function walk_tree(){
	sub=$3
	ignore="-I ''"
	ids="$4"
	if [ ! -z "$2" ]; then
		ignore="-I $2"
	fi

	ls "$1" "$ignore" | while IFS= read i; 
	do
		if [ -d "$1/$i" ]; then
			main_page=$( find "$1/$i"/* -name "$i.*" -prune -type f )

			if [ ! -z "$main_page" ]; then
				sub=$((sub+1))
				ids[$sub]=$( page_creation "$main_page" "${ids[$((sub-1))]}" )
				main_page=$( basename "$main_page" )
			fi
			
			walk_tree "$1/$i/" "$main_page" "$sub" "$ids"
		else
			page_creation "$1/$i" "${ids[$3]}"
		fi
	done

}

function page_creation(){

	f=$(basename "$1")
	default_type=""
	type=$( echo "$1" | sed -e 's/\/home\/wp\///' -e 's/.\/caweb\///' | cut -d '/'  -f1 | cut -c -4 )

	# Get WordPress Page/Post List
	if [ ! -z "$type" ] && [ "$type" == "post" ]; then
		post_id=1
		page_post_list=$( wp post list --fields=ID,post_title --post_type=post --format=json --path=$WEB_ROOT --allow-root )
		
		if [ -n "$WP_DEFAULT_POST" ]; then
			default_type="$WP_DEFAULT_POST"
		fi
	else
		post_id=2
		page_post_list=$( wp post list --fields=ID,post_title --post_type=page --format=json --path=$WEB_ROOT --allow-root )

		if [ -n "$WP_DEFAULT_PAGE" ]; then
			default_type="$WP_DEFAULT_PAGE"
		fi
	fi
	
	path=$( echo "$1" | sed -e 's/\/home\/wp\///' -e 's/.\/caweb\///' )
	post_parent="$2"
	title=$(echo "$f" | cut -d. -f1 | sed 's/.*/\L&/; s/[a-z]*/\u&/g;' | sed 's/-/ /g' )
	wp=$( echo "$f" | cut -d. -f1 | rev | cut -d- -f1 | rev )
	if [ ! -z "$wp" ] && [ "$wp" == "wp" ]; then
			title=$( echo "$title" | sed 's/ Wp//')
	fi
	
	page_exists=$(echo $page_post_list | jq -c '.[]|select(.post_title=="'"$title"'")')

	# if page/post does not exit
	if [ -z "$page_exists" ]; then
		if [ "$BUILD" == "caweb" ]; then
			title_display=''
			if [ "$TITLE_DISPLAY" == true ] || [ "$TITLE_DISPLAY" == "on" ]; then 
				title_display='on'
			fi

			if [ ! -z "$wp" ] && [ "$wp" == "wp" ]; then
				et_builder=''
			else
				et_builder=', "_et_pb_use_builder": "on"'
			fi
		fi

		meta_input=$( printf '{"ca_custom_initial_state": "1", "ca_default_navigation_menu": "%s", "ca_custom_post_title_display": "%s" %s}' "$NAV_MENU_STYLE" "$title_display" "$et_builder")
		# if designated WP Default Page/Post
		if [ ! -z "$default_type" ] && [ "$path" == "$default_type" ]; then
			wp post update $post_id "$1" \
				--post_parent="$post_parent" \
				--post_type="$type" \
				--post_title="$title" \
				--post_status="publish" \
				--meta_input="$meta_input" \
				--post_author=1 \
				--path=$WEB_ROOT \
				--allow-root

			echo $post_id
		else

			post_id=$( wp post create "$1" \
				--post_parent="$post_parent" \
				--post_type="$type" \
				--post_title="$title" \
				--post_status="publish" \
				--meta_input="$meta_input" \
				--post_author=1 \
				--path=$WEB_ROOT \
				--porcelain \
				--allow-root )
			
			echo $post_id
		fi
		
	# if page already exists
	else
		post_id=$( echo $page_exists | jq -c '.ID' )
		
		res=$(wp post update $post_id "$1" \
				--post_parent="$post_parent" \
				--post_type="$type" \
				--post_title="$title" \
				--post_status="publish" \
				--post_author=1 \
				--path=$WEB_ROOT \
				--allow-root)

		echo $post_id
	fi

	wp eval "update_post_meta($post_id, '_caweb_page_created', '"$path"');" --path=$WEB_ROOT --allow-root

}

# Initialize page construction
if [ ! -z "$1" ] && [ -d "$1" ]; then
	init "$1"
else
	echo "Not a valid directory."
fi
