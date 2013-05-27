" Chaining commands if CLangComplete fails
autocmd FileType *
            \ if &omnifunc != '' |
            \   call SuperTabChain(&omnifunc, "<c-x><c-i>") |
            \   call SuperTabSetDefaultCompletionType("context") |
            \ endif


