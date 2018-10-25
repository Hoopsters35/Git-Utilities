#! /usr/bin/env bash

MYDIR="$(dirname "$(readlink -f "$0")")"

python $MYDIR/FindAllGitRepos.py ${HOME} $MYDIR/gitprojects.txt
