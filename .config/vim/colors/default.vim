"!/hint/vim
" vim:ft=vim:noet:ts=3:sw=3:
" file:$XDG_CONFIG_HOME/vim/colors/default.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight clear
syntax reset

let g:colors_name = "default"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    LINKS                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight! link Terminal Normal

highlight! link Boolean Constant
highlight! link Character Constant
highlight! link Conditional Repeat
highlight! link Debug Special
highlight! link Define PreProc
highlight! link Delimiter Special
highlight! link Exception Statement
highlight! link Float Number
highlight! link Include PreProc
highlight! link Keyword Statement
highlight! link Label Statement
highlight! link Macro PreProc
highlight! link Number Constant
highlight! link PopupSelected PmenuSel
highlight! link PreCondit PreProc
highlight! link SpecialChar Special
highlight! link SpecialComment Special

highlight! link CurSearch Search
highlight! link CursorIM Cursor
highlight! link CursorLineFold CursorLine
highlight! link CursorLineSign CursorLine
highlight! link EndOfBuffer NonText
highlight! link LineNrAbove LineNr
highlight! link LineNrBelow LineNr
highlight! link MessageWindow Pmenu
highlight! link PopupNotification Todo
highlight! link QuickFixLine Search
highlight! link StatusLineTerm StatusLine
highlight! link StatusLineTermNC StatusLineNC
highlight! link StorageClass Type
highlight! link String Constant
highlight! link Structure Type
highlight! link Tag Special
highlight! link Typedef Type
highlight! link VertSplit WinSeparator
highlight! link lCursor Cursor


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  HIGHLIGHTS                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if ( &background == "dark" )
	highlight Normal ctermfg=NONE ctermbg=NONE cterm=NONE

	highlight ColorColumn  ctermfg=9  ctermbg=0    cterm=NONE
	highlight CursorColumn ctermfg=9  ctermbg=0    cterm=NONE
	highlight CursorLine   ctermfg=9  ctermbg=0    cterm=NONE
	highlight CursorLineNr ctermfg=9  ctermbg=0    cterm=NONE
	highlight LineNr       ctermfg=11 ctermbg=NONE cterm=NONE

	highlight Folded     ctermfg=8    ctermbg=0    cterm=NONE
	highlight Conceal    ctermfg=0    ctermbg=NONE cterm=NONE
	highlight Cursor     ctermfg=NONE ctermbg=NONE cterm=NONE
	highlight Directory  ctermfg=12   ctermbg=NONE cterm=NONE
	highlight FoldColumn ctermfg=11   ctermbg=NONE cterm=NONE
	highlight IncSearch  ctermfg=NONE ctermbg=NONE cterm=NONE
	highlight MatchParen ctermfg=NONE ctermbg=0    cterm=NONE
	highlight NonText    ctermfg=8    ctermbg=0    cterm=nocombine

	highlight ModeMsg    ctermfg=NONE ctermbg=NONE cterm=NONE
	highlight MoreMsg    ctermfg=NONE ctermbg=NONE cterm=NONE
	highlight WarningMsg ctermfg=11   ctermbg=0    cterm=NONE
	highlight ErrorMsg   ctermfg=9    ctermbg=0    cterm=NONE

	highlight Pmenu      ctermfg=NONE ctermbg=NONE cterm=NONE
	highlight PmenuSbar  ctermfg=NONE ctermbg=NONE cterm=NONE
	highlight PmenuSel   ctermfg=9    ctermbg=0    cterm=NONE
	highlight PmenuThumb ctermfg=NONE ctermbg=8    cterm=NONE
	highlight WildMenu   ctermfg=9    ctermbg=0    cterm=NONE

	highlight Question   ctermfg=NONE ctermbg=NONE cterm=NONE
	highlight Search     ctermfg=9    ctermbg=0    cterm=NONE
	highlight SignColumn ctermfg=8    ctermbg=0    cterm=NONE
	highlight SpecialKey ctermfg=8    ctermbg=0    cterm=NONE

	highlight SpellBad   ctermfg=NONE ctermbg=1  cterm=NONE
	highlight SpellCap   ctermfg=NONE ctermbg=4 cterm=NONE
	highlight SpellLocal ctermfg=NONE ctermbg=6 cterm=NONE
	highlight SpellRare  ctermfg=NONE ctermbg=5 cterm=NONE

	highlight StatusLine   ctermfg=NONE ctermbg=0    cterm=NONE
	highlight StatusLineNC ctermfg=8    ctermbg=NONE cterm=NONE

	highlight TabLine     ctermfg=8    ctermbg=NONE cterm=NONE
	highlight TabLineFill ctermfg=NONE ctermbg=NONE cterm=NONE
	highlight TabLineSel  ctermfg=NONE ctermbg=0    cterm=NONE

	highlight Title        ctermfg=NONE ctermbg=NONE cterm=NONE
	highlight WinSeparator ctermfg=NONE ctermbg=NONE cterm=NONE

	highlight Visual ctermfg=9 ctermbg=0 cterm=NONE

	highlight Comment    ctermfg=8  ctermbg=NONE cterm=NONE
	highlight Constant   ctermfg=13 ctermbg=NONE cterm=NONE
	highlight Error      ctermfg=9  ctermbg=NONE cterm=NONE
	highlight Function   ctermfg=14 ctermbg=NONE cterm=NONE
	highlight Identifier ctermfg=14 ctermbg=NONE cterm=NONE
	highlight Ignore     ctermfg=0  ctermbg=NONE cterm=NONE
	highlight Operator   ctermfg=11 ctermbg=NONE cterm=NONE
	highlight PreProc    ctermfg=14 ctermbg=0    cterm=NONE
	highlight Repeat     ctermfg=11 ctermbg=NONE cterm=NONE
	highlight Special    ctermfg=3  ctermbg=NONE cterm=NONE
	highlight Statement  ctermfg=11 ctermbg=NONE cterm=NONE
	highlight Todo       ctermfg=3  ctermbg=0    cterm=NONE
	highlight Type       ctermfg=10 ctermbg=NONE cterm=NONE
	highlight Underlined ctermfg=12 ctermbg=NONE cterm=NONE

	highlight DiffAdd    ctermfg=12 ctermbg=0 cterm=NONE
	highlight DiffChange ctermfg=13 ctermbg=0 cterm=NONE
	highlight DiffText   ctermfg=9  ctermbg=0 cterm=NONE
	highlight DiffDelete ctermfg=14 ctermbg=0 cterm=NONE
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 END OF FILE                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
