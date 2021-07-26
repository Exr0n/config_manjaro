#!/bin/zsh
source $XDG_CONFIG_HOME/zsh_custom/define_color_codes.zsh
cur=$(pwd)

for dir in $(fd -t d); do
    if [[ -d $cur/$dir/.git ]]; then
        cd $cur/$dir
        if [[ ! -z $(git status --porcelain) ]]; then
            echo $COLOR_LightRed$dir$COLOR_None
            git status
        fi
    fi
done

