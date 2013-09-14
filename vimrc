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
set number
set linespace=10

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

set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

"-------------------------------------------------------------------------------------
" Leader:
"-------------------------------------------------------------------------------------
let mapleader=","
command! -nargs=* Wrap set wrap linebreak nolist

"-------------------------------------------------------------------------------------
" Encoding:
"-------------------------------------------------------------------------------------
set encoding=utf8
set fileencoding=utf8
"-------------------------------------------------------------------------------------
"Set Line Numbers:
"-------------------------------------------------------------------------------------
set number
"set relativenumber
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
set tags=./.tags

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

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
" History:
"-------------------------------------------------------------------------------------
set history=1000
set undolevels=1000
set nobackup
set directory=~/.vim/tmp/swap/

"-------------------------------------------------------------------------------------
" Toggle Linenumbers:
"-------------------------------------------------------------------------------------
nmap <Leader>R :set number!<CR>

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
" Searching
"-------------------------------------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set showmatch
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
" Popup menu behavior
"-------------------------------------------------------------------------------------
set completeopt=longest,menu
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
set foldlevel=1

"xml folding
let g:xml_syntax_folding = 1
set foldmethod=syntax
"php folding
let g:php_syntax_folding = 1
let php_folding = 1
set foldmethod=indent


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
inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
noremap <Leader>e :call PhpExpandClass()<CR>

"=====================================================================================
" INSTANT MARKDOWN
"=====================================================================================
let g:instant_markdown_slow = 1
"=====================================================================================
" SYNTAX 
"=====================================================================================
if !exists("autocommands_loaded")
	let autocommands_loaded = 1

	" Sass And Less CSS Sytax:
	"-------------------------------------------------------------------------------------
	au BufNewFile,BufRead *.less set filetype=less
	au BufNewFile,BufRead *.scss set filetype=scss
	au BufNewFile,BufRead *.sass set filetype=sass
	au BufNewFile,BufRead *.ts set filetype=typescript
	au BufRead,BufNewFile *.dart set filetype=dart
	au BufRead,BufNewFile *.twig set filetype=htmljinja
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
	"	au BufNewFile,BufRead *.tpl setlocal filetype=smarty 	
	" Underscore Templates:	
	"-------------------------------------------------------------------------------------
	au BufNewFile,BufRead *.jst set syntax=jst
	au BufNewFile,BufRead *.tpl set syntax=jst
	" ObjectiveJ: 	
	"-------------------------------------------------------------------------------------
	au BufNewFile,BufRead *.j set syntax=objj

	"au BufWritePost *.php !phpctags %s &

endif

" PHP Manual Mapping: 	
"-------------------------------------------------------------------------------------
au BufReadPost *.php  set keywordprg=pman
au BufReadPost *.vim  map K :exe ":help ".expand("<cword>")<CR>
au BufReadPost .vimrc map K :exe ":help ".expand("<cword>")<CR>

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
	autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType sass setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType xml setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType less setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType xslt setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType std setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab

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
	autocmd FileType javascript              set omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType html,htmljinja          set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType smarty                  set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType xml                     set omnifunc=xmlcomplete#CompleteTags
	autocmd FileType xsl                     set omnifunc=xmlcomplete#CompleteTags

	autocmd FileType css                     setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown,htmljinja setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript              setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType typescript              setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python                  setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType smarty                  set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType xml                     setlocal omnifunc=xmlcomplete#CompleteTags
	autocmd FileType xslt                    setlocal omnifunc=xmlcomplete#CompleteTags
	autocmd FileType php                     setlocal omnifunc=phpcomplete#CompletePHP
	autocmd FileType php                     set omnifunc=phpcomplete#CompletePHP

endif


"=====================================================================================
" PLUGIN SETTINGS
"=====================================================================================

