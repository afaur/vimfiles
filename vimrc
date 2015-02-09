" Pathogen - package manager
set nocompatible
set t_Co=16
execute pathogen#infect()

" Lets
let mapleader = ","
syntax enable
set number
set autoindent
set hlsearch
set clipboard=unnamed
filetype plugin indent on
set backspace=indent,eol,start

" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

" Repeat search that accepts count `3Q`
nnoremap Q :normal n.<CR>

" Enable Viewing Whitespace
set list
set listchars=tab:\ \ ,trail:~,extends:>,precedes:<

" Rulers ftw!
autocmd BufNewFile,BufRead *.rb setlocal colorcolumn=80
autocmd BufNewFile,BufRead *.php setlocal colorcolumn=90,120
autocmd BufNewFile,BufRead *.coffee setlocal colorcolumn=79
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal colorcolumn=72

" Scroll Off
set scrolloff=3
set sidescrolloff=7
set sidescroll=1
set scrolljump=10

" Disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" wrap the cursor to prev/next line
set whichwrap=<,>,h,l,[,]

" Reload VIMRC
nnoremap <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Mouse
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" NerdTree File Manager
map <Leader>w <C-w>
map <Leader>* :NERDTreeFind<CR>

" Ctrlp
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_custom_ignore = '\v\~$|\.(o|exe|dll|bak|orig|swp|jpg|png|gif)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|vendor/|app/libraries|libraries|_site|node_modules|^tmp'
nnoremap <silent> <Leader>y :CtrlPBuffer<CR>
nnoremap <silent> <Leader>T :CtrlPBufTag<CR>
nnoremap <silent> <Leader>r :CtrlPMRU<CR>
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")': ['<c-n>', '<c-j>', '<down>'],
  \ 'PrtSelectMove("k")': ['<c-p>', '<c-k>', '<up>'],
  \ 'PrtHistory(-1)': ['<c-h>'],
  \ 'PrtHistory(1)': ['<c-l>'],
  \ 'PrtCurLeft()': ['<left>', '<c-^>'],
  \ 'PrtCurRight()': ['<right>'],
  \ }

" git
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gc :Gcommit -v<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>

" ZoomWin
nnoremap <silent> <Leader>z :ZoomWin<CR>

" Auto Complete [:
let g:neocomplcache_enable_at_startup = 1

" Auto detect indention
autocmd BufReadPost * :DetectIndent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 2

" Theme
colorscheme solarized
set background=dark
au BufRead,BufNewFile *.twig set filetype=jinja

" mardown
let g:vim_markdown_folding_disabled=1

" covim
let CoVim_default_name = "blainesch"
let CoVim_default_port = "9180"

" Seeing is believing
nmap <buffer> <leader>9 <Plug>(seeing-is-believing-run)
xmap <buffer> <leader>9 <Plug>(seeing-is-believing-run)
imap <buffer> <leader>9 <Plug>(seeing-is-believing-run)

nmap <buffer> <leader>8 <Plug>(seeing-is-believing-mark)
xmap <buffer> <leader>8 <Plug>(seeing-is-believing-mark)
imap <buffer> <leader>8 <Plug>(seeing-is-believing-mark)

