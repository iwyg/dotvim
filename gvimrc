" Do some Themeing stuff if gui is available
set background=dark
set guifont=DejaVu\ Sans\ Mono:h12
set transparency=0
"	colorscheme mustang	
if has("gui_macvim")	
	"set theme
	syntax enable
	set transparency=0
"	colorscheme mustang	
	colorscheme solarized	

	set background=dark
"	set guifont=DejaVu\ Sans\ Mono:h12
	set guifont=Source\ Code\ Pro:h12

"	colorscheme dw_orange	
"	color lucius
"	color xoria256
"	color jellybeans+
"	colorscheme tir_black	
"	colorscheme macvim	
"	set guifont=Meslo\ LG\ M\ DZ:h14
"	set guifont=Meslo\ LG\ S\ DZ:h14
"	set guifont=Menlo:h12
"	set guifont=Liberation\ Mono:h12
"	set guifont=Bitstream\ Vera\ Sans\ Mono:h12
	"set guifont=Menlo:h12
	" set transparency
	"au FileType php colorscheme bclear 
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

	let g:solarized_termtrans=1
	let g:solarized_degrade=0
	let g:solarized_bold=1
	let g:solarized_underline=0
	let g:solarized_italic=1
	let g:solarized_termcolors=16
	let g:solarized_diffmode="normal"
	let g:solarized_menu=1
endif	
