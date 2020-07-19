#!/usr/bin/bash
# author V.Varbanovski 
# Module for kereste.pl
# declarete all folders in array

# debug
# touch stupid.txt

folders=( folder folder1 folder2 folder3 folder4 folder5 folder6 folder7 folder8 folder9 folder10 folder11 folder12
        folder13 folder14 folder15 folder16 folder17 folder18 folder19 folder20 folder21 folder22 folder23 )

# This a test array elements
# test=( tex pex )

for i in "${folders[@]}"
do
        find $i -type f -mtime +7 -exec rm -fv {} \;
        # find $i -type f -mmin +3 -exec rm -fv {} \;
done
        echo "Musmule"
exit 0;
