" Disable vi compatibility
set nocompatible
filetype off

"if has('gui_running')
" set shell=zsh\ -i
"endif
"if has("gui_running")
"  set sh=/bin/zsh
"endif

" let $PATH=system("echo \$PATH")
"=====================================================================================
" Disable vi compatibility
"=====================================================================================
set nocompatible
filetype off

set virtualedit=all
let g:dbgWaitTime = 30

set ruler
set cursorline

let g:cssColorVimDoNotMessMyUpdatetime = 1

"=====================================================================================
"pathogen
"=====================================================================================
execute pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

set ofu=syntaxcomplete#Complete
"=====================================================================================
" BASIC SETTINGS
"=====================================================================================

"=====================================================================================
" POWERLINE / AIR-LINE
"=====================================================================================
let g:airline_powerline_fonts = 1
"-------------------------------------------------------------------------------------
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
let g:Powerline_symbols = 'unicode'
set fillchars+=stl:\ ,stlnc:\
" Powerline quick setup
"-------------------------------------------------------------------------------------
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
"python from powerline.ext.vim import source_plugin; source_plugin()

"-------------------------------------------------------------------------------------
" Leader:
"-------------------------------------------------------------------------------------
let mapleader=","
command! -nargs=* Wrap set wrap linebreak nolist

"-------------------------------------------------------------------------------------
" auto source vimrc on save.
"-------------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufWritePost .vimrc nested :source $MYVIMRC
endif

nmap <leader>v :tabedit $MYVIMRC<CR>

"-------------------------------------------------------------------------------------
" Encoding:
"-------------------------------------------------------------------------------------
set encoding=utf8
set fileencoding=utf8
"-------------------------------------------------------------------------------------
"Set Line Numbers:
"-------------------------------------------------------------------------------------
set undofile
set ruler
set title
set backspace=indent,eol,start
"set nowrap
set wrap
set textwidth=79
set formatoptions=qrn1
set autowrite
set hidden

"-------------------------------------------------------------------------------------
" ctags runtime
"-------------------------------------------------------------------------------------
"set tags=./.tags
set tags=./tags,tags,$HOME/.vim/tags/laravel/tags,$HOME/.vim/tags/selene/tags;$HOME

" Cool tab completion stuff
set wildmenu
set wildmode=longest:list,full
set whichwrap=b,s,h,l,<,>,[,]
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" tag jumping
nnoremap ü <C-]>
nnoremap Ü <C-O>


"-------------------------------------------------------------------------------------
" cappuccino runtime
"-------------------------------------------------------------------------------------
set runtimepath+=/usr/local/narwhal/bin/objj

"-------------------------------------------------------------------------------------
"append $ when changing a word
"-------------------------------------------------------------------------------------
"set cpoptions=ces$
set cpoptions+=$

"-------------------------------------------------------------------------------------
" Map Next Prev Buffer:
"-------------------------------------------------------------------------------------
nmap <C-TAB> :b#<CR>
vmap <C-TAB> :b#<CR>

nmap <S-C-TAB> :bn<CR>
vmap <S-C-TAB> :bn<CR>

nmap <M-C-TAB> :bp<CR>
vmap <M-C-TAB> :bp<CR>

if has("mouse")
	set mouse=a
endif	

"-------------------------------------------------------------------------------------
" ICONS:
"-------------------------------------------------------------------------------------
let g:webdevicons_enable_airline_tabline = 0
let g:webdevicons_enable_airline_statusline = 0
"-------------------------------------------------------------------------------------

"-------------------------------------------------------------------------------------
" History:
"-------------------------------------------------------------------------------------
set history=1000
set undolevels=1000
set nobackup
set directory=.,$TMPDIR

"-------------------------------------------------------------------------------------
" Toggle Linenumbers:
"-------------------------------------------------------------------------------------
set relativenumber
set number

nmap <Leader>N :set number!<CR>
nmap <Leader>RN :set relativenumber!<CR>

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

"-------------------------------------------------------------------------------------
" COLOR PICKERS:
"-------------------------------------------------------------------------------------
"if exists("g:loaded_colorchooser") || !has('mac')
"else 
"endif
nmap <leader>rgb :ColorRGB<CR>
nmap <leader>hex :ColorHEX<CR>
"-------------------------------------------------------------------------------------
" Shortcut to rapidly toggle `set list`
"-------------------------------------------------------------------------------------
nmap <leader>L :set list!<CR>
"-------------------------------------------------------------------------------------
" prettyfy json
"-------------------------------------------------------------------------------------
map <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>

