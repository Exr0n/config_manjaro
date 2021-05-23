#!/bin/zsh
source $XDG_CONFIG_HOME/dontrun_custom/env.zsh

to_launch=( $HOME/projects/corsaurus $HOME/projects/Taproot )

for projpath in $to_launch; do
    alacritty\
        --hold\
        --class "$(basename $projpath),drc_autostart"\
        --title "drc_autostart $(basename $projpath)"\
        --working-directory $projpath\
        -e ./start.sh &
done
