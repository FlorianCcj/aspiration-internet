#!/bin/bash
where_to_look=/home/florianccj/aspiration-internet
where_to_put='/media/removable/USB Drive/aspiration-internet'

echo "find ${where_to_look} -name '*.tar.gz'"
tar_list=$(find ${where_to_look} -name '*.tar.gz')
#tar_list=$(find ${where_to_look} -name '*.sh')

#echo ${tar_list}

for tar in ${tar_list[*]}; do
	echo "----------------------"
	echo "move ${tar}"
	echo "----------------------"
	mv ${tar} "${where_to_put}"
done

