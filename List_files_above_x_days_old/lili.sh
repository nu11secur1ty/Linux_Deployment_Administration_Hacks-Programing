#!/usr/bin/bash
# author V.Varbanovski @nu11secur1ty 
# Lili v0.1

# declarete all folders in array
# folder0 folder1 folder2

tupotii=( folder0 folder1 folder2 )

for i in "${tupotii[@]}"
do       
	find $i -mtime +5 | xargs ls -ltr;
done
	echo "Djanki"
exit 0;
