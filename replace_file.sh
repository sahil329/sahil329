#!/bin/bash
set -e 		# Any subsequent(*) commands which fail will cause the shell script to exit immediately

BGREEN='\033[1;32m'
BRED='\033[1;31m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# command to run be like
# sh script.sh absolute_path_where_to_search old_file_regex new_file_absolute_path

absolute_path_where_to_search="$1"
old_file="$2"

{
	absolute_new_file_path=$3
	replaced_file=$(basename $absolute_new_file_path)
} || {
	echo $BRED "Please Provide Absolute Path Of New File" $NC
	exit
}


paths=($(find "$absolute_path_where_to_search" -type f -not -path "*/.metadata/*" -not -path "*/Eclipse.app/*" -name "$old_file"))	# creating array of paths
total_instances=${#paths[@]}

echo "\n Found in ${BGREEN} $total_instances files...${YELLOW}"
for path in ${paths[@]}; 
do
	echo "$path"
done
echo $NC

while true; do
    read -p "$(echo $BRED "Do you wish replace file (y/n)?" $NC)" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer y or n.";;
    esac
done

if [ ${#paths[@]} != 0 ]
then
	for path in ${paths[@]}; 
	do
		file=$(basename $path)
		# echo "New path: ${path/$file/$replaced_file}"
		cp $absolute_new_file_path ${path/$file/$replaced_file} && rm -f $path	# replace file name
	done

	echo $BGREEN "Process Completed !!" $NC
else
	echo $CYAN "No Files To Replace :)" $NC
fi
