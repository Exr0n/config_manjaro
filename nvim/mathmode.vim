" inspired by https://castel.dev/post/lecture-notes-1/
" ultisnips tutorial: https://www.claritician.com/how-to-set-up-ultisnips-for-vim

source $VIMCONFIG/defaults.vim

call plug#begin($VIMCONFIG.'/plugged')

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=0
let g:tex_conceal='abdmg'

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<C-s>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsEditSplit="vertical"

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'

Plug 'jiangmiao/auto-pairs'

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

Plug 'glepnir/galaxyline.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'luochen1990/rainbow'
let g:rainbow_active=1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\	'guifgs': ['magenta', 'cyan', 'orange', 'green', 'yellow'],
\}
call plug#end()

" colors 
colo challenger_deep
highlight Type          cterm=italic    gui=italic
highlight Identifier    cterm=bold      gui=bold
highlight Function      cterm=bold      gui=bold
highlight Cursor        guifg=black     guibg=#caca00
highlight iCursor       guifg=black     guibg=steelblue
highlight Normal        guibg=#1e1c31  

