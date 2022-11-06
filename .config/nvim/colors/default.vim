#!/hint/vim
" vim:ft=vim:noet:ts=3:sw=3:
" file:$XDG_CONFIG_HOME/nvim/colors/default.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


highlight clear
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
highlight! link lCursor Cursor


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  HIGHLIGHTS                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if has("gui_running")
	if (&background == "dark")
		let terminal_ansi_colors = ["#151515", "#732b2c", "#60713b", "#a37f4e", "#476a79", "#714e6a", "#4e7971", "#d0d0d0", "#505050", "#ac4142", "#90a959", "#f4bf75", "#6a9fb5", "#aa759f", "#75b5aa", "#f5f5f5"]
		for i in range(terminal_ansi_colors->len())
			let terminal_color_{i} = terminal_ansi_colors[i]
		endfor

		highlight Normal guifg=#d0d0d0 guibg=NONE gui=NONE

		highlight ColorColumn  guifg=NONE    guibg=#732b2c gui=NONE
		highlight CursorColumn guifg=NONE    guibg=#732b2c gui=NONE
		highlight CursorLine   guifg=NONE    guibg=NONE    gui=underline
		highlight CursorLineNr guifg=NONE    guibg=NONE    gui=bold,underline
		highlight LineNr       guifg=#f4bf75 guibg=NONE    gui=bold

		highlight Folded     guifg=#75b5aa guibg=#505050 gui=NONE
		highlight Conceal    guifg=#151515 guibg=NONE    gui=NONE
		highlight Cursor     guifg=fg      guibg=bg      gui=NONE
		highlight Directory  guifg=#6a9fb5 guibg=NONE    gui=NONE
		highlight FoldColumn guifg=#75b5aa guibg=#505050 gui=NONE
		highlight IncSearch  guifg=#f5f5f5 guibg=#505050 gui=NONE
		highlight MatchParen guifg=#75b5aa guibg=#505050 gui=NONE
		highlight NonText    guifg=#732b2c guibg=NONE    gui=nocombine

		highlight ModeMsg    guifg=NONE    guibg=NONE    gui=bold
		highlight MoreMsg    guifg=#90a959 guibg=NONE    gui=bold
		highlight WarningMsg guifg=#f5f5f5 guibg=#a37f4e gui=NONE
		highlight ErrorMsg   guifg=#f5f5f5 guibg=#732b2c gui=NONE

		highlight Pmenu      guifg=#d0d0d0 guibg=NONE    gui=NONE
		highlight PmenuSbar  guifg=NONE    guibg=NONE    gui=NONE
		highlight PmenuSel   guifg=#f5f5f5 guibg=#505050 gui=NONE
		highlight PmenuThumb guifg=NONE    guibg=#505050 gui=NONE
		highlight WildMenu   guifg=#f5f5f5 guibg=#505050 gui=NONE

		highlight Question   guifg=#90a959 guibg=NONE    gui=bold
		highlight Search     guifg=#f5f5f5 guibg=#505050 gui=NONE
		highlight SignColumn guifg=#75b5aa guibg=#505050 gui=NONE
		highlight SpecialKey guifg=#75b5aa guibg=NONE    gui=NONE

		highlight SpellBad   guifg=NONE guibg=NONE guisp=#ac4142 gui=undercurl
		highlight SpellCap   guifg=NONE guibg=NONE guisp=#6a9fb5 gui=undercurl
		highlight SpellLocal guifg=NONE guibg=NONE guisp=#75b5aa gui=undercurl
		highlight SpellRare  guifg=NONE guibg=NONE guisp=#aa759f gui=undercurl

		highlight StatusLine   guifg=#f5f5f5 guibg=#d0d0d0 gui=bold
		highlight StatusLineNC guifg=#d0d0d0 guibg=NONE    gui=NONE

		highlight TabLine     guifg=#505050 guibg=NONE    gui=NONE
		highlight TabLineFill guifg=NONE    guibg=NONE    gui=NONE
		highlight TabLineSel  guifg=#f5f5f5 guibg=#505050 gui=bold

		highlight Title        guifg=#ac4142 guibg=NONE gui=bold
		highlight WinSeparator guifg=#505050 guibg=NONE gui=NONE

		highlight Visual guifg=#f5f5f5 guibg=#505050 gui=NONE

		highlight Comment    guifg=#505050 guibg=NONE    gui=NONE
		highlight Constant   guifg=#aa759f guibg=NONE    gui=NONE
		highlight Error      guifg=#ac4142 guibg=NONE    gui=NONE
		highlight Function   guifg=#75b5aa guibg=NONE    gui=bold
		highlight Identifier guifg=#75b5aa guibg=NONE    gui=NONE
		highlight Ignore     guifg=#151515 guibg=NONE    gui=NONE
		highlight Operator   guifg=#f4bf75 guibg=NONE    gui=bold
		highlight PreProc    guifg=#75b5aa guibg=NONE    gui=NONE
		highlight Repeat     guifg=#f4bf75 guibg=NONE    gui=NONE
		highlight Special    guifg=#a37f4e guibg=NONE    gui=NONE
		highlight Statement  guifg=#f4bf75 guibg=NONE    gui=NONE
		highlight Todo       guifg=#f5f5f5 guibg=#505050 gui=NONE
		highlight Type       guifg=#90a959 guibg=NONE    gui=NONE
		highlight Underlined guifg=#6a9fb5 guibg=NONE    gui=underline

		highlight DiffAdd    guifg=NONE    guibg=#476a79 gui=NONE
		highlight DiffChange guifg=NONE    guibg=#714e6a gui=NONE
		highlight DiffText   guifg=NONE    guibg=#ac4142 gui=bold
		highlight DiffDelete guifg=#6a9fb5 guibg=#4e7971 gui=bold
	endif
