"-----------------------------------------------------------------------------------------------------
" Helper Functions:
"-----------------------------------------------------------------------------------------------------
" setupt colorscheme and background
" trailing spaces

"-----------------------------------------------------------------------------------------------------
" Strip Trailing Spaces:
"function! <SID>StripTrailingWhitespaces()
function! StripTrailingWhitespaces()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	%s/\s\+$//e
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

"-----------------------------------------------------------------------------------------------------
" Toggle Relative Numbers:
if exists("+relativenumber")
	if v:version >= 400
		set number
	endif
	set relativenumber  " show relative line numbers
	set numberwidth=3   " narrow number column
	" cycles between relative / absolute / no numbering
	if v:version >= 400
		function! RelativeNumberToggle()
			if (&number == 1 && &relativenumber == 1)
				set nonumber
				set relativenumber relativenumber?
			elseif (&number == 0 && &relativenumber == 1)
				set norelativenumber
				set number number?
			elseif (&number == 1 && &relativenumber == 0)
				set norelativenumber
				set nonumber number?
			else
				set number
				set relativenumber relativenumber?
			endif
		endfunc
	else
		function! RelativeNumberToggle()
			if (&relativenumber == 1)
				set number number?
			elseif (&number == 1)
				set nonumber number?
			else
				set relativenumber relativenumber?
			endif
		endfunc
	endif
	nnoremap <silent> <leader>n :call RelativeNumberToggle()<CR>
else                  " fallback
	set number          " show line numbers
	" inverts numbering
	nnoremap <silent> <leader>tgn :set number! number?<CR>
endif

"-----------------------------------------------------------------------------------------------------
" Setup Current Colorscheme:
"function! <SID>SetCurrentColorScheme(scheme, background)
function! SetCurrentColorScheme(scheme, background)
	let scheme = a:scheme
	let bg  = a:background
	if has("terminfo")
		set t_Co=16
		"set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
		"set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
	else
		set t_Co=256
		set t_Sf=[3%dm
		set t_Sb=[4%dm
	endif

	if $TERM == 'xterm-color' && &t_Co == 8
		set t_Co=16
	endif

	if $TERM == 'xterm-256color' || $TERM == 'screen'
		set t_Co=256
		exec 'set background=' . bg
		exec 'colorscheme ' . scheme
	endif

endfunction
