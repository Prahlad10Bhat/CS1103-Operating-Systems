#!/bin/bash

list_directory_contents() {
	echo "Listing contents of the current directory:"
	ls -l 
	echo ""
}

filter_and_sort_contents() {
	read -p "Enter a pattern to filter files (e.g., .txt for text files): " pattern
	echo "Filtering and sorting files with pattern '$pattern'..."
	ls -l | grep "$pattern" | sort
	echo ""
}

search_file(){
	read -p "Enter the file/directory to be searched: " search
	echo "Searching for '$search'..."
	if find / -name "$search" 2>/dev/null | grep -q .; then
		echo "File found."
	else
		echo "File not found."
	fi
} 

count_files(){
	read -p "Enter the directory to be searched: " count
	echo "Counting files in '$count'..."
	[ -d "$count" ] && find "$count" -type f | wc -l
}

echo "Piping Commands Manager"
echo "1. List contents of the current directory"
echo "2. Filter and sort directory contents"
echo "3. Search file/directory"
echo "4. Count number of files in a directory"
echo "5. Exit"

while true; do
	read -p "Select an option (1-5): " option
	case $option in
		1) list_directory_contents
		   ;;
		2) filter_and_sort_contents
		   ;;
		3) search_file
		   ;;
		4) count_files
		   ;;
		5) echo "Exiting the Piping Commands Manager. Ciao!"
		   exit 0
		   ;;
		*) echo "Invalid option. Please select 1-3."
		   ;;
	esac
	echo ""
done
