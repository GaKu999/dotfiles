#!/hint/vim
" vim:ft=vim:noet:ts=3:sw=3:
" file:$XDG_CONFIG_HOME/nvim/init.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:cachedir = stdpath("cache")
let g:configdir = stdpath("config")
let g:datadir = stdpath("data")
let g:rundir = stdpath("run")
let g:statedir = stdpath("state")


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set background=dark
set notermguicolors
colorscheme default

syntax enable
filetype indent plugin on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   OPTIONS                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set dictionary=spell

let &fillchars = "eob: ,fold: ,stl:─,stlnc:─"

set list

if ((match($PARENT_TERM, '^foot.*$') != -1) || (match($TERM, '^foot.*$') != -1))
	let &listchars = "eol:↲,extends:»,lead:·,precedes:«,tab:▸ ,trail:·"
else
	let &listchars = "eol:$,extends:>,lead:-,precedes:<,tab:==>,trail:-"
endif

set matchpairs=<:>,{:},(:),[:]
set showmatch

set whichwrap=b,s,<,>,[,]

set backup
set backupext=.bak
let &backupdir = statedir."/backup"
let &backupskip = "/tmp/*,/var/tmp/*,/run/*,/dev/shm/*,".rundir."/*"
set undofile

set history=10000
set undolevels=10000

set wildmode=longest,full

set foldmethod=indent
set linebreak
set shiftwidth=3
set smartindent
set tabstop=3

set ignorecase
set smartcase

set noruler
let &statusline = "%n:%f{%M%R%H%W%Y,%{&ff}}%=(0x%O:0x%B)\%=[%c:%l/%L]"

set autochdir
set autowrite
set autowriteall

let &guicursor = "n-v:block-blinkon1-blinkoff1,i-r-c:ver1-blinkon1-blinkoff1"

set title

let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_browsex_viewer = "xdgctl"
let g:netrw_dirhistmax = 0
let g:netrw_hide = 1
let g:netrw_list_hide = "^\..*$"
let g:netrw_liststyle = 3
let g:netrw_preview = 1
let g:netrw_winsize = 20

set colorcolumn=0
let s:oldcolorcolumn = 80

let s:oldfiletype = ''


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  FUNCTIONS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


function Alias(name, cmd)
	exec 'cnoreabbrev <expr> '.a:name
		\ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:name.'")'
		\ .'? ("'.a:cmd.'") : ("'.a:name.'"))'
endfunction

function BindOptionKey(key, option)
	let l:cmd=':set '.a:option.'! \| set '.a:option."?\<CR>"
	exec 'nnoremap '.a:key.' '.cmd
	exec 'inoremap '.a:key." \<C-O>".cmd
endfunction

command -nargs=+ BindOptionKey call BindOptionKey(<f-args>)

function s:ToggleColorColumn()
	if s:oldcolorcolumn
		windo let &colorcolumn = s:oldcolorcolumn
		let s:oldcolorcolumn = 0
	else
		let s:oldcolorcolumn = &colorcolumn
		windo let &colorcolumn = 0
	endif
endfunction

function s:ToggleBinary()
	if &binary
		%!xxd -r
		let &filetype = s:oldfiletype
		let s:oldfiletype = ''
		set nobinary
	else
		%!xxd
		let s:oldfiletype = &filetype
		set filetype=xxd
		set binary
	endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 AUTOCOMMANDS                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if &diff | syntax off | endif

autocmd BufReadPost * silent! normal! g`"zv

augroup Binary
	autocmd!
	autocmd BufReadPre   *.bin let &binary=1
	autocmd BufReadPost  *.bin if &binary | %!xxd
	autocmd BufReadPost  *.bin set filetype=xxd | endif
	autocmd BufWritePre  *.bin if &binary | %!xxd -r
	autocmd BufWritePre  *.bin endif
	autocmd BufWritePost *.bin if &binary | %!xxd
	autocmd BufWritePost *.bin set nomodified | endif
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   KEYBINDS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


nnoremap <silent> <F11> :previous<CR>
nnoremap <silent> <F12> :next<CR>

nnoremap <silent> <Space> :nohlsearch<CR>

call Alias("rmtw", '%s/\\(\\w\\)\\s\\+$/\\1/e')

call Alias("hex", 'call <SID>ToggleBinary()<CR>')

BindOptionKey <F2> number
BindOptionKey <F3> cursorline
BindOptionKey <F4> cursorcolumn
BindOptionKey <F5> list
BindOptionKey <F6> spell
BindOptionKey <F7> hlsearch
BindOptionKey <F8> paste
BindOptionKey <F9> wrap

nnoremap <silent> <BAR> :call <SID>ToggleColorColumn()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 END OF FILE                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
