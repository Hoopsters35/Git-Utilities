#! /usr/bin/env bash

MYDIR="$(dirname "$(readlink -f "s0")")"

cat $MYDIR/gitprojects.txt | while read LINE
do
	echo 'Checking status of repository at ' $LINE
	cd $LINE
	git status
	echo '-----------------------------'
done
