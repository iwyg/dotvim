" Disable vi compatibility
set nocompatible
filetype off

set shell=zsh\ -i

" let $PATH=system("echo \$PATH")
"=====================================================================================
" Disable vi compatibility
"=====================================================================================
set nocompatible
filetype off

"=====================================================================================
"pathogen
"=====================================================================================
call pathogen#runtime_append_all_bundles()
call pathogen#helptags() "call this when installing new plugins

filetype plugin on
filetype plugin indent on
syntax enable
set ofu=syntaxcomplete#Complete
"=====================================================================================
" BASIC SETTINGS
"=====================================================================================

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
" cappuccino runtime
"-------------------------------------------------------------------------------------
set runtimepath+=/usr/local/narwhal/bin/objj

"-------------------------------------------------------------------------------------
"append $ when changing a word
"-------------------------------------------------------------------------------------
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

"if has("mouse")
"	set mouse=a
"endif	

"-------------------------------------------------------------------------------------
" Enable omni completion.
"-------------------------------------------------------------------------------------
if has("autocmd")
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType smarty set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
	autocmd FileType xslt setlocal omnifunc=xmlcomplete#CompleteTags
	autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
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
" SYNTAX 
"=====================================================================================
if !exists("autocommands_loaded")
  let autocommands_loaded = 1

" Less CSS Sytax:
"-------------------------------------------------------------------------------------
	au BufNewFile,BufRead *.less set filetype=less
" md, markdown, and mk are markdown and define buffer-local preview
"-------------------------------------------------------------------------------------
	au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown
" Add json syntax highlighting:
"-------------------------------------------------------------------------------------
	au BufNewFile,BufRead *.json set ft=javascript

"	au BufRead,BufNewFile *.txt call s:setupWrapping()
" Typoscript:
"-------------------------------------------------------------------------------------
	au BufNewFile,BufRead mozex.textarea.* setlocal filetype=typoscript
	au BufNewFile,BufRead *.ts setlocal filetype=typoscript 	
" Smarty:	
"-------------------------------------------------------------------------------------
	au BufNewFile,BufRead *.tpl setlocal filetype=smarty 	
" Underscore Templates:	
"-------------------------------------------------------------------------------------
	au BufNewFile,BufRead *.jst set syntax=jst

" ObjectiveJ: 	
"-------------------------------------------------------------------------------------
	au BufNewFile,BufRead *.j set syntax=objj

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
  autocmd FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType xml setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType less setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType xslt setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType php setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
   
  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif



"=====================================================================================
" AUTOCOMPLETION
"=====================================================================================
if has("autocmd")
	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType smarty set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
	autocmd FileType xsl set omnifunc=xmlcomplete#CompleteTags

endif


"=====================================================================================
" PLUGIN SETTINGS
"=====================================================================================

" Snipmate:	
"-------------------------------------------------------------------------------------

let g:snipMate = {}
let g:snipMate.scope_aliases = {} 
let g:snipMate.scope_aliases['javascript'] = 'javascript,javascript-backbonejs,javascript-requirejs,javascript-underscorejs'
let g:snipMate['no_match_completion_feedkeys_chars'] = ""
let g:snips_trigger_key = '<F2>'

"-------------------------------------------------------------------------------------

" Syntastic:	
"-------------------------------------------------------------------------------------
let g:syntastic_quiet_warnings=0
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_auto_jump=0
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1
let g:syntastic_enable_balloons = 1
let g:syntastic_loc_list_height=8


let g:syntastic_mode_map = {'active_filetypes': 
\	['vim', 'js', 'javascript', 'less', 'html', 'xsl', 'json', 'xslt', 'xml', 'css'], 
\	'mode': 'active', 
\	'passive_filetypes': ['py', 'scss']
\}

"let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

"!phpcs --config-set severity-error 5
"!phpcs --config-set severity-warning 8

"let g:syntastic_phpcs_conf = "--standard=PSR1 --sniffs=Generic.Formatting.SpaceAfterCast,Generic.Functions.OpeningFunctionBraceBsdAllman,Generic.WhiteSpace.ScopeIndent,Squiz.Scope.MemberVarScope,Squiz.Scope.MemberVarScope,Squiz.ControlStructures.ForLoopDeclaration,Squiz.ControlStructures.ControlSignature"
"let g:syntastic_phpcs_conf = "--standard=PSR1 --sniffs=Squiz.Scope.MemberVarScope"

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

map <Leader>SC :SyntasticCheck<CR>

"-------------------------------------------------------------------------------------
" PHP CS FIXER:	
"-------------------------------------------------------------------------------------
let g:php_cs_fixer_path = "~/.vim/tools/php-cs-fixer.phar"	" define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "all"							" which level ?
let g:php_cs_fixer_config = "default"						" configuration
let g:php_cs_fixer_php_path = "php"							" Path to PHP
let g:php_cs_fixer_fixers_list = ""							" List of fixers
let g:php_cs_fixer_enable_default_mapping = 1				" Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0								" Call command with dry-run option
let g:php_cs_fixer_verbose = 1

"-------------------------------------------------------------------------------------
" GIST VIM:
"-------------------------------------------------------------------------------------
let g:github_user = "iwyg-snippets"
let g:github_token = "$GITHUB_TOKEN"

"-------------------------------------------------------------------------------------
" JSBeautify:	
"-------------------------------------------------------------------------------------

let g:JSLintHighlightErrorLine = 1							" Turn on JSLint error highlighting
let g:Jsbeautify_jslint_whitespace = 1						" JSbreautyfy JSlint

"-------------------------------------------------------------------------------------
" NERDTree:	
"-------------------------------------------------------------------------------------
"let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']

map <Leader>n :NERDTree<CR>
map <Leader>nn :NERDTreeToggle<CR>
"-------------------------------------------------------------------------------------
" php doc:
"-------------------------------------------------------------------------------------
source ~/.vim/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 

"-------------------------------------------------------------------------------------
" Neocomplcache:	
"-------------------------------------------------------------------------------------

let g:acp_enableAtStartup = 0								" Disable AutoComplPop.
let g:neocomplcache_enable_at_startup = 1					" Use neocomplcache.
let g:neocomplcache_enable_smart_case = 1					" Use smartcase.
let g:neocomplcache_enable_camel_case_completion = 1 		" Use camel case completion.
let g:neocomplcache_enable_underbar_completion = 1			" Use underbar completion.
let g:neocomplcache_min_syntax_length = 3					" Set minimum syntax keyword length.
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'	

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.zsh_history',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

if !exists('g:neocomplcache_keyword_patterns')				" Define keyword.
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

imap <C-k><Plug>(neocomplcache_snippets_expand)				" Plugin key-mappings.
smap <C-k><Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>neocomplcache#undo_completion()
inoremap <expr><C-l>neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"


" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"-------------------------------------------------------------------------------------
" TAGBAR:
"-------------------------------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : 'jsctags'
\ }

"-------------------------------------------------------------------------------------
" TAGLIST:
"-------------------------------------------------------------------------------------
let Tlist_WinWidth='auto'
let Tlist_javascript_Hide_Extras=['type']

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
	echo stdout
  endif
endfunction

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
  set t_Co=256
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
