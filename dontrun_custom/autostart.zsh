#!/bin/zsh
source $XDG_CONFIG_HOME/dontrun_custom/env.zsh

to_launch=( $HOME/projects/corsaurus $HOME/projects/Taproot $HOME/website )

for projpath in $to_launch; do
    kitty\
        -1\
        --hold\
        --class "$(basename $projpath),drc_autostart"\
        --title "drc_autostart $(basename $projpath)"\
        --directory $projpath\
        -e ./start.sh &
done

./system_setup.zsh
