set t_Co=256
set autoindent
set tabstop=8
set shiftwidth=8
set softtabstop=8
set number
set ruler
set cursorline
syntax on
filetype on
" let g:clang_complete_copen=1
" let g:clang_snippets=1
" let g:clang_close_preview=1
" let g:clang_use_library=1
" let g:clang_library_path='/usr/local/lib'
colo molokai_no_bg 
map <F3> :w! /tmp/tmp<CR>
map <F4> :r /tmp/tmp<CR>
filetype plugin on

"--------------------------------------------
"ctags database
"-------------------------------------------
if filereadable("tags")
	set tags=tags
else
	set tags=/home/home/linux-v3.16-rc7/tags
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
    cs add /home/home/linux-v3.16-rc7/cscope.out
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

