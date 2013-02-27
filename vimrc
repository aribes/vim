" Pathogen installation
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Global Configuration
set mouse=a
set hlsearch
set ignorecase
set number
set background=dark
colorscheme darkblue

" Add full file path to your existing statusline
set statusline=%F\ (%L\ lines)\ %m 

" turn off fsync because it causes performance to suck on SAN for no benefit
set nofsync
set swapsync=
set nocompatible
set nobackup
set noswapfile
set wildmenu

" Key Mapping

" Leader Key
let mapleader=","
" Directory Browser - NERD Tree plugin
map <F10> :NERDTreeToggle<CR>
" Remove highlight search
map <F11> :nohlsearch<CR>
" Set current directory
map <F12> :lcd %:h<CR>
" Paste behavior
set pastetoggle=<F3>

" To move faster in the files
" Origin 10jzz and 10kzz
nnoremap <space> 10j
nnoremap <backspace> 10k

" Dev configuration
" Tibra recommandations
set autoindent "auto-indent code
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set autowrite
" My recommandations :-)
set ls=2

" completion behaviour
set wildmode=longest:full,full

" A Good way to see spaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" List of path
" In Tibra, going to .. is enough
set path +=..

" additional file extensions for syntax highlighting
syntax on
filetype plugin indent on

" Specific TIBRA C++ files
au BufNewFile,BufRead *.ipp set filetype=cpp
au BufNewFile,BufRead *.ixx set filetype=cpp
au BufNewFile,BufRead *.tpp set filetype=cpp
au BufNewFile,BufRead *.txx set filetype=cpp

autocmd FileType html,xhtml,xml,xsd,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufRead,BufNewFile *.cmake,CMakeList*.txt runtime! indent/cmake-indent.vim
autocmd BufRead,BufNewFile *.log  setfiletype tiblog

" Code Folding, everything folded by default
set foldmethod=syntax
set foldlevel=99
set foldenable
map <silent> <F5> :set foldlevel=1<CR>
map <silent> <F6> :set foldlevel-=1<CR>
map <silent> <F7> :set foldlevel+=1<CR>
map <silent> <F8> :set foldlevel=99<CR>


"set foldcolumn=2 " Peut etre utile mais bon ca prend de la place

" ctags
set tags=/home/andre/Dev/Tibra/3.19.0-RFX-4635/tags

" GUI
if has("gui_running")
    set guioptions-=T
    set guifont=Monospace\ Bold\ 09
    colorscheme wombat
    " set guifont=Monospace\ Bold\ 16
endif

" X11 Clipboard management
" Look at -> help 'clipboard'
set clipboard+=autoselect
set guioptions+=a

" Working Directory
set autochdir

" Vim completion
" Complete options (disable preview scratch window)
set completeopt=menu,preview
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
let g:clang_complete_auto=0
" Don't show clang errors in the quickfix window
let g:clang_complete_copen=0
" Use clang library
let g:clang_use_library=1
" Clang Complete Configuration
" let g:clang_close_preview=1

" SuperTab
" Option for context aware completion
let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-n>"

 " ConqueTerm
 " Option to render more quickly by disabling colors
 let g:ConqueTerm_Color = 0