"-------------------------------------------------------------------------------------
" Use the same symbols as TextMate for tabstops and EOLs
"-------------------------------------------------------------------------------------
set listchars=tab:▸\ ,eol:¬,trail:·

"-------------------------------------------------------------------------------------
" hide scrollbars
"-------------------------------------------------------------------------------------
set guioptions-=l
set guioptions-=r

"-------------------------------------------------------------------------------------
"-------------------------------------------------------------------------------------
" BEAVIOR
"-------------------------------------------------------------------------------------
"-------------------------------------------------------------------------------------


let g:load_doxygen_syntax=0
"call s:InitVariable("g:syntax_extra_php", 'doxygen')
"call s:InitVariable("g:syntax_extra_inc", 'doxygen')
let g:local_vimrc = {'names':['.vimrc'],'hash_fun':'LVRHashOfFile'}
set scrolljump=4
set scrolloff=3
set foldenable

" Searching
"-------------------------------------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set showmatch "show matching brackets
set hlsearch
set gdefault
set grepprg=ack
runtime macros/matchit.vim

"-------------------------------------------------------------------------------------
" Status bar
"-------------------------------------------------------------------------------------
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

"-------------------------------------------------------------------------------------
"tab moving
"-------------------------------------------------------------------------------------
map <C-L> :tabn<CR>
map <C-H> :tabp<CR>

"-------------------------------------------------------------------------------------
"tabindex
"-------------------------------------------------------------------------------------
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set noexpandtab

"-------------------------------------------------------------------------------------
" Misc
"-------------------------------------------------------------------------------------
set linespace=1
"-------------------------------------------------------------------------------------
" Popup menu behavior
"-------------------------------------------------------------------------------------
"set completeopt+=longest,menu ",preview
set completeopt=menu,menuone,longest ",preview
set pumheight=20
set complete-=i
"-------------------------------------------------------------------------------------
"code folding
"-------------------------------------------------------------------------------------
"Then you can toggle folding with za. 
"You can fold everything with zM and unfold everything with zR. zm and zr 
"can be used to get those folds just right. 
"Always remember the almighty help file at “help :folding” if you get stuck.

set foldmethod=syntax		"fold based on indent
set foldnestmax=10			"deepest fold is 10 levels
set nofoldenable			"dont fold by default
set foldlevel=2

"xml folding
let g:xml_syntax_folding = 1
set foldmethod=syntax
"php folding
let g:php_syntax_folding = 1
let php_folding = 1
set foldmethod=syntax

let g:php_syntax_extensions_enabled = ['yml', 'xsl', 'xml', 'simplexml', 'imagick', 'intl', 'json', 'dom', 'reflection', 'spl']
"let b:php_syntax_extensions_enabled = 1


"=====================================================================================
" PHP Stuff
"=====================================================================================

" PHPFolding
map <F5> <Esc>:EnableFastPHPFolds<Cr>
map <F6> <Esc>:EnablePHPFolds<Cr>
map <F7> <Esc>:DisablePHPFolds<Cr>
" disable auto folding
let g:DisableAutoPHPFolding = 1

"=====================================================================================
" PHP Namespace
"=====================================================================================

"Expands the class name under the cursor to its fully qualified name.

inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
noremap <Leader>e :call PhpExpandClass()<CR>

"Automatically adds the corresponding use statement for the class under the cursor.
inoremap <Leader>un <C-O>:call PhpInsertUse()<CR>
noremap <Leader>un :call PhpInsertUse()<CR>

