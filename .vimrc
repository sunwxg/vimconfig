set t_Co=256
set autoindent
set tabstop=8
set shiftwidth=8
set softtabstop=8
set number
set ruler
set cursorline
set hlsearch
syntax on
filetype on
filetype plugin on


"-----------------------------------------
"spell check
"-----------------------------------------
"set spell
set spelllang=en_us

"-----------------------------------------
"color scheme
"----------------------------------------
"set background=dark
"colo solarized
"hi CursorLine ctermbg=233
colo molokai_no_bg 
"colo desert

"----------------------------------------
"copy past between two vim in two windows
"---------------------------------------
nmap <F3> :.w! /tmp/tmp<CR>
vmap <F3> :w! /tmp/tmp<CR>
map <F4> :r /tmp/tmp<CR>

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
if filereadable("tags")
	set tags=tags
else
	set tags=/home/home/linux-3.17.1/tags
endif

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
"tap list
"-------------------------------------------
nmap <F8> :TlistToggle<CR>
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_WinWidth = 60
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1

"--------------------------------------------
"source explore
"--------------------------------------------
nmap <F7> :SrcExplToggle<CR>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0

"-------------------------------------------
"NERD Tree
"-------------------------------------------
let NERDTreeWinPos = "left"
nmap <F9> :NERDTreeToggle<CR>

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
"" Turn on case-insensitive matches (but only when pattern is all-lowercase)
"============================================================================

    set ignorecase smartcase


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
