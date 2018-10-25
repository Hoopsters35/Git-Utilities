#! /usr/bin/env bash

MYDIR="$(dirname "$(readlink -f "s0")")"

cat $MYDIR/gitprojects.txt | while read LINE
do
	echo 'Checking repository at ' $LINE
	cd $LINE
	URLS="$(git remote -v)"
	END="$(sed -n -e "s/^.*https:.*github.com\/\(Hoopsters35.*\.git\).*\(fetch\).*$/\1/p" <<< $URLS)"
	if test ! -z $END
	then
		echo 'New URL'
		URL="git@github.com:$END"
		echo $URL
		git remote set-url origin $URL
		echo '-----------------------------'
	fi
done