"=====================================================================================
" INSTANT MARKDOWN
"=====================================================================================
let g:instant_markdown_slow = 1
let g:instant_markdown_serverport = '8099'
"=====================================================================================
" SYNTAX 
"=====================================================================================
if !exists("autocommands_loaded")
	let autocommands_loaded = 1

	" Sass And Less CSS Sytax:
	"-------------------------------------------------------------------------------------
	au BufNewFile,BufRead *.less       set filetype=less
	au BufNewFile,BufRead *.scss       set filetype=scss
	au BufNewFile,BufRead *.sass       set filetype=sass
	au BufNewFile,BufRead *.ts         set filetype=typescript
	au BufRead,BufNewFile *.dart       set filetype=dart
	"au BufRead,BufNewFile *.twig       set filetype=htmljinja
	"au BufRead,BufNewFile *.twig       set filetype=twig
	au BufRead,BufNewFile *.handlebars set filetype=html
	" md, markdown, and mk are markdown and define buffer-local preview
	"-------------------------------------------------------------------------------------
	au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown
	au BufRead,BufNewFile *.{jshintrc,*rc} set ft=rc
	au BufRead,BufNewFile *.{vimrc,gvimrc} set ft=vim
	" Add json syntax highlighting:
	"-------------------------------------------------------------------------------------
	"au BufNewFile,BufRead *.json set ft=javascript

	"	au BufRead,BufNewFile *.txt call s:setupWrapping()
	" Typoscript:
	"-------------------------------------------------------------------------------------
	"	au BufNewFile,BufRead mozex.textarea.* setlocal filetype=typoscript
	"	au BufNewFile,BufRead *.ts setlocal filetype=typoscript 	
	" Smarty:	
	"-------------------------------------------------------------------------------------
	au BufNewFile,BufRead *.tpl setlocal filetype=smarty 	
	" Underscore Templates:	
	"-------------------------------------------------------------------------------------
	au BufNewFile,BufRead *.jst set syntax=jst
	au BufNewFile,BufRead *.tpl set syntax=jst
	" ObjectiveJ: 	
	"-------------------------------------------------------------------------------------
	au BufNewFile,BufRead *.j set syntax=objj

	"au BufWritePost *.php !phpctags %s &
	au VimEnter * NERDTree

endif

" PHP Manual Mapping: 	
"-------------------------------------------------------------------------------------
au BufReadPost *.php  set keywordprg=pman
au BufReadPost *.vim  map K :exe ":help ".expand("<cword>")<CR>
au BufReadPost .vimrc map K :exe ":help ".expand("<cword>")<CR>

"-------------------------------------------------------------------------------------
" RAINBOW PARANTHESES:
"---------------------------------------o----------------------------------------------
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"-------------------------------------------------------------------------------------
" Ctags:
"-------------------------------------------------------------------------------------
" plugin rbtags
"-------------------------------------------------------------------------------------
let g:rebtags_root_markers = ['.git', '.project', '.idea']
let g:rebtags_ctags_config_file = '.ctags'
"let g:rebtags_extra_arguments = '-R --fields=+aimS --languages=php'

"-------------------------------------------------------------------------------------
" Set Filetype Indentation:
"-------------------------------------------------------------------------------------
set autoindent

" Only do this part when compiled with support for autocommands
if has("autocmd")
	" Enable file type detection
	filetype on

	" Syntax of these languages is fussy over tabs Vs spaces
	autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

	" Customisations based on house-style (arbitrary)
	autocmd FileType html,xhtml,htmljinja,twig,toml setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType css                 setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType scss                setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType sass                setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType xml                 setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType less                setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType xslt                setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType php                 setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType std                 setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType javascript          setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType json                setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType blade               setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType twig                setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType toml                setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType py                  setlocal ts=8 sts=4 sw=4 expandtab

	" Treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss setfiletype xml
	" Treat .std template files as php
	autocmd BufNewFile,BufRead *.std setfiletype php

	"change the cursor appereance in insert mode
	"autocmd InsertEnter,InsertLeave * set cul!
endif

let php_sql_query=1                                                                                        
let php_htmlInStrings=1

"=====================================================================================
" AUTOCOMPLETION
"=====================================================================================
if has("autocmd")
	autocmd FileType javascript                      set omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType html,htmljinja					 set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType smarty                          set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType xml                             set omnifunc=xmlcomplete#CompleteTags
	autocmd FileType xsl                             set omnifunc=xmlcomplete#CompleteTags

	autocmd FileType css,scss,sass,less              setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown,htmljinja,blade   setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript                      setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType typescript                      setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python                          setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType smarty                          set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType xml                             setlocal omnifunc=xmlcomplete#CompleteTags
	autocmd FileType xslt                            setlocal omnifunc=xmlcomplete#CompleteTags
	autocmd FileType php							 setlocal omnifunc=phpcomplete#CompletePHP
	autocmd FileType ruby                            setlocal omnifunc=rubycomplete#Complete
	autocmd FileType twig							 set omnifunc=phpcomplete#CompletePHP
	autocmd FileType twig							 set omnifunc=xmlcomplete#CompleteTags
	autocmd FileType blade							 set omnifunc=phpcomplete#CompletePHP

endif

"-------------------------------------------------------------------------------------
" PHPcomplete:
"-------------------------------------------------------------------------------------

