"!/hint/vim
" ${XDG_CONFIG_HOME}/vim/colors/default.vim
" vim:ft=vim:fenc=utf-8:noet:ts=3:sw=3:

set background=dark
highlight clear
if exists("syntax on")
	syntax reset
endif
let g:colors_name="default"

highlight Conceal      term=none cterm=none ctermfg=black      ctermbg=none
highlight CursorColumn term=none cterm=none ctermfg=red        ctermbg=none
highlight CursorLine   term=none cterm=none ctermfg=red        ctermbg=none
highlight CursorLineNr term=bold cterm=bold ctermfg=red        ctermbg=none
highlight Directory    term=bold cterm=bold ctermfg=blue       ctermbg=none
highlight FoldColumn   term=none cterm=none ctermfg=white      ctermbg=none
highlight Folded       term=none cterm=none ctermfg=white      ctermbg=none
highlight IncSearch    term=none cterm=none ctermfg=white      ctermbg=none
highlight LineNr       term=bold cterm=bold ctermfg=darkgrey   ctermbg=none
highlight MatchParen   term=none cterm=none ctermfg=white      ctermbg=none
highlight MatchParen   term=none cterm=none ctermfg=white      ctermbg=red
highlight NonText      term=none cterm=none ctermfg=darkcyan   ctermbg=none
highlight Normal       term=none cterm=none ctermfg=grey       ctermbg=none
highlight Search       term=none cterm=none ctermfg=white      ctermbg=red
highlight SignColumn   term=none cterm=none ctermfg=white      ctermbg=none
highlight SpecialKey   term=bold cterm=bold ctermfg=darkyellow ctermbg=none
highlight Terminal     term=none cterm=none ctermfg=lightgray  ctermbg=none
highlight Title        term=none cterm=none ctermfg=white      ctermbg=none
highlight VertSplit    term=none cterm=none ctermfg=black      ctermbg=none
highlight Visual       term=none cterm=none ctermfg=white      ctermbg=red
highlight VisualNOS    term=none cterm=none ctermfg=white      ctermbg=red

highlight ErrorMsg   term=none cterm=none ctermfg=red    ctermbg=none
highlight ModeMsg    term=none cterm=none ctermfg=white  ctermbg=none
highlight MoreMsg    term=none cterm=none ctermfg=white  ctermbg=none
highlight Pmenu      term=none cterm=none ctermfg=white  ctermbg=none
highlight PmenuSbar  term=none cterm=none ctermfg=white  ctermbg=none
highlight PmenuSel   term=none cterm=none ctermfg=white  ctermbg=red
highlight PmenuThumb term=none cterm=none ctermfg=white  ctermbg=none
highlight Question   term=none cterm=none ctermfg=white  ctermbg=none
highlight WarningMsg term=none cterm=none ctermfg=yellow ctermbg=none
highlight WildMenu   term=none cterm=none ctermfg=yellow ctermbg=none

highlight StatusLine       term=bold cterm=bold ctermfg=green ctermbg=none
highlight StatusLineNC     term=bold cterm=bold ctermfg=black ctermbg=none
highlight StatusLineTerm   term=bold cterm=bold ctermfg=green ctermbg=none
highlight StatusLineTermNC term=bold cterm=bold ctermfg=black ctermbg=none

highlight TabLine     term=none cterm=none ctermfg=darkgrey ctermbg=none
highlight TabLineFill term=none cterm=none ctermfg=darkgrey ctermbg=none
highlight TabLinesel  term=none cterm=none ctermfg=white    ctermbg=none

highlight Boolean    term=none cterm=none ctermfg=blue        ctermbg=none
highlight Character  term=none cterm=none ctermfg=darkgreen   ctermbg=none
highlight Comment    term=bold cterm=bold ctermfg=darkgrey    ctermbg=none
highlight Constant   term=none cterm=none ctermfg=magenta     ctermbg=none
highlight Define     term=none cterm=none ctermfg=darkmagenta ctermbg=none
highlight Error      term=none cterm=none ctermfg=white       ctermbg=darkred
highlight Float      term=none cterm=none ctermfg=yellow      ctermbg=none
highlight Function   term=none cterm=none ctermfg=darkyellow  ctermbg=none
highlight Identifier term=none cterm=none ctermfg=cyan        ctermbg=none
highlight Ignore     term=none cterm=none ctermfg=black       ctermbg=none
highlight Include    term=none cterm=none ctermfg=darkmagenta ctermbg=none
highlight Label      term=none cterm=none ctermfg=white       ctermbg=none
highlight Macro      term=none cterm=none ctermfg=darkmagenta ctermbg=none
highlight Number     term=none cterm=none ctermfg=yellow      ctermbg=none
highlight Operator   term=none cterm=none ctermfg=white       ctermbg=none
highlight PreProc    term=none cterm=none ctermfg=darkmagenta ctermbg=none
highlight Special    term=none cterm=none ctermfg=darkred     ctermbg=none
highlight Statement  term=none cterm=none ctermfg=darkyellow  ctermbg=none
highlight String     term=none cterm=none ctermfg=green       ctermbg=none
highlight Todo       term=none cterm=none ctermfg=white       ctermbg=darkyellow
highlight Type       term=none cterm=none ctermfg=green       ctermbg=none
highlight Underlined term=none cterm=none ctermfg=cyan        ctermbg=none

highlight DiffAdd    term=none cterm=none ctermfg=darkgreen ctermbg=none
highlight DiffChange term=none cterm=none ctermfg=darkblue  ctermbg=none
highlight DiffDelete term=none cterm=none ctermfg=darkred   ctermbg=none
highlight DiffText   term=none cterm=none ctermfg=white     ctermbg=none

highlight SpellBad   term=none cterm=none ctermfg=red     ctermbg=none
highlight SpellCap   term=none cterm=none ctermfg=yellow  ctermbg=none
highlight SpellLocal term=none cterm=none ctermfg=grey    ctermbg=none
highlight SpellRare  term=none cterm=none ctermfg=magenta ctermbg=none
