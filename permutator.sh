#!/bin/bash
cat $1| unfurl paths | sort -u | sed 's/^\/$//g' | sed 's/^\///g' > clean_me
for i in $(cat clean_me); do
 	test=$(echo $i | awk -F/ '{print $NF}')
 	echo $test | grep -E "\.png$|\.jpg$|\.css$|\.gif$|\.pdf$|\.js$|\.jpeg$|\.tif$|\.tiff$|\.ttf$|\.woff$|\.woff2$|\.ico$|\.svg$|\.txt$|\.cfm$|\.html$|\.htm$" >/dev/null 
 	if [ $? -eq 0 ]
	 	then echo $i | sed "s#$test##g"
 	else echo $i
 	fi  
done | sed '/^[[:space:]]*$/d' | sort -u >permute_me ; rm clean_me
python3 permute.py permute_me | sed 's/\/\//\//g'
rm permute_me
