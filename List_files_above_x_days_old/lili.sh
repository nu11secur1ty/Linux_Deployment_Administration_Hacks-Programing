#!/usr/bin/bash
# author V.Varbanovski 

# declarete all folders in array
# folder0 folder1 folder2

tupotii=( folder0 folder1 folder2 )

for i in "${tupotii[@]}"
do       
	find $i -mtime +5 | xargs ls -ltr;
	#find $i -type f -mmin +1 -exec rm -fv {} \;
done
	echo "Djanki"
exit 0;
