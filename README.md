
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
colo molokai 

nmap <C-[> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
nmap <C-]> :cs find 1 <C-R>=expand("<cword>")<CR><CR>
