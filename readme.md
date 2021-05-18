```sh
sudo pacman -S yay
yay -S alacritty yarn rustup gcc neofetch coreutils neovim the_silver_searcher zsh hyperfine wget tree ffmpeg fzf cmake go brave ttf-iosevka-term-ss12 xbindkeys xcape nvidia-settings python-pip discord certbot unzip xclip tig syncthing activitywatch polybar ttf-material-design-icons lunar-client bat mpd bottom jq
chsh -s $(which zsh)

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
```

# other things to do
## github
- remember to generate an ssh and gpg key for accessing repos and signing commits
- install extensions
    - dark reader
    - surfingkeys
    - tamper monkey + force youtube 30fps
    - youtube speed changer (the top right corner one)

## /etc
- fstab! see dontrun_custom/fstab to /etc/fstab
