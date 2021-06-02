#!/bin/zsh

cd $HOME/.config/conky
killall conky
sleep 5
conky -c "$(pwd)/.conkyrc" &
conky -c "$(pwd)/TeejeeTech/CPU Panel (12-core)" &

