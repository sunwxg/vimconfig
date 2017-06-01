"-----------------------------------------------------
"display
"-----------------------------------------------------
set encoding=utf-8
set t_Co=256
set tabstop=4
set shiftwidth=4
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
"set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"-----------------------------------------
"relativenumber
"-----------------------------------------
set relativenumber

"-----------------------------------------
"strip trailing white space"
"-----------------------------------------
"autocmd BufWritePre * :%s/\s\+$//e

"-----------------------------------------
" Tab navigation
"-----------------------------------------
"nmap  n :tabnew<CR>
nmap  h :tabprevious<CR>
nmap  l :tabnext<CR>

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

"Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/neocomplete'

Plugin 'NLKNguyen/papercolor-theme'

"Plugin 'jiangmiao/auto-pairs'

Plugin 'mileszs/ack.vim'

Plugin 'fatih/vim-go'

Plugin 'vim-scripts/taglist.vim'

Plugin 'scrooloose/syntastic'

Plugin 'janko-m/vim-test'

Plugin 'scrooloose/nerdtree'

Plugin 'scrooloose/nerdcommenter'

Plugin 'bling/vim-airline'

Plugin 'rhysd/vim-go-impl'

Plugin 'Shougo/unite.vim'

Plugin 'Shougo/neomru.vim'

Plugin 'tpope/vim-surround'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'pangloss/vim-javascript'

Plugin 'vim-scripts/gtags.vim'

Plugin 'Raimondi/delimitMate'
"Plugin 'ternjs/tern_for_vim'

"Plugin 'vim-scripts/XML-Folding'

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
"tern-for-vim
"-----------------------------------------
"let g:tern_map_keys=1

"-----------------------------------------
"neocomplete
"-----------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

"-----------------------------------------
" quick-fix window
"-----------------------------------------
nmap  <leader>co :copen <CR>
nmap  <leader>cc :ccl<CR>

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
"C file
"-----------------------------------------
let g:javascript_plugin_jsdoc = 1
autocmd FileType c set tabstop=8
autocmd FileType c set shiftwidth=8

"-----------------------------------------
"Unite
"-----------------------------------------
let g:unite_source_history_yank_enable = 1
"nnoremap <leader>y :Unite yank<cr>

"nnoremap <leader>f :Unite -auto-resize -start-insert file<cr>
"nnoremap <leader>f :Unite -auto-resize -direction=botright -start-insert file file_mru file_rec file_rec/async<cr>
nnoremap <leader>f :Unite -auto-resize -direction=botright -start-insert file_rec file_rec/async<cr>
"nnoremap <leader>b :Unite -auto-resize -direction=botright -quick-match buffer<cr>
"nnoremap <leader>l :Unite -auto-resize -direction=botright -start-insert line<cr>
"nnoremap <leader>c :Unite -auto-resize -direction=botright -start-insert grep:.<cr>

"-----------------------------------------
"Ack
"-----------------------------------------
let g:ackprg = "ag --vimgrep"
let g:ack_autoclose = 1
nnoremap <leader>ss :Ack!<CR>
nnoremap <leader>sc :AckFile! <C-R><C-W> %<CR>

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

let g:airline#extensions#whitespace#enabled = 0

"-----------------------------------------
"YouCompleteMe
"-----------------------------------------
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

"let g:ycm_confirm_extra_conf = 0
"let g:ycm_show_diagnostics_ui = 0
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

"-----------------------------------------
"vim-go
"-----------------------------------------
" autocmd FileType go map <leader>r :w<CR>:!go test ./...<enter>
"autocmd FileType go map <leader>rt :w<CR>:!./test.sh<enter>
"autocmd FileType go map <leader>b :w<CR>:!./bench.sh<enter>
"autocmd FileType xml map <leader>l :w<CR>:silent %!xmllint --encode UTF-8--format -<enter>
"autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
"autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
"autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)

"autocmd FileType go map <leader>go :w<CR>:!go run %<enter>
"autocmd FileType go map <leader>gr :w<CR>:!colorgo test ./...<enter>
"autocmd FileType go map <leader>gl :w<CR>:GoLint<enter>
"autocmd FileType go map <leader>gv :w<CR>:GoVet<enter>
"autocmd FileType go map <leader>mt :TestFile<enter>
"autocmd FileType go map <leader>mm :TestLast<enter>
"autocmd FileType go map <leader>mtl :TestNearest<enter>
"autocmd FileType go nmap <Leader>d <Plug>(go-def)
"autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
"autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
"autocmd FileType go nmap <Leader>gb <Plug>(go-doc-browser)
"autocmd FileType go nmap <Leader>gs <Plug>(go-implements)
"autocmd FileType go nmap <Leader>gi <Plug>(go-info)
"autocmd FileType go nmap <Leader>ge <Plug>(go-rename)

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
"autocmd BufRead,BufNewFile *.md setlocal spell
"autocmd BufRead,BufNewFile *.txt setlocal spell
set spelllang=en_us
"C-x C-N can complete word
set complete+=kspell

"-----------------------------------------
"color scheme
"----------------------------------------
let g:solarized_termcolors=256
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

nmap k <C-Y>
nmap j <C-E>
nmap n <C-F>
nmap m <C-B>

set scroll=2

"scroll 20 characters to right"
"nmap m 20zl
"scroll 20 characters to left"
"nmap n 20zh 

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
"taglist
"-------------------------------------------
:autocmd FileType taglist set nonumber
:autocmd FileType taglist set norelativenumber
map <leader>t :TlistToggle<cr>
let Tlist_Use_Right_Window=1
let Tlist_WinWidth = 40

"--------------------------------------------
"jump window map key
"--------------------------------------------
"nmap <leader>wh <C-W>h
"nmap <leader>wj <C-W>j
"nmap <leader>wk <C-W>k
"nmap <leader>wl <C-W>l

"-------------------------------------------
"quick browse
"-------------------------------------------
nnoremap  <Tab> <c-]>
nnoremap  <S-Tab> <c-T>
nnoremap i :GtagsCursor <CR>:ccl<CR>
nnoremap o <c-o>

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

"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)


"============================================================================
"" Fold lines according to the file's syntax
"============================================================================
syntax enable
"set foldmethod=syntax

"augroup XML
    "autocmd!
    "autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
"augroup END

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
"set foldcolumn=6
"set foldcolumn&
