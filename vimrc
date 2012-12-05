" Pathogen installation
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Global Configuration
set mouse=a
set hlsearch
set ignorecase
set number
set background=dark
colorscheme darkblue
" turn off fsync because it causes performance to suck on SAN for no benefit
set nofsync
set swapsync=


" Key Mapping
" Directory Browser - NERD Tree plugin
map <F10> :NERDTreeToggle<CR>
" Remove highlight search
map <F11> :nohlsearch<CR>
" Set current directory
map <F12> :lcd %:h<CR>
" Paste behavior
set pastetoggle=<F3> 
" noremap <F3> :MBEbn<CR>
" noremap <F2> :MBEbp<CR>

" Dev configuration
" Tibra recommandations
set expandtab
set sw=4
set ts=4
set autoindent "auto-indent code
set autowrite
" My recommandations :-)
set ls=2

" additional file extensions for syntax highlighting
syntax on
filetype on
filetype plugin on

" Specific TIBRA C++ files
au BufNewFile,BufRead *.ipp set filetype=cpp
au BufNewFile,BufRead *.ixx set filetype=cpp
au BufNewFile,BufRead *.tpp set filetype=cpp
au BufNewFile,BufRead *.txx set filetype=cpp


autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufRead,BufNewFile *.cmake,CMakeList*.txt runtime! indent/cmake-indent.vim
autocmd BufRead,BufNewFile *.log  setfiletype tiblog

" Code Folding, everything folded by default
set foldmethod=syntax
set foldlevel=99
set foldenable
"set foldcolumn=2 " Peut etre utile mais bon ca prend de la place

" Tag stuff
" Clang Complete Configuration
" let g:clang_close_preview=1
" ctags
" set tags=/home/andre/Dev/Tibra/event-scope-trunk/tags
" nmap <F8> :TlistToggle<CR>

" GUI
set guioptions-=T
set guifont=Monospace\ Bold
" set guifont=Monospace\ Bold\ 16

" X11 Clipboard management
" Look at -> help 'clipboard'
set clipboard+=autoselect
set guioptions+=a

" Working Directory
set autochdir

" Vim completion
" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15
 
" PLUGIN CONFIGURATION
"
" ACK - Open quickfix window at the top of the window
" instead of the bottom
let g:ack_qhandler="topleft copen"
let g:ack_lhandler="topleft lopen"

" TAGBAR - Key for opening/closing the tagbar window
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_width=60

" Clang_Complete
" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto = 0
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1

" SuperTab
" Option for context aware completion
 let g:SuperTabDefaultCompletionType = "context"
