set nocompatible
set keymodel=startsel
set encoding=UTF-8
set splitbelow

execute pathogen#infect()
syntax on
filetype plugin indent on

nnoremap <F3> :q<CR>
inoremap <F3> <c-o>:q<CR
nnoremap <F4> :q<CR>
inoremap <F4> <c-o>:q<CR>
nnoremap <F5> :w<CR>
inoremap <F5> <c-o>:w<CR>

nnoremap <S-B> :Break<CR>
nnoremap <S-C> :Clear<CR>

" Git
nnoremap <F2> :Gstatus<CR>
inoremap <F2> <c-o>:Gstatus<CR>
nnoremap <F1> :Gdiff<CR>
inoremap <F1> <c-o>:Gdiff<CR>

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>       "+gP
map <S-Insert>      "+gP

cmap <C-V>      <C-R>+
cmap <S-Insert>     <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert>     <C-V>
vmap <S-Insert>     <C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>       <C-V>

" Undo
nnoremap <c-z> :u<CR>
inoremap <c-z> <c-o>:u<CR>

map <C-o> :NERDTreeToggle<CR>
autocmd BufWinEnter * NERDTreeMirror

" Save
nmap <c-d> :w<CR>
imap <c-d> <Esc>:w<CR>
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
let g:python3_host_prog='/bin/python2.7'

call plug#begin()
  if has('nvim')
  else
	Plug 'wincent/terminus'
  endif
  Plug 'tomasiser/vim-code-dark'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'scrooloose/nerdtree'
    autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
	au VimEnter * NERDTree
	" Check if NERDTree is open or active
	function! IsNERDTreeOpen()
	  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
	endfunction

	" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
	" file, and we're not in vimdiff
	function! SyncTree()
	  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
		NERDTreeFind
		wincmd p
	  endif
	endfunction

	" Highlight currently open buffer in NERDTree
	autocmd BufEnter * call SyncTree()
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'vim-airline/vim-airline'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-signify'
  " Plug 'severin-lemaignan/vim-minimap'
  Plug 'mhinz/vim-grepper'
  Plug 'Valloric/YouCompleteMe'
  Plug 'w0rp/ale'
  if has('nvim')
   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
   " Plug 'roxma/vim-hug-neovim-rpc'
   " Plug 'roxma/nvim-yarp'
   " Plug 'Shougo/deoplete.nvim'
   " Plug 'deoplete-plugins/deoplete-clang'
  endif
  " For func argument completion
  Plug 'ryanoasis/vim-devicons'
    let g:WebDevIconsNerdTreeBeforeGlyphPadding = ' '
    let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
	let g:WebDevIconsUnicodeDecorateFolderNodes = 1
    let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nerdtree'] = ''
call plug#end()

au VimEnter * packadd termdebug

colorscheme codedark
