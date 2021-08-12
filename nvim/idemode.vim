" QUICK CONFIG
let g:airline_theme='transparent'

source $VIMCONFIG/defaults.vim

call plug#begin($VIMCONFIG.'/plugged')

" Editing
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tjdevries/coc-zsh'

Plug 'honza/vim-snippets' " https://github.com/neoclide/coc-snippets/issues/126
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'

Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag' " autopairs for html tags

Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

"    text objects, see https://blog.carbonfive.com/vim-text-objects-the-definitive-guide/
Plug 'vim-scripts/argtextobj.vim'
Plug 'michaeljsmith/vim-indent-object'

"Plug 'dpc/vim-smarttabs'   // TODO: would be nice but doesn't actually work
"Plug 'spiiph/vim-space'    // would also be nice of this worked

"Decent
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'wadackel/vim-dogrun'
"Favorite so far:
"Plug 'shapeoflambda/dark-purple.vim' " rec
"Plug 'arzg/vim-colors-xcode'
"Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

"   HUD
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
"Plug 'glepnir/galaxyline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'cespare/vim-toml'		" .toml syntax highlighting
Plug 'luochen1990/rainbow'
"Plug 'jaxbot/semantic-highlight.vim'
let g:gitgutter_map_keys = 0
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
Plug 'Shougo/echodoc.vim'
Plug 'rickhowe/diffchar.vim'
let g:indentLine_char = '▏'
let g:indentLine_conceallevel = 1
let g:indentLine_concealcursor = 'nv'
Plug 'Yggdroot/indentLine'
"   tmux integration
Plug 'christoomey/vim-tmux-navigator'

" HUD Toggles
let g:rainbow_active=1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\	'guifgs': ['magenta', 'cyan', 'orange', 'green', 'yellow'],
\}

let g:gitgutter_highlight_linenrs = 0 " auto highlight change line numbers
let g:gitgutter_preview_win_floating = 0 " Disable floating/popup window for <Leader>hp

let g:git_messenger_include_diff = "current" " show git diff of commit in pop-up window by default

" Rednering
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'mhinz/vim-startify'

" Zettelksaten
"Plug 'BurntSushi/ripgrep'
"Plug 'ihsanturk/neuron.vim'

" Memes
"Plug 'wakatime/vim-wakatime'
"Plug 'ActivityWatch/aw-watcher-vim'
"Plug 'floobits/floobits-neovim'

call plug#end()


