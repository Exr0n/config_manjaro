#!/bin/bash
# https://github.com/ngynLk/polybar-themes/blob/master/blocks/launch.sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# polybar -rq dummy &
polybar -c $HOME/.config/polybar/config.ini -rq status &
polybar -c $HOME/.config/polybar/config.ini -rq tray &
polybar -c $HOME/.config/polybar/config.ini -rq i3 &
polybar -c $HOME/.config/polybar/config.ini -rq status_vertmon &

echo "Polybar launched..."

exit
#!/bin/bash
# from https://wiki.archlinux.org/title/Polybar

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar mybar &

echo "Polybar launched..."