elseif ((match($PARENT_TERM, 'foot*') != -1) || (match($TERM, 'foot*') != -1))
	if (&background == "dark")
		highlight Normal ctermfg=7 ctermbg=NONE cterm=NONE

		highlight ColorColumn  ctermfg=NONE ctermbg=1    cterm=NONE
		highlight CursorColumn ctermfg=NONE ctermbg=1    cterm=NONE
		highlight CursorLine   ctermfg=NONE ctermbg=NONE cterm=underline
		highlight CursorLineNr ctermfg=NONE ctermbg=NONE cterm=bold,underline
		highlight LineNr       ctermfg=11   ctermbg=NONE cterm=bold

		highlight Folded     ctermfg=14   ctermbg=8    cterm=NONE
		highlight Conceal    ctermfg=0    ctermbg=NONE cterm=NONE
		highlight Cursor     ctermfg=NONE ctermbg=NONE cterm=reverse
		highlight Directory  ctermfg=12   ctermbg=NONE cterm=NONE
		highlight FoldColumn ctermfg=14   ctermbg=8    cterm=NONE
		highlight IncSearch  ctermfg=15   ctermbg=8    cterm=NONE
		highlight MatchParen ctermfg=14   ctermbg=8    cterm=NONE
		highlight NonText    ctermfg=1    ctermbg=NONE cterm=nocombine

		highlight ModeMsg    ctermfg=NONE ctermbg=NONE cterm=bold
		highlight MoreMsg    ctermfg=10   ctermbg=NONE cterm=bold
		highlight WarningMsg ctermfg=15   ctermbg=3    cterm=NONE
		highlight ErrorMsg   ctermfg=15   ctermbg=1    cterm=NONE

		highlight Pmenu      ctermfg=7    ctermbg=NONE cterm=NONE
		highlight PmenuSbar  ctermfg=NONE ctermbg=NONE cterm=NONE
		highlight PmenuSel   ctermfg=15   ctermbg=8    cterm=bold
		highlight PmenuThumb ctermfg=NONE ctermbg=8    cterm=NONE
		highlight WildMenu   ctermfg=15   ctermbg=8    cterm=NONE

		highlight Question   ctermfg=10 ctermbg=NONE cterm=bold
		highlight Search     ctermfg=15 ctermbg=8    cterm=NONE
		highlight SignColumn ctermfg=14 ctermbg=8    cterm=NONE
		highlight SpecialKey ctermfg=14 ctermbg=NONE cterm=NONE

		highlight SpellBad   ctermfg=NONE ctermbg=1 cterm=underline
		highlight SpellCap   ctermfg=NONE ctermbg=4 cterm=underline
		highlight SpellLocal ctermfg=NONE ctermbg=6 cterm=underline
		highlight SpellRare  ctermfg=NONE ctermbg=5 cterm=underline

		highlight StatusLine   ctermfg=15 ctermbg=8    cterm=bold
		highlight StatusLineNC ctermfg=7  ctermbg=NONE cterm=NONE

		highlight TabLine     ctermfg=8    ctermbg=NONE cterm=NONE
		highlight TabLineFill ctermfg=NONE ctermbg=NONE cterm=NONE
		highlight TabLineSel  ctermfg=15   ctermbg=8    cterm=bold

		highlight Title        ctermfg=9 ctermbg=NONE cterm=bold
		highlight WinSeparator ctermfg=8 ctermbg=NONE cterm=NONE

		highlight Visual ctermfg=15 ctermbg=8 cterm=NONE

		highlight Comment    ctermfg=8  ctermbg=NONE cterm=NONE
		highlight Constant   ctermfg=13 ctermbg=NONE cterm=NONE
		highlight Error      ctermfg=9  ctermbg=NONE cterm=NONE
		highlight Function   ctermfg=14 ctermbg=NONE cterm=bold
		highlight Identifier ctermfg=14 ctermbg=NONE cterm=NONE
		highlight Ignore     ctermfg=0  ctermbg=NONE cterm=NONE
		highlight Operator   ctermfg=11 ctermbg=NONE cterm=bold
		highlight PreProc    ctermfg=14 ctermbg=NONE cterm=NONE
		highlight Repeat     ctermfg=11 ctermbg=NONE cterm=NONE
		highlight Special    ctermfg=3  ctermbg=NONE cterm=NONE
		highlight Statement  ctermfg=11 ctermbg=NONE cterm=NONE
		highlight Todo       ctermfg=15 ctermbg=8    cterm=NONE
		highlight Type       ctermfg=10 ctermbg=NONE cterm=NONE
		highlight Underlined ctermfg=12 ctermbg=NONE cterm=underline

		highlight DiffAdd    ctermfg=NONE ctermbg=4 cterm=NONE
		highlight DiffChange ctermfg=NONE ctermbg=5 cterm=NONE
		highlight DiffText   ctermfg=NONE ctermbg=1 cterm=bold
		highlight DiffDelete ctermfg=12   ctermbg=6 cterm=bold
	endif
