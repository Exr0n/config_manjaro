#!/bin/zsh
xbindkeys

# keyboard
xset r rate 170 40
#setxkbmap -option caps:ctrl_modifier
#xmodmap -e 'keycode 36='    # disable return key, use Alt_R instead
#xmodmap -e 'keycode 36=Return'    # put it back
#xmodmap -e 'keycode ='
#xmodmap -e 'keycode 65 = space Return'
killall xcape # reset keybindings
#xcape -t 200 -e 'Caps_Lock=Escape;Shift_L=bracketleft;Shift_R=bracketright;Alt_L=Shift_L|braceleft;Alt_R=Shift_L|braceright'
#xcape -t 200 -e 'Caps_Lock=Escape;Shift_L=bracketleft;Shift_R=bracketright;Alt_L=Shift_L|braceleft'
#xcape -t 200 -e 'Caps_Lock=Escape;Alt_R=Return'
# all this stuff was moved to interception tools

# mouse
xinput set-prop 'pointer:Razer Razer DeathAdder 2013' 'libinput Natural Scrolling Enabled' 1
xinput set-prop 'pointer:Razer Razer DeathAdder 2013' 'libinput Accel Speed' -0.8
xinput set-prop 'pointer:Apple Inc. Magic Trackpad 2' 'libinput Natural Scrolling Enabled' 1
xinput set-prop 'pointer:Apple Inc. Magic Trackpad 2' 'libinput Accel Speed' 0.5
