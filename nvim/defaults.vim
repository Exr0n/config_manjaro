set nocompatible
exe 'set rtp+=' . $VIMCONFIG

let g:python3_host_prog=$XDG_CONFIG_HOME.'/nvim/neovim_venv/bin/python'

" " CUSTOM: change backup dir https://stackoverflow.com/a/1625850/10372825
set backupdir=$VIMCONFIG/autogentmp//
set directory=$VIMCONFIG/autogentmp//
set undodir=$VIMCONFIG/autogentmp//,~/.vim/autogentmp/undo//

set ttyfast " speed up scrolling
set scrolloff=5 " display 8 lines above and below cursor at all times

" autoread (https://vi.stackexchange.com/a/13092)
set autoread
au FocusGained,BufEnter * :checktime

set ruler  " display current cursor "coordinates"
set laststatus=0
set signcolumn=yes

" show invisibles
set encoding=utf-8
set listchars=eol:⤶,tab:→·,trail:·,nbsp:▫,extends:>,precedes:<
set list

" neovide (still not working)
let g:neovide_cursor_animation_length=0.03
let g:neovide_cursor_trail_length=0.9
set guifont=Iosevka\ Term\ SS12\ Light:h16

"set search stuff
set hlsearch
set incsearch
set ignorecase
set smartcase

" tab sizing
set sw=4
set ts=4
set et
set si " smart indent

set nosm

" stop physical line wrapping
" https://stackoverflow.com/questions/2280030/how-to-stop-line-breaking-in-vim
set textwidth=0
set wrapmargin=0

" cursor stuff
set mouse=a

" background and performance
set lazyredraw " don't redraw when executing macros
set updatetime=100
set regexpengine=0 " supposedly makes things faster

" custom keymaps
let mapleader = " "
set timeoutlen=500

" nerd commenter
nmap <Leader>t <Plug>NERDCommenterInvert
xmap <Leader>t <Plug>NERDCommenterInvert
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

" clipboard https://coderwall.com/p/v-st8w/vim-copy-to-system-clipboard-on-a-mac
xmap <Leader>y :w !xsel --clipboard --input<CR><CR>
nmap <Leader>y :w !xsel --clipboard --input<CR><CR>

inoremap <C-f> <Right>

" easymotion
nmap x <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" split direction
set splitbelow
set splitright

