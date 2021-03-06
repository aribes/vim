" Pathogen installation
" Pathogen is used to initialise
" all the vim plugins
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Global Configuration
set mouse=a
set hlsearch
set number
set background=dark " enable for dark terminals
colorscheme wombat  " set the colorscheme

set cursorline " highlights the current line
set showmatch  " show matching bracket (briefly jump)
set scrolloff=2 " 2 lines above/below cursor when scrolling

" Add full file path to your existing statusline
" This statusline is currently not used
" Since I use powerline
" set statusline=%F\ (%L\ lines)\ %m 

" turn off fsync because it causes performance to suck on SAN for no benefit
set nofsync
set swapsync=
set nocompatible
set noswapfile
set wildmenu
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader Key
let mapleader=","
" F1 is annoying
:nmap <F1> <nop>
" Directory Browser - NERD Tree plugin
map <F10> :NERDTreeToggle<CR>
" Remove highlight search
map <F11> :nohlsearch<CR>
" Set current directory
map <F12> :lcd %:h<CR>
" Paste behavior
set pastetoggle=<F3>
" Move one line down
map - ddjP
" Move one line up
map _ ddkkp
" To move faster in the files
" Origin 10jzz and 10kzz
nnoremap <space> 10j
nnoremap <backspace> 10k
"Goodbye Ex mode - CommandLine mode is enough
nnoremap Q <nop>




" Dev configuration
" -----------------
set ignorecase " case insensitive searching
set smartcase  " but become case sensitive if you type uppercase characters

" this can cause problems with other filetypes
" see comment on this SO question http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim/234578#234578
"set smartindent " smart auto indenting
set autoindent              " on new lines, match indent of previous line
set copyindent              " copy the previous indentation on autoindenting
set cindent                 " smart indenting for c-like code
set cino=b1,g0,N-s,t0,(0,W4 " see :h cinoptions-valuesa

set smarttab            " smart tab handling for indenting
set magic               " change the way backslashes are used in search patterns
set bs=indent,eol,start " Allow backspacing over everything in insert mode
set nobackup            " no backup~ files.

set tabstop=4       " number of spaces a tab counts for
set shiftwidth=2    " spaces for autoindents
set softtabstop=2
set shiftround      " makes indenting a multiple of shiftwidth
set expandtab       " turn a tab into spaces



set autoread    " Read automatically the changes of the current file

" When you type the first tab, it will complete as much as possible, the second
" tab hit will provide a list, the third and subsequent tabs will cycle through
" completion options so you can complete the file without further keys
set wildmode=longest,list,full
set wildmenu

" A Good way to see spaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" List of path
" In Tibra, going to .. is enough
set path +=..
set path +=../..
set path +=../../..
set path +=../../../..
set path +=../../../../..
set path +=../../../../../..

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

" GUI
if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ Bold\ 10
endif
" Other possible fonts
"set guifont=Monospace\ Bold\ 09
"set guifont=Inconsolata\ for\ Powerline\ Bold\ 09
"set guifont=Source\ Code\ Pro\ for\ Powerline\ Semibold\ 09
"set guifont=Monospace\ Bold\ 16


" X11 Clipboard management
" Look at -> help 'clipboard'
set clipboard+=autoselect
set guioptions+=a

" Working Directory
set autochdir

" Vim completion
" Complete options (disable preview scratch window)
set completeopt=menu ",preview
" Limit popup menu height
set pumheight=15

" New C++ Keyword
syn keyword nullptr contained

"""""""""""""""""""""""""""""""""""""""""""

" PLUGIN CONFIGURATION

" Plugins

" ACK - Open quickfix window at the top of the window
" instead of the bottom
let g:ack_qhandler="topleft copen"
let g:ack_lhandler="topleft lopen"

" Alternate
" http://www.vim.org/scripts/script.php?script_id=31

" BufExplorer
" http://www.vim.org/scripts/script.php?script_id=42

" easymotion

" fugitive

" nerdtree

" Powerline plugin specific configuration
let homedir = $HOME
if isdirectory(homedir . "/.local/lib/python2.7/site-packages/powerline/bindings/vim")
    set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
    set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
endif

" Tagbar - Key for opening/closing the tagbar window
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_width=60

" Tail

" Tibra

" vim-indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" vim-orgmode

" vim-signify

" Syntastic
let g:syntastic_auto_loc_list=0

" YouCompleteMe
" Do not ask for loading the configuration file
let g:ycm_confirm_extra_conf = 0

" vim-startify

let g:startify_custom_header = [
    \ '     ________ ++     ________    ',
    \ '    /VVVVVVVV\++++  /VVVVVVVV\   ',
    \ '    \VVVVVVVV/++++++\VVVVVVVV/   ',
    \ '     |VVVVVV|++++++++/VVVVV/''   ',
    \ '     |VVVVVV|++++++/VVVVV/''     ',
    \ '    +|VVVVVV|++++/VVVVV/''+      ',
    \ '  +++|VVVVVV|++/VVVVV/''+++++    ',
    \ '+++++|VVVVVV|/VVVVV/''+++++++++  ',
    \ '  +++|VVVVVVVVVVV/''+++++++++    ',
    \ '    +|VVVVVVVVV/''+++++++++      ',
    \ '     |VVVVVVV/''+++++++++        ',
    \ '     |VVVVV/''+++++++++          ',
    \ '     |VVV/''+++++++++            ',
    \ '     ''V/''   ++++++             ',
    \ '              ++                 ',
    \ '',
    \ '',
    \ ]

"""""""""""""""""""""""""""""""""""""""""""

" TIBRA Specific tags
" ctags
" set tags=/home/andre/Dev/Repo/Tibra-Onigiri/tags " Onigiri
" set tags=/home/andre/Dev/Repo/RML-4762/tags " ISE triggeredOrderHitter
" set tags=/home/andre/Dev/Repo/Test-Bridge/tags " Decorator
" set tags=/home/andre/Dev/Repo/Tibra/tags " Decorator
" set tags=/home/andre/Dev/Repo/3.23.0-ArcaMultiMarket/tags
" set tags=/home/andre/Dev/Repo/3.23.0-RML-4978/tags
" set tags=/home/andre/Dev/Repo/RML-4762-Review/tags " ISE triggeredOrderHitter Review
" set tags=/home/andre/Dev/Repo/RML-4991/tags
" set tags=/home/andre/Dev/Repo/RFX-4891/tags
" set tags=/home/andre/Dev/Repo/3.25.0/tags
" set tags=/home/andre/Dev/Repo/3.25.0-RFX-4827/tags
set tags=/home/andre/Dev/Repo/Trunk/tags
" set tags=/home/andre/Dev/Repo/Trunk-PGS-Mercury-Milestone-3/tags
" set tags=/home/andre/Dev/Repo/hf/tags
" set tags=/home/andre/Dev/Repo/hf-cboe/tags
" set tags=/home/andre/Dev/Repo/3.24.0-Commodities/tags
