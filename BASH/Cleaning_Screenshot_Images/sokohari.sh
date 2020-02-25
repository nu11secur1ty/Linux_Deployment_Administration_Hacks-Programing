#!/usr/bin/bash
# author V.Varbanovski 

# declarete all directory screens in array

screen=( img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img12 img13
         img14 img15 img16 img17 img18 img19 )

# This a test array elements
# screen=( tex pex )

for i in "${screen[@]}"
do       
	find $i -type f -mtime +7 -exec rm -fv {} \;
	#find $i -type f -mmin +2 -exec rm -fv {} \;
done
	echo "Djanki"
exit 0;
