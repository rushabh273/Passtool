#!/bin/bash

function generate {
	while true
	do  
		read SECRET
  		PASS=`echo -n $SECRET | sha256sum | base64` 
		echo ${PASS:0:76} 
	done 
}
function clear {
	printf "\033c"
	exit
}

trap clear SIGINT
generate
