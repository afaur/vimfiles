" Lets
let mapleader = ","
syntax enable
set number
set autoindent
set hlsearch
set clipboard=unnamed
filetype plugin indent on
set backspace=indent,eol,start

" Don't add trailing EOL in PHP files
autocmd FileType php setlocal noeol binary fileformat=dos

" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

" Repeat search that accepts count `3Q`
nnoremap Q :normal n.<CR>

" Enable Viewing Whitespace
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

" Rulers ftw!
autocmd BufNewFile,BufRead *.rb setlocal colorcolumn=80
autocmd BufNewFile,BufRead *.php setlocal colorcolumn=100
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal colorcolumn=72

" Scroll Off
set scrolloff=3
set sidescrolloff=7
set sidescroll=1
set scrolljump=10

" Switch panes with Ctrl
map <Leader>w <C-w>

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

" Pathogen - package manager
execute pathogen#infect()

" NerdTree File Manager
nnoremap <silent> <Leader>p :NERDTreeToggle<CR>
map <Leader>o :BookmarkToRoot pj<CR>
map <Leader>* :NERDTreeFind<CR>

" Ctrlp
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_custom_ignore = '\v\~$|\.(o|exe|dll|bak|orig|swp|jpg|png|gif)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|vendor/|tmp/cache|_site|node_modules|^tmp'
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

" Dash
nmap <silent> <leader>d <Plug>DashSearch

" mardown
let g:vim_markdown_folding_disabled=1

" covim
let CoVim_default_name = "blainesch"
let CoVim_default_port = "9180"
