#!/bin/bash

where_to_copy="/home/florianccj/Document/aspiration-internet"
scripts_to_copy=(
	"crawler.sh"
	"move_tar.sh"
	"copy_scripts.sh"
)

for script in ${scripts_to_copy[*]}; do
	echo "cp ${script} ${where_to_copy}/${script}"
	cp ${script} "${where_to_copy}/${script}"
done 



