#!/bin/bash
LENGTH=

function generate {
	while true
	do  
		read SECRET
  		PASS=`echo -n $SECRET | sha256sum | base64` 
		if [ "$LENGTH" == "" ] ; then
			LENGTH=${#PASS}	
		fi
		echo ${PASS:0:$LENGTH} 
	done 
}
function clear {
	printf "\033c"
	exit
}

trap clear SIGINT
generate
