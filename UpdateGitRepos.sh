#! /usr/bin/env bash

python ./FindAllGitRepos.py ${HOME} ./gitprojects.txt

cat ${HOME}/gitprojects.txt | while read LINE
do
    echo 'Pulling repository at: ' $LINE
    cd $LINE
    git pull
done