"" Snipmate:	
""-------------------------------------------------------------------------------------
"
"let g:snipMate = {}
"let g:snipMate.scope_aliases = {
"			\'javascript' : 'javascript,javascript-backbonejs,javascript-requirejs,javascript-underscorejs',
"			\'php' : 'php,symphony,phpunit',
"			\'xslt' : 'xslt,xml'
"			\} 
"let g:snipMate['no_match_completion_feedkeys_chars'] = ""
"
"""let g:snips_trigger_key = '<F2>'
""let g:snips_trigger_key = '<F2>'

"-------------------------------------------------------------------------------------

" Syntastic:	
"-------------------------------------------------------------------------------------
" parser
let s:javascript_executable = "/usr/local/bin/jshint"
let g:syntastic_php_exec = "/usr/local/bin/php"

let g:syntastic_ruby_exec = "/usr/local/bin/ruby"
let g:syntastic_json_exec = "/usr/local/bin/jsonlint"
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
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_html_checkers = ['tidy']


"let g:syntastic_mode_map = {'active_filetypes':
":w
"			\	['vim', 'js', 'javascript', 'less', 'html', 'xsl', 'json', 'xslt', 'xml', 'css', 'php', 'rb'], 
"			\	'mode': 'active', 
"			\	'passive_filetypes': ['py', 'scss']
"			\}

"!sudo phpcs --config-set severity-error 5
"!sudo phpcs --config-set severity-warning 8
"let g:syntastic_php_php_args = "-l -d error_reporting=E_ALL -d display_errors=1 -d log_errors=0 -d xdebug.cli_color=0"
let g:syntastic_php_phpcs_args = "--report=csv --standard=PSR2"

"let g:syntastic_php_phpcs_args = "--report=csv --standard=PSR2 --sniffs=Generic.Formatting.SpaceAfterCast,Generic.Functions.OpeningFunctionBraceBsdAllman,Generic.WhiteSpace.ScopeIndent,Squiz.Scope.MemberVarScope,Squiz.ControlStructures.ForLoopDeclaration,Squiz.ControlStructures.ControlSignature"

"let g:syntastic_php_phpcs_args = "--report=csv --standard=PSR2 --sniffs=Generic.Formatting.SpaceAfterCast,Generic.WhiteSpace.ScopeIndent,Squiz.Scope.MemberVarScope"
"
"let g:syntastic_php_phpcs_args = '--report=csv --standard=PSR2'

"let g:syntastic_php_phpcs_args = "--standard=PSR1"
"let g:syntastic_phpcs_conf = "--standard=PSR1 --sniffs=Generic.Formatting.SpaceAfterCast,Generic.Functions.OpeningFunctionBraceBsdAllman,Generic.WhiteSpace.ScopeIndent,Squiz.Scope.MemberVarScope,Squiz.Scope.MemberVarScope,Squiz.ControlStructures.ForLoopDeclaration,Squiz.ControlStructures.ControlSignature"
"let g:syntastic_phpcs_conf = "--standard=PSR2 --sniffs=Generic.Formatting.SpaceAfterCast,Generic.Functions.OpeningFunctionBraceBsdAllman,Squiz.Scope.MemberVarScope,Squiz.ControlStructures.ForLoopDeclaration,Squiz.ControlStructures.ControlSignature"
"

"let g:syntastic_php_phpcs_args = '--report=csv --standard=Symfony2'


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

map <Leader>SC :SyntasticCheck<CR>

" Thumbnail Buffer View
noremap <Leader><F1> :Thumbnail<CR>

" for Syntastic
"let g:syntastic_auto_loc_list=1 "Auto open errors window upon detection
"let g:syntastic_enable_signs=1
"let g:syntastic_auto_jump=1
"let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
"let g:syntastic_enable_balloons=1 

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"-------------------------------------------------------------------------------------
" PHP CS FIXER:	
"-------------------------------------------------------------------------------------
let g:php_cs_fixer_path = "~/.vim/tools/php-cs-fixer.phar"	" define the path to the php-cs-fixer.phar
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
let g:UltiSnipsSnippetsDir = "$HOME/.vim/bundle/custom-snippets"

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
" NERDTree:	
"-------------------------------------------------------------------------------------
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', '\.DS_*']
let NERDTreeShowHidden = 1
set guioptions-=L

map <Leader>n :NERDTree<CR>
map <Leader>nn :NERDTreeToggle<CR>

"-------------------------------------------------------------------------------------
" Supertab:	
"-------------------------------------------------------------------------------------
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"let g:SuperTabDefaultCompletionType = "context"
"-------------------------------------------------------------------------------------
" Neocomplcache:	
"-------------------------------------------------------------------------------------

"let g:acp_enableAtStartup = 0								" Disable AutoComplPop.
"let g:neocomplcache_enable_at_startup = 1					" Use neocomplcache.
"let g:neocomplcache_enable_smart_case = 1					" Use smartcase.
"let g:neocomplcache_enable_camel_case_completion = 1 		" Use camel case completion.
"let g:neocomplcache_enable_underbar_completion = 1			" Use underbar completion.
"let g:neocomplcache_min_syntax_length = 3					" Set minimum syntax keyword length.
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'	
"
"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.zsh_history',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"    \ }
"
"if !exists('g:neocomplcache_keyword_patterns')				" Define keyword.
"  let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
""imap <C-k><Plug>(neocomplcache_snippets_expand)				" Plugin key-mappings.
""smap <C-k><Plug>(neocomplcache_snippets_expand)
""inoremap <expr><C-g>neocomplcache#undo_completion()
""inoremap <expr><C-l>neocomplcache#complete_common_string()
"
"" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"


"" Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
""autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'


" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif

let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

if has("gui_running")
	highlight SpellBad term=underline gui=undercurl guisp=Orange
endif

"-------------------------------------------------------------------------------------
" TAGBAR:
"-------------------------------------------------------------------------------------
" TagbarToggle 
nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_phpctags_bin='/usr/local/bin/phpctags'
let g:tagbar_phpctags_memory_limit = '512M'

let g:tagbar_type_javascript = {
\ 'ctagsbin' : '/usr/local/bin/jsctags',
\ 'ctagsargs' : '-f -'
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

"-------------------------------------------------------------------------------------
" Compile Current LESS Buffer To CSS:	
"-------------------------------------------------------------------------------------

autocmd FileWritePost,BufWritePost *.less :call LessCSSCompress()
function! LessCSSCompress()
	let cwd = expand('<afile>:p:h')
	let name = expand('<afile>:t:r')
	if !isdirectory(cwd.'/..css/')
		cal system('mkdir -p '.cwd.'/../css/')
	endif	  
	if (executable('lessc'))
		let stdout = system('lessc '.cwd.'/'.name.'.less > '.cwd.'/../css/'.name.'.css &')
		if stdout != ''
			echo stdout
		endif
		"	call s:growl('lessc', 'successfully compiled'.name.'less')
	endif
endfunction

"-------------------------------------------------------------------------------------
" Growl:	
"-------------------------------------------------------------------------------------

function! s:growl(title, message)
	execute printf('silent !growlnotify -t %s -m %s', shellescape(a:title, 1), shellescape(a:message, 1))
endfunction

"=====================================================================================
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

"=====================================================================================
" Themes and GUI settings
"=====================================================================================

"-------------------------------------------------------------------------------------
" XTerm:	
"-------------------------------------------------------------------------------------
if $TERM == 'xterm-color' && &t_Co == 8
	set t_Co=16
endif
if $TERM == 'xterm-256color'
	"colorscheme wombat256
	"set t_Co=256
	"Solarized stuff
	"let g:solarized_termtrans = 3
	set background=dark
	colorscheme smyck
endif

if has("terminfo")
	set t_Co=16
	set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
	set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
else
	set t_Co=16
	set t_Sf=[3%dm
	set t_Sb=[4%dm

endif

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
