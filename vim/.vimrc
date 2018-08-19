set nocompatible
syntax on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
" Bundle 'Floobits/floobits-vim'  # deprecated for now, waiting on vim8
Bundle 'JamshedVesuna/vim-markdown-preview'
Bundle 'L9'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'Valloric/YouCompleteMe'
Bundle 'airblade/vim-gitgutter'
Bundle 'chaoren/vim-wordmotion'
Bundle 'christoomey/vim-sort-motion'
Bundle 'gmarik/Vundle.vim'
Bundle 'gmarik/github-search.vim'
Bundle 'gorkunov/smartpairs.vim'
Bundle 'jasoncodes/ctrlp-modified.vim'
Bundle 'joereynolds/place.vim'
Bundle 'justinj/vim-react-snippets'
Bundle 'kien/ctrlp.vim'
Bundle 'machakann/vim-highlightedyank'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'w0rp/ale'
Bundle 'mxw/vim-jsx'
Bundle 'mzlogin/vim-markdown-toc'
Bundle 'pangloss/vim-javascript'
Bundle 'rking/ag.vim'
Bundle 'ruanyl/vim-fixmyjs'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/vitality.vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/indentpython.vim'
Bundle 'vim-scripts/mru.vim'
call vundle#end()
filetype plugin indent on
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
 " Run :so $MYVIMRC before BundleInstall

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" Ignore some file
set wildignore=*.swp,*.bak,*.pyc,*.class,*/tmp/*,*.so,*.zip

" Set to auto read when a file is changed from the outside
set autowrite
set autoread

" no textwidth
set textwidth=0

" With a map leader it's possible to do extra key combinations
" leader is press comma (,) key
" like <leader>w saves the current file
let mapleader=","
let g:mapleader=","

" Fast saving with leader + w
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" No sound on errors
set noerrorbells
set novisualbell
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Visual
set cursorline
set colorcolumn=80 " Mark 80th column with a red line
" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    if exists('$TMUX')
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
      let &t_SI = "\<Esc>]50;CursorShape=1\x7"
      let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
endif

"--- search options ------------
set incsearch       " show 'best match so far' as you type
set hlsearch        " hilight the items found by the search
set ignorecase      " ignores case of letters on searches
set smartcase       " Override the 'ignorecase' option if the search pattern contains upper case characters

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" page down with <SPACE>, pageup with - or <BkSpc>
noremap <Space> <PageDown>
noremap <BS> <PageUp>

" Set autocomplete form
set completeopt=menuone,longest,preview
set shortmess+=c

"--- python formatting help ---
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Enable omni completion.
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,ctp set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php,ctp set omnifunc=phpcomplete#CompletePHP
autocmd FileType vim set omnifunc=syntaxcomplete#Complete

" markdown
au BufEnter,Bufread *.mkd,*.md,*.mdown,*.markdown set tw=0

" Autoclose quickfix windows when quit
" http://stackoverflow.com/questions/7476126/how-to-automatically-close-the-quick-fix-window-when-leaving-a-file
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" Pydiction
let g:pydiction_location='/home/ubuntu/.vim/bundle/Pydiction/complete-dict'

" PYTHON STYLE
let python_highlight_all=1 " Enable all plugin's highlighting.
let python_slow_sync=1 " For fast machines.
let python_print_as_function=1 " Color 'print' function.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pyflakes configuration
if has("gui_running")
    highlight SpellBad term=underline gui=undercurl guisp=Orange
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MRU shorcuts
map <leader><space> :MRU<CR> 

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|client-build\|bower_components\|\.log\|tmp$',
  \ 'file': '\.so$\|\.dat$\|\.DS_Store$\|\.pyc$\|\.(png|jpg|pdf|jpeg)$\|\.map$'
  \ }

let g:ctrlp_max_depth=10 
let g:ctrlp_max_files=0

" color scheme
colorscheme molokai
syntax enable
set background=dark
set encoding=utf-8
set relativenumber

" turn off the arrow keys
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>
" Remap arrows to move between panes in split view
noremap <Down> <C-W><C-J>
noremap <Up> <C-W><C-K>
noremap <Right> <C-W><C-L>
noremap <Left> <C-W><C-H>
noremap <C-j> <C-W><C-J>
noremap <C-k> <C-W><C-K>
noremap <C-l> <C-W><C-L>
noremap <C-h> <C-W><C-H>
"
" show the matching part of the pair for [] {} and ()
set showmatch

set formatoptions-=t

" Convert tab to spaces
set expandtab

" Default indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2

" PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    " \ set textwidth=79 |
    \ set autoindent |
    \ set fileformat=unix

" Other files indentation
au BufNewFile,BufRead *.js,*.html,*.css,*.jsx
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4

au BufNewFile,BufRead *.yml,*.md
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2


" Flagging unecessary Whitespace
highlight BadWhitespace guibg=red ctermbg=darkred
au BufRead,BufNewFile *.html,*.js?,*.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"remove trailing whitespace
"http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre *.py,*.html,*.js? :%s/\s\+$//e


" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

" Map ctrl-o to pane swapping
noremap <C-O> <C-W>k<C-W>_

" Remap ctrl-s to save file
nnoremap <c-s> :w<CR> # normal mode: save
inoremap <c-s> <Esc>:w<CR>l # insert mode: escape to normal and save
vnoremap <c-s> <Esc>:w<CR> # visual mode: escape to normal and save

" Settings for syntastic
let g:syntastic_loc_list_height=3
let g:syntastic_echo_current_error=0
let g:syntastic_enable_highlighting=0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_pylint_rcfile='~/Projects/schools/.pylintrc'
let g:syntastic_python_pylint_args = "--load-plugins pylint_django"
let g:syntastic_aggregate_errors = 0

let g:syntastic_javascript_checkers = ['eslint']
nnoremap <leader>l :lnext<CR>

" Map ,/ to comment line
nmap <leader>/ :Commentary<cr>
vmap <leader>/ :Commentary<cr>

" Map , + f to :Ag
noremap <leader>f :Ag! 

" Import pudb is ctr + p in insert mode
inoremap <C-p> import pudb; pu.db<CR><Esc>

" Add encoding line
inoremap <C-c> # -*- coding: utf-8 -*-<CR><Esc>

" Map goto definition function
nnoremap <leader>g :YcmCompleter GoTo<CR>

" Set laststatus=2 for powerline to work properly
set laststatus=2

" Markdown
let g:vim_markdown_preview_hotkey='<C-m>'
let g:vim_markdown_preview_github=1

" Gist
let g:gist_clip_command=1
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_post_private = 1

" Allow backspace on auto indent, new lines and only on new inserted text
set backspace=indent,eol,start

" Spell check in python and markdown
autocmd BufRead,BufNewFile *.md,*.py,*.txt setlocal spell spelllang=en_us

" Auto reload files changed outside of vim (e.g. git stash)
au FocusGained * checktime

" Apply . for each line
vnoremap . :normal .<CR>

" Opposite of shift J (break line)
nnoremap <leader>j i<CR><Esc>

" Insert new lines with ,enter in normal mode
map <leader><Enter> o<ESC>

" Fix python comment indent
inoremap # X#

" Rename variable
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" wordmotion override
let g:wordmotion_mappings = {
\ 'aw' : '',
\ 'iw' : '',
\ }

" https://github.com/joereynolds/place.vim/
nmap ga <Plug>(place-insert)
nmap gm <Plug>(place-insert-multiple)

" Time to highlight yanked text in millis
let g:highlightedyank_highlight_duration = 150

" Alternative for ctrlp to look only at files modified
map <Leader>M :CtrlPModified<CR>
map <Leader>m :CtrlPBranch<CR>

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" macvim settings
"guifont	list of font names to be used in the GUI
set gfn=Droid\ Sans\ Mono\ Awesome

" ALE linter options
" Show error window
let g:ale_open_list = 1
" Key mappings to navigate errors
nmap <silent> <Leader>n <Plug>(ale_previous_wrap)
nmap <silent> <Leader>p <Plug>(ale_next_wrap)
" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5

" Always show the next matched string at the center of the screen
nnoremap n nzz
nnoremap N Nzz