" My Customs
" jump to previous position https://stackoverflow.com/questions/774560/in-vim-how-do-i-get-a-file-to-open-at-the-same-line-number-i-closed-it-at-last
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g`\"" | endif
endif

" from https://www.linode.com/docs/tools-reference/tools/introduction-to-vim-customization/
set matchpairs+=<:>,$:$

" auto-toggle hybrid line numbers on buffer enter/leave
" source: https://jeffkreeftmeijer.com/vim-number/
" not used because relative jumping with j/k doesn't set <C-o> mark
"augroup numbertoggle
"    autocmd!
"    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

" passive and HUD
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
set number " line numbers
"set rnu    " relative numbers
set nosm   " don't show match

"set filetype off
filetype plugin indent on

" colors
" fix neovim's weird highlight (https://github.com/neovim/neovim/issues/9019#issuecomment-521532103)
function! s:CustomizeColors()
	if has('guirunning') || has('termguicolors')
		let cursorline_gui=''
		let cursorline_cterm='ctermfg=white'
	else
		let cursorline_gui='guifg=white'
		let cursorline_cterm=''
	endif
	exec 'hi CursorLine ' . cursorline_gui . ' ' . cursorline_cterm
    "exec 'hi Normal guibg=NONE ctermbg=NONE'
endfunction
augroup OnColorScheme
	autocmd!
	autocmd ColorScheme,BufEnter,BufWinEnter * call s:CustomizeColors()
augroup END

" colors 
colo challenger_deep
highlight Type          cterm=italic    gui=italic
highlight Identifier    cterm=bold      gui=bold
highlight Function      cterm=bold      gui=bold
"highlight Normal        guibg=#1e1c31  
highlight Normal        ctermbg=NONE    guibg=NONE  
highlight Cursor        guifg=black     guibg=#caca00
highlight iCursor       guifg=black     guibg=steelblue
highlight LineNr        ctermbg=NONE    guibg=NONE
"highlight EndOfBuffer   ctermfg=black           " yeet the tildas, but it doesn't work
set fcs=eob:\   " actually yeet the tildas
"highlight DiffAdd       ctermbg=NONE    guibg=NONE
"highlight DiffChange    ctermbg=NONE    guibg=NONE
"highlight DiffDelete    ctermbg=NONE    guibg=NONE
"highlight DiffText      ctermbg=NONE    guibg=NONE
"highlight GitGutterAddLine              ctermbg=NONE guibg=NONE
"highlight GitGutterChangeLine           ctermbg=NONE guibg=NONE
"highlight GitGutterDeleteLine           ctermbg=NONE guibg=NONE
"highlight GitGutterChangeDeleteLine     ctermbg=NONE guibg=NONE
"highlight GitGutterAddLineNr            ctermbg=NONE guibg=NONE
"highlight GitGutterChangeLineNr         ctermbg=NONE guibg=NONE
"highlight GitGutterDeleteLineNr         ctermbg=NONE guibg=NONE
"highlight GitGutterChangeDeleteLineNr   ctermbg=NONE guibg=NONE
"highlight GitGutterAddIntraLine         ctermbg=NONE guibg=NONE
"highlight GitGutterDeleteIntraLine      ctermbg=NONE guibg=NONE
highlight SignColumn                    ctermbg=NONE guibg=NONE
let g:gitgutter_set_sign_backgrounds = 1    " remove sign-column background color
highlight CocErrorSign        ctermfg=1       guifg=#ff8080
highlight CocWarningSign      ctermfg=11      guifg=#ffb378
highlight CocInfoSign         ctermfg=4       guifg=#91ddff
highlight CocHintSign         ctermfg=5       guifg=#c991e1

" neovim treesitter config 

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF

" force vim to use true colors (https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be)
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" semantic highlight
"autocmd FileType python,javascript,c,cpp,cuda,typescript,lisp,zsh,bash,sh,rust,go SemanticHighlightToggle
"autocmd BufNewFile,BufRead * SemanticHighlightToggle

"   persistent folds (https://til.hashrocket.com/posts/17c44eda91-persistent-folds-between-vim-sessions)
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  "autocmd BufWinLeave * echom 'hi' " TODO: don't mkview on diff files
  autocmd BufWinEnter * silent! loadview
augroup END

"   [fancy looking folds](https://dhruvasagar.com/2013/03/28/vim-better-foldtext)
function! NeatFoldText()
	let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
	let lines_count = v:foldend - v:foldstart + 1
	let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
	let foldchar = matchstr(&fillchars, 'fold:\zs.')	" TODO typo on this line?
	let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
	let foldtextend = lines_count_text . repeat(foldchar, 8)
	let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
	return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

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
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.cpp :call CleanExtraSpaces()
endif


nnoremap q: <Nop>

"map cn to NERDTreeToggle
nnoremap <Leader>n :NERDTreeToggle<CR>
xnoremap <Leader>n :NERDTreeToggle<CR>
""map cn to nvim-tree.lua (broken)
"nnoremap <Leader>n :NvimTreeToggle<CR>
"xnoremap <Leader>n :NvimTreeToggle<CR>

" git gutter jump to next hunk
nmap <Leader>hn <Plug>(GitGutterNextHunk)
nmap ghn <Plug>(GitGutterNextHunk)
nmap <Leader>hN <Plug>(GitGutterPrevHunk)
nmap ghN <Plug>(GitGutterPrevHunk)
nmap <Leader>HN <Plug>(GitGutterPrevHunk)
nmap ghp <Plug>(GitGutterPrevHunk)
nmap <Leader>hp <Plug>(GitGutterPreviewHunk)

" git gutter stage/revert hunk because the default seems to be broken...
nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hr <Plug>(GitGutterRevertHunk)
nmap <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <Leader>hv <Plug>(GitGutterPreviewHunk)

" git conflict resolution via vim-fugitive (https://www.prodops.io/blog/solving-git-merge-conflicts-with-vim)
" enter diff view
" choose left
" choose right
nnoremap <Leader>gd :Gvdiff<CR>     
nnoremap <Leader>gh :diffget //2<CR>
nnoremap <Leader>gl :diffget //3<CR>

nnoremap <Leader>s  :SemanticHighlightToggle<CR>

" and paste for neovide
nnoremap <C-z> "+p

" additional control-o control-i mappings
nnoremap <M-Left> <C-o>
nnoremap <M-Right> <C-I>
nnoremap <M-Left> <C-o>
nnoremap <M-Right> <C-I>

inoremap <C-e> <Right>

nnoremap <C-x><C-s> :w<CR>
inoremap <C-x><C-s> <Esc>:w<CR>a

source $VIMCONFIG/coc-config.vim
"source $VIMCONFIG/zettel.vim
noh
