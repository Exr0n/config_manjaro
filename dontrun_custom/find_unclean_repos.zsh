#!/bin/zsh

cur=$(pwd)

for dir in $(fd -t d); do
    if [[ -d $cur/$dir/.git ]]; then
        cd $cur/$dir
        if [[ ! -z $(git status --porcelain) ]]; then echo $dir; fi
    fi
done

