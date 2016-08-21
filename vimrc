"-----------------------------------------------------
"display
"-----------------------------------------------------
set encoding=utf-8
set t_Co=256
set tabstop=8
set shiftwidth=8
"set softtabstop=8
set number
set ruler
set cursorline
set hlsearch
set listchars=tab:\.\ ,trail:·
set list

"-----------------------------------------------------
"genenal
"-----------------------------------------------------
let mapleader=","

set autowrite
set autoread

set nobackup
set noswapfile

syntax on
filetype on
filetype plugin on
filetype plugin indent on

set splitright
set splitbelow

set ignorecase
set smartcase

set bs=2

"-----------------------------------------
"set status bar
"-----------------------------------------
set laststatus=2
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"-----------------------------------------
"relativenumber
"-----------------------------------------
set relativenumber

"-----------------------------------------
"strip trailing white space"
"-----------------------------------------
autocmd BufWritePre * :%s/\s\+$//e

"-----------------------------------------
"vundle
"-----------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'NLKNguyen/papercolor-theme'

Plugin 'git://github.com/jiangmiao/auto-pairs.git'

Plugin 'mileszs/ack.vim'

Plugin 'git://github.com/fatih/vim-go'

Plugin 'git://github.com/majutsushi/tagbar.git'

Plugin 'git://github.com/scrooloose/syntastic.git'

Plugin 'janko-m/vim-test'

Plugin 'git://github.com/scrooloose/nerdtree.git'

Plugin 'git://github.com/scrooloose/nerdcommenter.git'

Plugin 'bling/vim-airline'

Plugin 'git://github.com/rhysd/vim-go-impl'

Plugin 'git://github.com/Shougo/unite.vim'

Plugin 'git://github.com/Shougo/neomru.vim'

Plugin 'git://github.com/tpope/vim-surround'

Plugin 'terryma/vim-multiple-cursors'

"Plugin 'git@github.com:stefandtw/quickfix-reflector.vim.git'

Plugin 'pangloss/vim-javascript'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to


"-----------------------------------------
"syntastic
"-----------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"-----------------------------------------
"JavaScript
"-----------------------------------------
let g:javascript_plugin_jsdoc = 1
autocmd FileType javascript set tabstop=4
autocmd FileType javascript set shiftwidth=4
autocmd FileType javascript set expandtab

"-----------------------------------------
"Unite
"-----------------------------------------
let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :Unite yank<cr>

"nnoremap <leader>f :Unite -auto-resize -start-insert file<cr>
nnoremap <leader>f :Unite -auto-resize -direction=botright -start-insert file file_mru file_rec file_rec/async<cr>
nnoremap <leader>b :Unite -auto-resize -direction=botright -quick-match buffer<cr>
nnoremap <leader>l :Unite -auto-resize -direction=botright -start-insert line<cr>
nnoremap <leader>c :Unite -auto-resize -direction=botright -start-insert grep:.<cr>


"-----------------------------------------
"Ack
"-----------------------------------------
let g:ackhighlight = 1

"-----------------------------------------
"Airline
"-----------------------------------------
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"-----------------------------------------
"YouCompleteMe
"-----------------------------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

let g:ycm_confirm_extra_conf = 0
let g:ycm_show_diagnostics_ui = 0
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

"-----------------------------------------
"vim-go
"-----------------------------------------
autocmd FileType go map <leader>go :w<CR>:!go run %<enter>
" autocmd FileType go map <leader>r :w<CR>:!go test ./...<enter>
autocmd FileType go map <leader>gr :w<CR>:!colorgo test ./...<enter>
"autocmd FileType go map <leader>rt :w<CR>:!./test.sh<enter>
"autocmd FileType go map <leader>b :w<CR>:!./bench.sh<enter>
autocmd FileType go map <leader>gl :w<CR>:GoLint<enter>
"autocmd FileType xml map <leader>l :w<CR>:silent %!xmllint --encode UTF-8--format -<enter>
autocmd FileType go map <leader>gv :w<CR>:GoVet<enter>
autocmd FileType go map <leader>mt :TestFile<enter>
autocmd FileType go map <leader>mm :TestLast<enter>
autocmd FileType go map <leader>mtl :TestNearest<enter>
"autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
"autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
"autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)
autocmd FileType go nmap <Leader>d <Plug>(go-def)
autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
autocmd FileType go nmap <Leader>gb <Plug>(go-doc-browser)
autocmd FileType go nmap <Leader>gs <Plug>(go-implements)
autocmd FileType go nmap <Leader>gi <Plug>(go-info)
autocmd FileType go nmap <Leader>ge <Plug>(go-rename)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:go_fmt_fail_silently = 1