"=====================================================================================
" Enables use of tags when the plugin tries to find variables. 
" When enabled the plugin will search for the variables in the tag files with kind 'v', 
" lines like $some_var = new Foo; but these usually yield highly inaccurate results and can be fairly slow.
let g:phpcomplete_search_tags_for_variables = 1
"=====================================================================================
" When enabled the preview window's content will include information extracted from 
" docblock comments of the completions. Enabling this option will add return types to the 
" completion menu for functions too.
let g:phpcomplete_parse_docblock_comments = 1
"=====================================================================================
"When enabled the taglist() lookups will be cached and subsequent searches for the same pattern will 
"not check the tagfiles any more, thus making the lookups faster. Cache expiration is based on 
"the mtimes of the tag files.
let g:phpcomplete_cache_taglists = 1

"-------------------------------------------------------------------------------------
" Thumbnail Buffer View:	
"-------------------------------------------------------------------------------------
"noremap <Leader><F1> :Thumbnail<CR>
"noremap <Leader><F1> :Thumbnail<CR>
map <Leader>tnb :Thumbnail<CR>

"-------------------------------------------------------------------------------------
" Syntastic:	
"-------------------------------------------------------------------------------------
" parser
"let s:javascript_executable = "/usr/local/share/npm/bin/jshint"
let s:javascript_executable = "/usr/local/bin/jsxhint"
let g:syntastic_php_exec = "/usr/local/bin/php"

let g:syntastic_ruby_exec = "/usr/local/bin/ruby"
let g:syntastic_json_exec = "/usr/local/share/npm/bin/jsonlint"
"
"let g:syntastic_quiet_warnings=1
"let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_auto_jump=0
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1
"let g:syntastic_enable_balloons = 1
let g:syntastic_loc_list_height=4
"let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_html_checkers = ['tidy']
" Ignore Angular ng-* attributes error
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_php_phpmd_post_args = "text unusedcode"

"let g:syntastic_python_exec = "/usr/local/bin/python"

