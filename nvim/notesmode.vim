source $VIMCONFIG/defaults.vim

call plug#begin($VIMCONFIG.'/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'

Plug 'michaeljsmith/vim-indent-object'

"Plug 'dpc/vim-smarttabs'   // TODO: would be nice but doesn't actually work

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

let g:indentLine_char = '▏'
let g:indentLine_conceallevel = 1
let g:indentLine_concealcursor = 'nv'
Plug 'Yggdroot/indentLine'

call plug#end()

" jump to previous position
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g`\"" | endif
    au BufEnter * set filetype=cucumber
endif

filetype plugin indent on

" hide stuff
set fcs=eob:\   " actually yeet the tildas
set noruler
set noshowmode

set number
set signcolumn=number

set encoding=utf-8
set listchars=trail:·,nbsp:▫,extends:>,precedes:<
set list

if !exists('g:syntax_on')
    syntax on
endif

if !exists('g:loaded_color')
    let g:loaded_color = 1

    set background=dark
    " Put your favorite colorscheme here
    colo challenger_deep
    highlight Normal            ctermbg=NONE    guibg=NONE
    highlight CocErrorSign      ctermfg=1       guifg=#ff8080
    highlight CocWarningSign    ctermfg=11      guifg=#ffb378
    highlight CocInfoSign       ctermfg=4       guifg=#91ddff
    highlight CocHintSign       ctermfg=5       guifg=#c991e1
    "highlight LineNr            ctermfg=0       guifg=#2e2c41   ctermbg=NONE guibg=NONE
    "highlight LineNr            ctermfg=0       guifg=#1e1c31   ctermbg=NONE guibg=NONE
    highlight LineNr            ctermfg=0       guifg=#91ddff   ctermbg=NONE guibg=NONE
    " TODO: hl group customizations for note taking
endif

" force vim to use true colors (https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be)
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" Delete trailing white space on save, useful for some filetypes ;)
" Stolen from https://github.com/nickmahd/.vim/blob/master/vimrc in Jan 2020
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.md,*.aloh :call CleanExtraSpaces()
endif

nnoremap q: <Nop>
nnoremap <Leader>r <ESC>:CocRestart<CR>
nnoremap <Leader>l :CocCommand workspace.showOutput<CR>2<CR>
nnoremap <Leader>s <C-w>t<C-w>K<C-w>j35<C-w>_

" TODO: keybinds, esp for COC
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
