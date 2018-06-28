#! /usr/bin/env bash

MYDIR="$(dirname "$(readlink -f "$0")")"

python $MYDIR/FindAllGitRepos.py ${HOME} $MYDIR/gitprojects.txt

IFS=''
cat $MYDIR/gitprojects.txt | while read LINE
do
    echo 'Pulling repository at: ' $LINE
    cd $LINE
    git pull
done