let g:syntastic_python_exec = "/usr/local/bin/python3.4"
let g:syntastic_python_checkers=['/usr/local/bin/python3.4']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nnoremap <silent> ` :Errors<CR>

map <Leader>SC :SyntasticCheck<CR>

" for Syntastic
let g:syntastic_auto_loc_list=0 "Auto open errors window upon detection
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
"let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
"let g:syntastic_enable_balloons=1 

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"force PSR-2 standard 
let g:syntastic_php_phpcs_args = "--report=csv --standard=PSR2"
" Read the clang complete file
"let g:syntastic_objc_config_file = '.clang_complete'
" Tell it to use clang instead of gcc
let g:syntastic_objc_checker = 'clang'

"-------------------------------------------------------------------------------------
" PHPUNIT:
"-------------------------------------------------------------------------------------

function! RunPHPUnitTest()
    "cd %:p:h
    pwd
    let result = system("vendor/bin/phpunit " . bufname("%"))
    split __PHPUnit_Result__
    normal! ggdG
    setlocal buftype=nofile
    call append(0, split(result, '\v\n'))
    cd -
endfunction

nnoremap <leader>u :call RunPHPUnitTest()<cr>

"-------------------------------------------------------------------------------------
" PHP CS FIXER:	
"-------------------------------------------------------------------------------------
let g:php_cs_fixer_path = "~/.composer/vendor/bin/php-cs-fixer"	" define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "psr2"							" which level ?
let g:php_cs_fixer_config = "default"						" configuration
let g:php_cs_fixer_php_path = "/usr/local/bin/php"			" Path to PHP
let g:php_cs_fixer_fixers_list = ""							" List of fixers
let g:php_cs_fixer_enable_default_mapping = 1				" Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0								" Call command with dry-run option
let g:php_cs_fixer_verbose = 1

nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

"-------------------------------------------------------------------------------------
" PHP DOC:	
"-------------------------------------------------------------------------------------
let g:pdv_template_dir = $HOME ."/.vim/tools/pdv_templates"
nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>

"let g:pdv_template_dir = $HOME ."/.vim/bundle/vim-pdv/templates"
"nnoremap <C-p> :call pdv#DocumentCurrentLine()<CR>
"nnoremap  <C-P> :call pdv#DocumentCurrentLine()<CR>

"inoremap <C-P> <ESC>:call pdv#PhpDocSingle()<CR>i 
"nnoremap <C-P> :call pdv#PhpDocSingle()<CR> 
"vnoremap <C-P> :call pdv#PhpDocRange()<CR> 
"
"source ~/.vim/bundle/vim-pdv/autoload/pdv.vim
"imap <C-o> :set paste<CR>:exe pdv#PhpDoc()<CR>:set nopaste<CR>i

" PHP documenter script bound to Control-P
" autocmd FileType php inoremap <C-p> <ESC>:call PhpDocSingle()<CR>i
" autocmd FileType php nnoremap <C-p> :call PhpDocSingle()<CR>
" autocmd FileType php vnoremap <C-p> :call PhpDocRange()<CR> 

"let g:pdv_cfg_Type = "Mixed"
"let g:pdv_cfg_Package = ""
"let g:pdv_cfg_Version = "$id$"
"let g:pdv_cfg_Author = "Thomas Appel <thomas@soario.com>"
"let g:pdv_cfg_Copyright = "2012-2015 Soario Inc. <http://soario.com>"
""let g:pdv_cfg_License = "PHP Version 3.0 {@link http://www.php.net/license/3_0.txt}"
"let g:pdv_cfg_License = "http://soario.com/faq/licenses Soario Inc. Software License Version 1.0"
"
"let g:pdv_cfg_Type = "Mixed"
"let g:pdv_cfg_Package = ""
"let g:pdv_cfg_Version = "$Id$"
"let g:pdv_cfg_Author = "Thomas Appel <mail@thomas@appel.com>"
"let g:pdv_cfg_Copyright = "2012-2015 Thomas Appel. <mail@thomas@appel.com>"
""let g:pdv_cfg_License = "PHP Version 3.0 {@link http://www.php.net/license/3_0.txt}"
"let g:pdv_cfg_License = "MIT"
"-------------------------------------------------------------------------------------
" GIST VIM:
"-------------------------------------------------------------------------------------
"let g:github_user = "iwyg-snippets"
"let g:github_token = "$GITHUB_TOKEN"
"-------------------------------------------------------------------------------------
" ULTISNIPS:
"-------------------------------------------------------------------------------------
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetsDir = "$HOME/.vim/snippets"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"-------------------------------------------------------------------------------------
" JSBeautify:	
"-------------------------------------------------------------------------------------

let g:JSLintHighlightErrorLine = 1							" Turn on JSLint error highlighting
let g:Jsbeautify_jslint_whitespace = 1						" JSbreautyfy JSlint
let g:Jsbeautify_jslint_expandtab = 1                       " expand tabs to spaces

"-------------------------------------------------------------------------------------
" Jsx:	
"-------------------------------------------------------------------------------------
" allow jsx in .js files
let g:jsx_ext_required = 0
"-------------------------------------------------------------------------------------
" NERDTree:	
"-------------------------------------------------------------------------------------
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', '\.DS_*']
let NERDTreeShowHidden = 1
set guioptions-=L

map <Leader>nf :NERDTreeFind<CR>
map <Leader>ncd :NERDTreeCWD<CR>
map <Leader>n :NERDTree<CR>
map <Leader>nn :NERDTreeToggle<CR>

"-------------------------------------------------------------------------------------
" SpellBad:
"-------------------------------------------------------------------------------------
if has("gui_running")
	highlight SpellBad term=underline gui=undercurl guisp=Orange
endif

"-------------------------------------------------------------------------------------
" YCM:
"-------------------------------------------------------------------------------------
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_auto_trigger = 1
"-------------------------------------------------------------------------------------
" TAGBAR:
"-------------------------------------------------------------------------------------
" TagbarToggle 
nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_phpctags_bin='~/.composer/vendor/bin/phpctags'
let g:tagbar_phpctags_memory_limit = '512M'

let g:tagbar_type_javascript = {
\ 'ctagsbin' : '/usr/local/share/npm/bin/jsctags'
\ }


" tagbar scala
"let g:tagbar_type_scala = {}
"let g:tagbar_type_scala.ctagstype = 'Scala'
"let g:tagbar_type_scala.kinds     = [
"  \ {'short' : 'p', 'long' : 'packages',  'fold' : 1 },
"  \ {'short' : 'V', 'long' : 'values',    'fold' : 0 },
"  \ {'short' : 'v', 'long' : 'variables', 'fold' : 0 },
"  \ {'short' : 'T', 'long' : 'types',     'fold' : 0 },
"  \ {'short' : 't', 'long' : 'traits',    'fold' : 0 },
"  \ {'short' : 'o', 'long' : 'objects',   'fold' : 0 },
"  \ {'short' : 'a', 'long' : 'aclasses',  'fold' : 0 },
"  \ {'short' : 'c', 'long' : 'classes',   'fold' : 0 },
"  \ {'short' : 'r', 'long' : 'cclasses',  'fold' : 0 },
"  \ {'short' : 'm', 'long' : 'methods',   'fold' : 0 }
"\ ]
"let g:tagbar_type_scala.sro        = '.'
"let g:tagbar_type_scala.kind2scope = {
"  \ 'T' : 'type',
"  \ 't' : 'trait',
"  \ 'o' : 'object',
"  \ 'a' : 'abstract class',
"  \ 'c' : 'class',
"  \ 'r' : 'case class'
"\ }
"let g:tagbar_type_scala.scope2kind = {
"  \ 'type'           : 'T',
"  \ 'trait'          : 't',
"  \ 'object'         : 'o',
"  \ 'abstract class' : 'a',
"  \ 'class'          : 'c',
"  \ 'case class'     : 'r'
"\ }
"let s:tagbar_known_types.scala = tagbar_type_scala

"-------------------------------------------------------------------------------------
" TAGLIST:
"-------------------------------------------------------------------------------------
"let Tlist_WinWidth='auto'
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
" let Tlist_javascript_Hide_Extras=['type']
" width of window
let Tlist_WinWidth = 30
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1

" set the names of flags
" let tlist_php_settings = 'php;c:class;f:function;d:constant'
" close all folds except for current file
let Tlist_File_Fold_Auto_Close = 1
" make tlist pane active when opened
let Tlist_GainFocus_On_ToggleOpen = 0
" close tlist when a selection is made
let Tlist_Close_On_Select = 0
nmap <Leader>tl :TlistToggle<CR>
"=====================================================================================
" FUNCTIONS 
"=====================================================================================

"-------------------------------------------------------------------------------------
" Strip Trailing Whitspace:	
"-------------------------------------------------------------------------------------

function! <SID>StripTrailingWhitespaces()
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

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

if has("autocmd")
	autocmd BufWritePre *.py,*.js,*.xsl,*.html,*.php,*.xml,*.css,*.less :call <SID>StripTrailingWhitespaces()
endif	

"=====================================================================================
" Themes and GUI settings
"=====================================================================================
"highlight Cursor guifg=white guibg=black
"highlight iCursor guifg=white guibg=steelblue
"set guicursor=n-v-c:block-Cursor
"set guicursor+=i:ver100-iCursor
"set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkwait10

"-------------------------------------------------------------------------------------
"-------------------------------------------------------------------------------------
" Appearance:	
"-------------------------------------------------------------------------------------
"-------------------------------------------------------------------------------------

"-------------------------------------------------------------------------------------
" xterm:	


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

if $TERM == 'xterm-256color'
	set t_Co=256
	set background=dark
	"colorscheme smyck
	colorscheme base16-ocean
endif

if &term =~ '^xterm'
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"-------------------------------------------------------------------------------------
" cursor:	
"if &term =~ "xterm\\|rxvt"
"	" use an orange cursor in insert mode
"	let t_SI = "\<Esc>]12;orange\x7"
"	" use a red cursor otherwise
"	let t_EI = "\<Esc>]12;red\x7"
"	silent !echo -ne "\033]12;red\007"
"	" reset cursor when vim exits
"	autocmd VimLeave * silent !echo -ne "\033]112\007"
"	" use \003]12;gray\007 for gnome-terminal
"endif
"if &term =~ '^xterm'
"	"solid underscore
"	let t_SI .= "\<Esc>[4 q"
"	" solid block
"	let t_EI .= "\<Esc>[2 q"
"	" 1 or 0 -> blinking block
"	" 3 -> blinking underscore
"	" Recent versions of xterm (282 or above) also support
"	" 5 -> blinking vertical bar
"	" 6 -> solid vertical bar
"endif

"
" lazy method of appending this onto your .vimrc ":w! >> ~/.vimrc"
" ------------------------------------------------------------------
" this block of commands has been autogenerated by solarized.vim and
" includes the current, non-default Solarized option values.
" To use, place these commands in your .vimrc file (replacing any
" existing colorscheme commands). See also ":help solarized"

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
" let g:solarized_underline=0    "default value is 1
" let g:solarized_contrast="high"    "default value is normal
" let g:solarized_visibility="high"    "default value is normal
" let g:solarized_hitrail=1    "default value is 0
" syntax enable
" set background=light
" colorscheme solarized
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=1
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_italic=1
" let g:solarized_termcolors=16
" let g:solarized_diffmode="normal"
" let g:solarized_menu=1

" @plugin php-vim

function! PhpSyntaxOverride()
  "hi! def link phpDocTags  phpDefine
  "hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
