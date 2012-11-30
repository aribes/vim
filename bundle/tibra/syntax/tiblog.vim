" Quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

let s:tiblog_cpo_save = &cpo
set cpo&vim

syn case match

syn match   tiblogString +"[^"]*"+ keepend display
syn match   tiblogString +'[^']*'+ keepend display

syn match   tiblogOpMessage "{.*}" keepend display

syn match   tiblogTrader "\<Trader.*" keepend display
syn keyword tiblogAlways ALWAYS
syn keyword tiblogDebug DEBUG
syn keyword tiblogError ERROR
syn keyword tiblogInfo INFO
syn keyword tiblogWarn WARN

" Add markets as needed
syn keyword tiblogMarket Asx ASX RMP OIM Test Eurex

syn match   tiblogShutdown "\<\([Ss]hutdown\( \?[Cc]ompleted[Hh]andler\)\?\|\(Internal\)\?[Cc]losed\?\([Hh]andler\)\?\)\>" keepend display
syn match   tiblogShutdown "\<[Dd]estroyed\>" keepend display
syn match   tiblogStartup "\<[Ii]nitiali[zs]\(ing\|ed\|e\)\>" keepend display
syn match   tiblogStartup "\<\(mOn\)\?[Ss]tartupCompleted\(Handler\)\?\>" keepend display
syn match   tiblogStartup "\<[Ss]tart\(ed\)\?\>" keepend display
syn match   tiblogStartup "\<Starting\>" keepend display
syn match   tiblogStartup "\<Wait\(ed\|ing\|\)\>" keepend display
syn match   tiblogStartup "\<\([Nn]ot \?\)\?[Rr]eady\>" keepend display
syn match   tiblogStartup "\<[Ll]ogg\(ed\|ing\) [Ii]n\>" keepend display
syn match   tiblogStartup "\<[Cc]reat\(ed\|ing\)\>" keepend display

" Tibra(.<lib>)*.<class>:
syn match   tiblogClass "\(Tibra\(\.[a-zA-Z0-9]\+\)*\.\)\@<=[a-zA-Z0-9]\+\(:\)\@=" keepend display
" Tibra.<lib>(.<lib>)?(.<lib>)?.<class>:
syn match   tiblogLib "\(Tibra\.\)\@<=[a-zA-Z0-9]\+\(\.[a-zA-Z0-9]\+\)\?\(\.[a-zA-Z0-9]\+\)\?\(\.[a-zA-Z0-9]\+:\)\@=" keepend display

" Match hostname:port e.g. bjtst02:9998
syn match   tiblogSockets "\(@\?\)\@<=[a-z]\+[0-9]\+:[0-9]\{1,5}" keepend display
" There's a very particular way to enforce IP address matching but let's keep this simple for now
syn match   tiblogSockets "[0-9]\{1,3}\.[0-9]\{1,3}\.[0-9]\{1,3}\.[0-9]\{1,3}:[0-9]\{1,5}" keepend display

syn match   tiblogOptions "\<[A-Z]\{3}[01][0-9]\(JAN\|FEB\|MAR\|APR\|MAY\|JUN\|JUL\|AUG\|SEP\|OCT\|NOV\|DEC\)[0-9]\+\(C\|P\)\.[A-Z0-9]\{2,4}" keepend display

syn match   tiblogMissing "\<Missing \(underlying ratecurve\|lot size\|tick table identifier\|yield curve\|trading calendar\|volatility calculator\)\>" keepend display

" synchronizing
syn sync minlines=50

" The default highlighting.
hi def link tiblogString		String

hi def link tiblogTrader        Constant
hi def link tiblogAlways        Constant
hi def link tiblogDebug         Special
hi def link tiblogError         Error
hi def link tiblogInfo          Statement
hi def link tiblogWarn          Todo

hi def link tiblogLib           Identifier
hi def link tiblogClass         Type

hi def link tiblogSockets       Comment
hi def link tiblogOptions       Type
hi def link tiblogMarket        Type

hi def link tiblogShutdown      Underlined
hi def link tiblogStartup       Underlined

hi def link tiblogOpMessage     PreProc

hi def link tiblogMissing       Todo

let b:current_syntax = "tiblog"

let &cpo = s:tiblog_cpo_save
unlet s:tiblog_cpo_save

" vim: ts=4