else
	if (&background == "dark")
		highlight Normal ctermfg=7 ctermbg=NONE cterm=NONE

		highlight ColorColumn  ctermfg=NONE ctermbg=1    cterm=NONE
		highlight CursorColumn ctermfg=NONE ctermbg=1    cterm=NONE
		highlight CursorLine   ctermfg=NONE ctermbg=NONE cterm=NONE
		highlight CursorLineNr ctermfg=NONE ctermbg=NONE cterm=bold
		highlight LineNr       ctermfg=3    ctermbg=NONE cterm=bold

		highlight Folded     ctermfg=6    ctermbg=7    cterm=bold
		highlight Conceal    ctermfg=0    ctermbg=NONE cterm=NONE
		highlight Cursor     ctermfg=NONE ctermbg=NONE cterm=reverse
		highlight Directory  ctermfg=4    ctermbg=NONE cterm=bold
		highlight FoldColumn ctermfg=6    ctermbg=7    cterm=bold
		highlight IncSearch  ctermfg=0    ctermbg=7    cterm=NONE
		highlight MatchParen ctermfg=6    ctermbg=7    cterm=bold
		highlight NonText    ctermfg=1    ctermbg=NONE cterm=nocombine

		highlight ModeMsg    ctermfg=NONE ctermbg=NONE cterm=bold
		highlight MoreMsg    ctermfg=2    ctermbg=NONE cterm=bold
		highlight WarningMsg ctermfg=7    ctermbg=3    cterm=bold
		highlight ErrorMsg   ctermfg=7    ctermbg=1    cterm=bold

		highlight Pmenu      ctermfg=7    ctermbg=NONE cterm=NONE
		highlight PmenuSbar  ctermfg=NONE ctermbg=NONE cterm=NONE
		highlight PmenuSel   ctermfg=0    ctermbg=7    cterm=NONE
		highlight PmenuThumb ctermfg=NONE ctermbg=7    cterm=NONE
		highlight WildMenu   ctermfg=0    ctermbg=7    cterm=NONE

		highlight Question   ctermfg=2 ctermbg=NONE cterm=bold
		highlight Search     ctermfg=0 ctermbg=7    cterm=NONE
		highlight SignColumn ctermfg=6 ctermbg=7    cterm=bold
		highlight SpecialKey ctermfg=6 ctermbg=NONE cterm=bold

		highlight SpellBad   ctermfg=NONE ctermbg=1 cterm=NONE
		highlight SpellCap   ctermfg=NONE ctermbg=4 cterm=NONE
		highlight SpellLocal ctermfg=NONE ctermbg=6 cterm=NONE
		highlight SpellRare  ctermfg=NONE ctermbg=5 cterm=NONE

		highlight StatusLine   ctermfg=7 ctermbg=NONE cterm=bold
		highlight StatusLineNC ctermfg=7 ctermbg=NONE cterm=NONE

		highlight TabLine     ctermfg=5    ctermbg=NONE cterm=bold
		highlight TabLineFill ctermfg=NONE ctermbg=NONE cterm=NONE
		highlight TabLineSel  ctermfg=0    ctermbg=7    cterm=NONE

		highlight Title        ctermfg=1 ctermbg=NONE cterm=bold
		highlight WinSeparator ctermfg=0 ctermbg=NONE cterm=bold

		highlight Visual ctermfg=0 ctermbg=7 cterm=NONE

		highlight Comment    ctermfg=0 ctermbg=NONE cterm=bold
		highlight Constant   ctermfg=5 ctermbg=NONE cterm=bold
		highlight Error      ctermfg=1 ctermbg=NONE cterm=bold
		highlight Function   ctermfg=6 ctermbg=NONE cterm=bold
		highlight Identifier ctermfg=6 ctermbg=NONE cterm=bold
		highlight Ignore     ctermfg=0 ctermbg=NONE cterm=NONE
		highlight Operator   ctermfg=3 ctermbg=NONE cterm=bold
		highlight PreProc    ctermfg=6 ctermbg=NONE cterm=bold
		highlight Repeat     ctermfg=3 ctermbg=NONE cterm=bold
		highlight Special    ctermfg=3 ctermbg=NONE cterm=NONE
		highlight Statement  ctermfg=3 ctermbg=NONE cterm=bold
		highlight Todo       ctermfg=0 ctermbg=7    cterm=NONE
		highlight Type       ctermfg=2 ctermbg=NONE cterm=bold
		highlight Underlined ctermfg=4 ctermbg=NONE cterm=bold

		highlight DiffAdd    ctermfg=NONE ctermbg=4 cterm=NONE
		highlight DiffChange ctermfg=NONE ctermbg=5 cterm=NONE
		highlight DiffText   ctermfg=NONE ctermbg=1 cterm=bold
		highlight DiffDelete ctermfg=4    ctermbg=6 cterm=bold
	endif
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 END OF FILE                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
