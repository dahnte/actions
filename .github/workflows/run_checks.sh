#!/bin/bash

# grabs commit from args and runs a grep that searches for function names in auth.txt
(git show $1 | grep -oP "(?<=public )(\w)*") | while read -r line;
do
	if cat System/Server/auth.txt | grep -P "$line"; then
		echo "match!";
	fi
done
