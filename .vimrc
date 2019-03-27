set nocompatible
set keymodel=startsel
set encoding=UTF-8

execute pathogen#infect()
syntax on
filetype plugin indent on

nnoremap <C-x> :bd<CR>
inoremap <C-x> <c-o>:bd<CR>
nnoremap <F3> :bd<CR>
inoremap <F3> <c-o>:bd<CR>

" Git
nnoremap <F2> :Gstatus<CR>
inoremap <F2> <c-o>:Gstatus<CR>
nnoremap <F1> :Gdiff<CR>
inoremap <F1> <c-o>:Gdiff<CR>

" Copy paste
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>
vnoremap <C-c> "+y

" Undo
nnoremap <c-z> :u<CR>
inoremap <c-z> <c-o>:u<CR>

map <C-o> :NERDTreeToggle<CR>
autocmd BufWinEnter * NERDTreeMirror

" Save
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>
nmap <c-s-s> :wa<CR>
imap <c-s-s> <Esc>:wa<CR>

vmap <Tab> >gv
vmap <S-Tab> <gv

set tabstop=4 shiftwidth=4 expandtab

highlight LineNr ctermfg=grey
set number
set mouse=a

" filetype plugin on
" set omnifunc=syntaxcomplete#Complete

" ALE
let g:ale_completion_enabled = 1

" deoplete
let g:deoplete#enable_at_startup = 1

" neosnippet        
let g:neosnippet#enable_completed_snippet = 1

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#ale#enabled = 1

set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" Others

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
syntax enable

call plug#begin()
  if has('nvim')
  else
	Plug 'wincent/terminus'
  endif
  Plug 'tomasiser/vim-code-dark'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'w0rp/ale'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'vim-airline/vim-airline'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-signify'
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
  endif
  " For func argument completion
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
call plug#end()

" autocmd VimEnter * call NERDTreeAddKeyMap({ 'key': '<2-LeftMouse>', 'scope': "FileNode", 'callback': "OpenInTab", 'override':1 })
" function! OpenInTab(node)
"	call a:node.activate({'reuse': 'all', 'where': 't'})
" endfunction
" let g:NERDTreeMapOpenInTab = '<2-LeftMouse>'

colorscheme codedark
