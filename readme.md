```sh
sudo pacman -S yay
yay -S rustup gcc neovim-git zsh cmake go nvidia-settings python-pip certbot ispell aspell 
yay -S kitty discord telegram slack-desktop okular brave mupdf 
yay -S syncthing activitywatch 
yay -S xautomation xcape xbindkeys interception-dual-function-keys
yay -S polybar mpd conky
yay -S ttf-material-design-icons ttf-iosevka-etoile ttf-iosevka-term-ss12 ttf-iosevka-aile
yay -S ttf-symbola ttf-unifont # part of previous, ig. May have to import keys manually: https://unix.stackexchange.com/a/617320
yay -S pandoc xelatex texlive-most
yay -S bluez bluez-utils blueman
yay -S neofetch bottom cmatrix cowsay
yay -S coreutils yarn dnsutils moreutils pdftk colorpicker the_silver_searcher hyperfine wget tree ffmpeg fzf unzip xclip tig bat jq entr xorg-xev
yay -S lunar-client
yay -S fcitx fcitx-googlepinyin fcitx-im fcitx-configtool
chsh -s $(which zsh)

yarn global add http-server

# nvidia pain
#yay -S linux510-nvidia
#            ^^^ replace with linux kernel version! (maybe) 5.10 -> 510 DOESNT WORK
# instead, on manjaro, use
sudo mhwd -a pci nofree 0300

# ln -s A BUNCH OF STUFF
ln -s $HOME/.config/.i3 ~
ln -s $HOME/.config/xinitrc ~/.xinitrc
ln -s $HOME/.config/xbindkeysrc ~/.xbindkeysrc
ln -s $HOME/.config/.emacs.d ~
ln -s $HOME/.config/.Xresources ~
ln -s $HOME/.config/conky/.conkyrc ~
ln -s $HOME/.config/conky ~/.conky
ln -s $HOME/.config/pandoc ~/.pandoc
sudo ln -s $HOME/.config/dontrun_custom/etc_interception_udevmon.yml /etc/interception/udevmon.yaml

# enable time/date syncing
sudo systemctl enable systemd-timesyncd.service
timedatectl set-ntp true
timedatectl status # used to check if syncing is enabled

# uncomplicated firewall (ufw)
sudo ufw enable
sudo ufw allow <ports> # corsaur.us http and https, ssh, mc

# pit2ya
pym pip install pit2ya==0.3.9 # or whichever the latest version is

# ssh 
yay -S openssh
sudo systemctl enable sshd 
sudo systemctl start sshd
sudo systemctl status sshd
```

# other things to do
## github
- remember to generate an ssh and gpg key for accessing repos and signing commits
- install extensions
    - dark reader
    - surfingkeys
    - tamper monkey + force youtube 30fps
    - youtube speed changer (the top right corner one)

## slash etc
- fstab! see dontrun_custom/fstab to /etc/fstab

## bluetooth
- load the btusb kernel module (check with `lsmod | ag btusb`, load with `sudo modprobe btusb`)
- enable it `sudo systemctl enable bluetooth` (apparently might have to off-then-on it in the bios)

# some useful commands
- Lots of info: `inxi -Fxz`
