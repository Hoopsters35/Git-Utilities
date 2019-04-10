#! /usr/bin/env bash

MYDIR="$(dirname "$(readlink -f "s0")")"
regex="^.*Hoopsters35/(.*)\.git.*"

cat $MYDIR/gitprojects.txt | while read LINE
do
	echo 'Checking repository at ' $LINE
	cd $LINE
    for f in $(git remote -v)
    do
        if [[ $f =~ $regex ]]
        then
            REPO="${BASH_REMATCH[1]}"
            echo "Old repo: $f"
            NEW_URL="git@github.com:JustinKnueppel/$REPO.git"
            echo "New repo: $NEW_URL"
            git remote set-url origin $NEW_URL
            echo "URL updated\n"
            break
        fi
    done
done
