```sh
sudo pacman -S yay
yay -S rust rustup clang gcc neovim-git emacs-git zsh cmake go nvidia-settings tk certbot ispell aspell 
yay -S snapd python-pip cargo rustup
yay -S kitty discord telegram slack-desktop okular brave mupdf servo-latest
yay -S syncthing activitywatch 
yay -S cuda
yay -S xautomation xcape xbindkeys interception-dual-function-keys unclutter
yay -S polybar mpd conky picom-git
yay -S ttf-material-design-icons ttf-iosevka-etoile ttf-iosevka-term-ss12 ttf-iosevka-aile
yay -S tff-opensans ttf-symbola ttf-unifont # part of previous, ig. May have to import keys manually: https://unix.stackexchange.com/a/617320
yay -S pandoc xelatex texlive-most
yay -S bluez bluez-utils blueman
yay -S neofetch bottom cmatrix cowsay smartmontools
yay -S coreutils dnsutils moreutils pdftk colorpicker the_silver_searcher fd hyperfine wget tree ffmpeg fzf unzip xclip tig bat jq entr xorg-xev zoxide lsd dust duf gping ngrok rm-improved flameshot pv
yay -S lunar-client steam
yay -S fcitx fcitx-googlepinyin fcitx-im fcitx-configtool
chsh -s $(which zsh)

yarn global add http-server
python3 -m pip install kaggle numpy matplotlib pyautogui pandas spacy
python3 -m spacy download en_core_web_lg

cargo install cargo-script

# nvidia pain
#yay -S linux510-nvidia
#            ^^^ replace with linux kernel version! (maybe) 5.10 -> 510 DOESNT WORK
# instead, on manjaro, use
sudo mhwd -a pci nofree 0300
# also powerlimit chunky gpus to reduce heat
sudo nvidia-smi --id=0 -pm 1
sudo nvidia-smi --id=0 --power-limit=250
sudo nvidia-smi --id=1 -pm 1
sudo nvidia-smi --id=1 --power-limit=250

# ln -s A BUNCH OF STUFF
ln -s $HOME/.config/.i3 ~
ln -s $HOME/.config/xinitrc ~/.xinitrc
ln -s $HOME/.config/xbindkeysrc ~/.xbindkeysrc
ln -s $HOME/.config/emacs ~/.emacs.d
ln -s $HOME/.config/.Xresources ~
ln -s $HOME/.config/conky/.conkyrc ~
ln -s $HOME/.config/conky ~/.conky
ln -s $HOME/.config/pandoc ~/.pandoc

sudo ln -s $HOME/.config/dontrun_custom/etc_interception_udevmon.yml /etc/interception/udevmon.yaml

mkdir -p $HOME/vol/storage/homecache && ln -s $HOME/vol/storage/homecache/ ~/.cache

# enable time/date syncing
sudo systemctl enable systemd-timesyncd.service
timedatectl set-ntp true
timedatectl status # used to check if syncing is enabled

# emacs
sudo systemctl --user enable emacs.service
sudo systemctl --user start emacs.service

# snap store
sudo systemctl enable snapd
sudo systemctl start snapd
snap install icloud-for-linux

# uncomplicated firewall (ufw)
sudo ufw enable
sudo ufw allow <ports> # corsaur.us http and https, ssh, mc, website

# pit2ya
pym pip install pit2ya==0.3.9 # or whichever the latest version is

# ssh 
yay -S openssh
sudo systemctl enable sshd 
sudo systemctl start sshd
sudo systemctl status sshd

# swapfile https://linuxize.com/post/create-a-linux-swap-file/
sudo fallocate -l 50G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile # or edit fstab with /swapfile swap swap defaults 0 0
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
