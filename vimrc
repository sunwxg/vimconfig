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

Plugin 'drmingdrmer/vim-toggle-quickfix'

Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

Plugin 'Shougo/unite.vim'

Plugin 'kien/ctrlp.vim'

"Plugin 'NLKNguyen/papercolor-theme'
Plugin 'morhetz/gruvbox'

Plugin 'mileszs/ack.vim'

Plugin 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'make release'}
"{ 'branch': 'next', 'do': 'bash install.sh'}
"Plugin 'rust-lang/rust.vim'

Plugin 'fatih/vim-go'

Plugin 'vim-scripts/taglist.vim'

Plugin 'vim-scripts/gtags.vim'

Plugin 'scrooloose/syntastic'

Plugin 'scrooloose/nerdtree'

Plugin 'scrooloose/nerdcommenter'

Plugin 'tpope/vim-surround'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'hail2u/vim-css3-syntax'
Plugin 'ap/vim-css-color'

Plugin 'mhinz/vim-signify'

Plugin 'valloric/vim-indent-guides'

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

"-----------------------------------------------------
"display
"-----------------------------------------------------
"set mouse=n
"set ttymouse=xterm2

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
set nopaste

set splitright
set splitbelow

set ignorecase
set smartcase

set bs=2

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

nmap <leader>x :quit<CR>

"-----------------------------------------
"set status bar
"-----------------------------------------
set laststatus=2

"------------------------------------------------------
" Hide the default mode text (e.g. -- INSERT -- below the statusline)
"------------------------------------------------------
set noshowmode

"-----------------------------------------
"Disable recording
"-----------------------------------------
map q <Nop>

"-----------------------------------------
"Indent line
"-----------------------------------------
"let g:indentLine_char = '⎸'
let g:indentLine_char = '¦'

"-----------------------------------------
"deoplete
"-----------------------------------------
let g:deoplete#enable_at_startup = 1
"autocmd FileType rust let g:deoplete#enable_at_startup = 0
call deoplete#custom#option('sources', {
		\ 'rust': ['LanguageClient'],
		\ })

call deoplete#custom#option('refresh_backspace', v:false)
"set completeopt+=noinsert
set completeopt-=preview
"popup move down
inoremap <expr><C-j>  pumvisible() ? "\<C-n>" : ""
"popup move up
inoremap <expr><C-k>  pumvisible() ? "\<C-p>" : ""
"popup select the item
inoremap <expr><TAB>  pumvisible() ? "\<C-y>" : ""

"-----------------------------------------
"LanguageClient
"-----------------------------------------
"let g:LanguageClient_usePopupHover = 0
let g:LanguageClient_serverCommands = {
			\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
			\ }

nmap <silent> K <Plug>(lcn-hover)
nmap <silent> <F2> <Plug>(lcn-rename)
"nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> gd  :call LanguageClient#textDocument_definition({
    \ 'gotoCmd': 'tabnew',
    \ })<CR>


"-----------------------------------------
"Rust language
"-----------------------------------------
"let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1
let g:rust_conceal = 0
let g:rustc_path = $HOME."/bin/rustc"

"-----------------------------------------
"syntastic
"-----------------------------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
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
autocmd FileType c set tabstop=8
autocmd FileType c set shiftwidth=8

autocmd FileType cc set tabstop=8
autocmd FileType cc set shiftwidth=8

autocmd FileType cpp set tabstop=8
autocmd FileType cpp set shiftwidth=8

"-----------------------------------------
"xml file
"-----------------------------------------
autocmd FileType xml set tabstop=2
autocmd FileType xml set shiftwidth=2

"-----------------------------------------
"vala file
"-----------------------------------------
autocmd BufRead,BufNewFile *.vala setfiletype vala
autocmd FileType vala set tabstop=4
autocmd FileType vala set shiftwidth=4

"-----------------------------------------
"vim-indent-guides
"-----------------------------------------
autocmd FileType xml IndentGuidesEnable
autocmd FileType javascript IndentGuidesEnable
"autocmd FileType vala IndentGuidesEnable

let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=238

"-----------------------------------------
"Ctrlp
"-----------------------------------------
"let g:ctrlp_map = '<leader>f'

"-----------------------------------------
"highlight words
"-----------------------------------------
nmap <Leader>ha :call HighlightWordUnderCursor()<CR>
nmap <Leader>hr :call matchadd('DiffChange', @")<CR>
nmap <Leader>hd :call clearmatches()<CR>

function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]' 
		"exec '2match' 'Visual' '/\V\<'.expand('<cword>').'\>/' 
		let word = expand('<cword>')
		call matchadd('DiffChange', word)
    endif
endfunction

"-----------------------------------------
"Ack
"-----------------------------------------
let g:ackprg = 'ag --vimgrep --ignore "*po" --ignore ".git"'
let g:ack_autoclose = 1
let g:ackhighlight = 1
let g:ack_mappings = { "t": "<C-W><CR>:ccl<CR><C-W>T" }
nnoremap <leader>ss :Ack! <C-R><C-W><CR>
"nnoremap <leader>sc :AckFile! <C-R><C-W> %<CR>
nnoremap <leader>sc :Ack! <C-R><C-W> %<CR>
cnoreabbrev Ack Ack!

"-------------------------------------------
"Toggle quick fix window
"-------------------------------------------
"nmap <leader>q <Plug>window:quickfix:toggle
nmap <leader>q :call Togglequickfix()<CR>
nmap <leader>m <C-W>T
"nmap <leader>l <Plug>window:location:toggle

function! Togglequickfix()
	if IsOpened("qf")
		cclose
	else
		call ack#ShowResults()
		execute "normal \<C-W>T"
	endif
endfunction

function! IsOpened(typ)
    if a:typ == "qf"
        let ids = getqflist({'winid' : 1})
    else
        " query location list window
        let ids = getloclist(0, {'winid' : 1})
    endif

    return get(ids, "winid", 0) != 0
endfunction

"-----------------------------------------
"vim-go
"-----------------------------------------
"autocmd FileType go map <leader>r :w<CR>:!go test ./...<enter>
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
"colorscheme PaperColor
colorscheme gruvbox

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
set clipboard=unnamed,unnamedplus,exclude:cons\|linux
	"set clipboard=unnamed,exclude:cons\|linux
"endif

"----------------------------------------------------------------------
"map page up and down key
"----------------------------------------------------------------------
nmap <Up> 2<C-Y>
nmap <Down> 2<C-E>
nmap <Left> <C-B>
nmap <Right> <C-F>

nmap k 2<C-Y>
nmap j 2<C-E>
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

"------------------------------------------
"cscope database
"------------------------------------------
"set csprg=/usr/bin/cscope
"set cst
"set nocsverb
"if filereadable("cscope.out")
    "cs add cscope.out
"else
    "cs add /home/home/linux-3.17.1/cscope.out
"endif
"set csverb

"-------------------------------------------
"taglist
"-------------------------------------------
autocmd FileType taglist set nonumber
autocmd FileType taglist set norelativenumber
nmap <leader>t :TlistToggle<cr><c-w>l
let Tlist_Use_Right_Window=1
"let Tlist_WinWidth = 60
let Tlist_Show_One_File = 1
let Tlist_Close_On_Select= 1

"-------------------------------------------
"quick browse
"-------------------------------------------
nnoremap  <Tab> <c-]>
nnoremap  <S-Tab> <c-T>
"nnoremap i :GtagsCursor <CR>:ccl<CR>
"nnoremap o <c-o>

"-------------------------------------------
"NERD Tree
"-------------------------------------------
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 40
let NERDTreeWinSizeMax = 80
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

