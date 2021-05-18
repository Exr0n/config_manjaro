```sh
sudo pacman -S yay
yay -S alacritty yarn rustup gcc neofetch coreutils neovim the_silver_searcher zsh hyperfine wget tree ffmpeg fzf cmake go brave ttf-iosevka-term-ss12 xbindkeys xcape nvidia-settings
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
```