"-----------------------------------------
"simple input
"-----------------------------------------
iab #- -----------------------------------------------------
iab #* *****************************************************

"-----------------------------------------
"spell check
"-----------------------------------------
"set spell
autocmd BufRead,BufNewFile *.md setlocal spell
"autocmd BufRead,BufNewFile *.txt setlocal spell
set spelllang=en_us
"C-x C-N can complete word
set complete+=kspell

"-----------------------------------------
"color scheme
"----------------------------------------
set background=dark
colorscheme PaperColor

"----------------------------------------
"copy past between two vim in two windows
"---------------------------------------
"nmap <F3> :.w! /tmp/tmp<CR>
"vmap <F3> :w! /tmp/tmp<CR>
"map <F4> :r /tmp/tmp<CR>

"----------------------------------------
"set default clipboard as system clipboard
"vim support +X11
":help unnamedplus
":help quoteplus
"---------------------------------------
"if has('unnamedplus')
set clipboard=unnamedplus
	"set clipboard=unnamed
"endif

"----------------------------------------------------------------------
"map page up and down key
"----------------------------------------------------------------------
nmap <Up> 2<C-Y>
nmap <Down> 2<C-E>
nmap <Left> <C-B>
nmap <Right> <C-F>

set scroll=2

"--------------------------------------------
"ctags database
"-------------------------------------------
set autochdir
set tags=./tags;
set noautochdir
"if filereadable("tags")
	"set tags=tags
"else
"au BufRead,BufNewFile *.go set tags=/home/home/person/cscope/gotags
"au BufRead,BufNewFile *.c  set tags=/home/home/linux-4.5/tags
"endif

"------------------------------------------
"cscope database
"------------------------------------------
set csprg=/usr/bin/cscope
set cst
set nocsverb
if filereadable("cscope.out")
    cs add cscope.out
else
    cs add /home/home/linux-3.17.1/cscope.out
endif
set csverb

"-------------------------------------------
"tagbar
"-------------------------------------------
"map <leader>t :TagbarToggle<cr>

"--------------------------------------------
"jump window map key
"--------------------------------------------
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

"let g:SrcExpl_winHeight = 8
"let g:SrcExpl_refreshTime = 100
"let g:SrcExpl_jumpKey = "<ENTER>"
"let g:SrcExpl_gobackKey = "<SPACE>"
"let g:SrcExpl_isUpdateTags = 0

"-------------------------------------------
"quick browse
"-------------------------------------------
nnoremap  <Tab> <c-]>
nnoremap  <S-Tab> <c-T>

"-------------------------------------------
"NERD Tree
"-------------------------------------------
let NERDTreeWinPos = "left"
let NERDTreeQuitOnOpen = 1
nmap <leader>k :NERDTreeToggle<enter>

"============================================================================
"" Make :help appear in a full-screen tab, instead of a window
"============================================================================

"Only apply to .txt files...
augroup HelpInTabs
        autocmd!
        autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

"Only apply to help files...
    function! HelpInNewTab ()
        if &buftype == 'help'
            "Convert the help window to a tab...
            execute "normal \<C-W>T"
        endif
    endfunction

"============================================================================
"" Make delete key in Normal mode remove the persistently highlighted matches
"============================================================================
nmap <silent>  <BS>  :nohlsearch<CR>

"============================================================================
"" When completing, show all options, insert common prefix, then iterate
"============================================================================
set wildmode=list:longest,full

"============================================================================
"" Set up persistent undo (with all undo files in one directory)
"============================================================================
if has('persistent_undo')
	set undofile
endif

set undodir=$HOME/.VIM_UNDO_FILES

set undolevels=5000


"============================================================================
"" Set up a permanent universal vertical marker after 80 columns
"============================================================================

"    highlight ColorColumn ctermbg=magenta
"    set colorcolumn=81

"============================================================================
"" Highlight anything in the 81st column of long lines
"============================================================================

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


"============================================================================
"" Fold lines according to the file's syntax
"============================================================================
syntax enable
set foldmethod=syntax


"============================================================================
"" Fold lines for which the specified expression produces a fold-level
"============================================================================

"    set foldexpr=strlen(matchstr(getline(v:lnum),'^-*'))
"    set foldmethod=expr


"============================================================================
" Make folds auto-open and auto-close when the cursor moves over them
"============================================================================

"    set foldopen=all
"    set foldclose=all


"============================================================================
" Show/hide fold structure in the left margin
"============================================================================
set foldcolumn=6
set foldcolumn&
