"-----------------------------------------------------------------------------------------------------
" Disable Vi Compatibility:
"-----------------------------------------------------------------------------------------------------
set nocompatible

"-----------------------------------------------------------------------------------------------------
" Pathogen:
"-----------------------------------------------------------------------------------------------------
runtime bundle/vim-pathogen/autoload/pathogen.vim
"let g:pathogen_disabled = ['YouCompleteMe']
execute pathogen#infect('bundles_loaded/{}')
syntax on
filetype plugin indent on


"-----------------------------------------------------------------------------------------------------
" Behaviour And Settings:
"-----------------------------------------------------------------------------------------------------
" set leaderkey to ,:
let mapleader=","

" enable mouse interaction:
if has("mouse")
    set mouse=a
endif

set virtualedit=all
set ruler
set cursorline
set history=1000
set undofile
set undolevels=1000
set nobackup
set directory=.,$TMPDIR

" set omicimpletion
set ofu=syntaxcomplete#Complete

" Status bar
set laststatus=2
"disable statusline for poweline
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Cool tab completion stuff
set wildmenu
set wildmode=longest:list,full
set whichwrap=b,s,h,l,<,>,[,]

" encoding:
set encoding=utf8
set fileencoding=utf8
" format
set title
set backspace=indent,eol,start
set wrap
set textwidth=79
set linespace=1
set formatoptions=qrn1
set autowrite
set hidden
set autoindent

set cpoptions+=$

set relativenumber
set number

" hide scrollbars
set guioptions-=l
set guioptions-=r
" formatting:
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set noexpandtab

" set completeopt+=longest,menu ",preview
set completeopt=menu,menuone,longest ",preview
set pumheight=20
set complete-=i
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:›\ ,eol:¬,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

set scrolljump=4
set scrolloff=3
set foldenable

" code folding:
set foldmethod=syntax       "fold based on indent
set foldnestmax=10          "deepest fold is 10 levels
set nofoldenable            "dont fold by default
set foldlevel=2

let g:xml_syntax_folding = 1
let g:php_syntax_extensions_enabled = ['yml', 'xsl', 'xml', 'simplexml', 'imagick', 'intl', 'json', 'dom', 'reflection', 'spl']

" ctags
set tags=./tags

" searching: 
set ignorecase
set smartcase
set incsearch
set showmatch "show matching brackets
set hlsearch
set gdefault
set grepprg=ack
"runtime macros/matchit.vim

" wrap text:
command! -nargs=* Wrap set wrap linebreak nolist

"source helper functions;
source $HOME/.vim/fnrc

" set cursor shape in terminal:
" see http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
if &term =~ '^xterm'
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"-------------------------------------------------------------------------------------
" Powerline:
"-------------------------------------------------------------------------------------
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
let g:Powerline_symbols = 'unicode'
set fillchars+=stl:\ ,stlnc:\
" troubleshooting Powerline loosing color on saveing buffers
let g:miniBufExplForceSyntaxEnable = 1


" Enable file type detection
filetype on

if has("autocmd")
    " auto source vimrc on save:
	autocmd! BufWritePost $MYVIMRC nested :source $MYVIMRC
    " toggle line highlighting on insert mode
    autocmd InsertEnter,InsertLeave * set cul!

    " omnicompletion:
    autocmd FileType javascript                      set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html,htmljinja                  set omnifunc=htmlcomplete#CompleteTags
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
    autocmd FileType php                             setlocal omnifunc=phpcomplete#CompletePHP
    autocmd FileType ruby                            setlocal omnifunc=rubycomplete#Complete
    autocmd FileType twig                            set omnifunc=phpcomplete#CompletePHP
    autocmd FileType twig                            set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType blade                           set omnifunc=phpcomplete#CompletePHP

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
    " strip trailing space on buffer save
	autocmd BufWritePre *.py,*.js,*.xsl,*.html,*.php,*.xml,*.css,*.less :call <SID>StripTrailingWhitespaces()

	" Manual Mapping: 	
	au BufReadPost *.php  set keywordprg=pman
	au BufReadPost *.vim  map K :exe ":help ".expand("<cword>")<CR>
	au BufReadPost .vimrc map K :exe ":help ".expand("<cword>")<CR>

endif

"-------------------------------------------------------------------------------------
"Syntax:
"-------------------------------------------------------------------------------------

" Doxygen:
if has("autocmd")
	au Syntax cuda
		\ if (exists('b:load_doxygen_syntax') && b:load_doxygen_syntax)
		\       || (exists('g:load_doxygen_syntax') && g:load_doxygen_syntax)
		\   | runtime! syntax/doxygen.vim
		\ | endif
endif

if !exists("autocommands_loaded")
	let autocommands_loaded = 1

" Sass And Less CSS Sytax:
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
" Json:
	"-------------------------------------------------------------------------------------
	"au BufNewFile,BufRead *.json set ft=javascript

	"	au BufRead,BufNewFile *.txt call s:setupWrapping()
" Typoscript:
	"	au BufNewFile,BufRead mozex.textarea.* setlocal filetype=typoscript
	"	au BufNewFile,BufRead *.ts setlocal filetype=typoscript 	
" Smarty:	
	au BufNewFile,BufRead *.tpl setlocal filetype=smarty 	
" Underscore Templates:	
	au BufNewFile,BufRead *.jst set syntax=jst
	au BufNewFile,BufRead *.tpl set syntax=jst
" ObjectiveJ: 	
	au BufNewFile,BufRead *.j set syntax=objj

	"au BufWritePost *.php !phpctags %s &
	"au VimEnter * NERDTree

endif
"-------------------------------------------------------------------------------------
"PHP: 
let php_sql_query = 1
let php_htmlInStrings = 1

"-----------------------------------------------------------------------------------------------------
" Basic Mappings:
"-----------------------------------------------------------------------------------------------------

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

" disable arrow keys:
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

" edit open vimrc:
nmap <leader>v :e $MYVIMRC<CR>

" tag jump to next tag:
nnoremap ü <C-]>
" tag jump to previous tag:
nnoremap Ü <C-O>

" Buffer jumping:
nmap <C-TAB> :b#<CR>
vmap <C-TAB> :b#<CR>

nmap <S-C-TAB> :bn<CR>
vmap <S-C-TAB> :bn<CR>

nmap <M-C-TAB> :bp<CR>
vmap <M-C-TAB> :bp<CR>

" toggle line numbers:
nmap <Leader>N :set number!<CR>
" toggle relative line numbers:
nmap <Leader>RN :set relativenumber!<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>L :set list!<CR>

"-----------------------------------------------------------------------------------------------------
" Plugins:
"-----------------------------------------------------------------------------------------------------
" Color Pickers:
" Show RGB colors:
nmap <leader>rgb :ColorRGB<CR>
" Show HEX colors:
nmap <leader>hex :ColorHEX<CR>
"-----------------------------------------------------------------------------------------------------
" NetRW:
let g:netrw_liststyle=3
"-----------------------------------------------------------------------------------------------------
" NERDTree:
let NERDTreeHijackNetrw=1 " Use NERDTree as split explorer 
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', '\.DS_*']
let NERDTreeShowHidden = 1
set guioptions-=L

" find current buffer in NERDTree:
map <Leader>nf :NERDTreeFind<CR>
" find current Working Directory in NERDTree:
map <Leader>ncwd :NERDTreeCWD<CR>
" open NERDTree:
map <Leader>n :NERDTree<CR>
" toggle NERDTree:
map <Leader>nt :NERDTreeToggle<CR>
"-----------------------------------------------------------------------------------------------------
" CssColor:
let g:cssColorVimDoNotMessMyUpdatetime = 1
"-----------------------------------------------------------------------------------------------------
" JSBeautify:
let g:JSLintHighlightErrorLine = 1							" Turn on JSLint error highlighting
let g:Jsbeautify_jslint_whitespace = 1						" JSbreautyfy JSlint
let g:Jsbeautify_jslint_expandtab = 1                       " expand tabs to spaces
"-----------------------------------------------------------------------------------------------------
" Jsx:  
" allow jsx in .js files
let g:jsx_ext_required = 0
"-----------------------------------------------------------------------------------------------------
" Json:  
" prettyfy json:
map <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>
"-----------------------------------------------------------------------------------------------------
" Livedown:
nmap gm :LivedownToggle<CR>
"Autorun markdown preview
let g:livedown_autorun = 1
" should the browser window pop-up upon previewing
let g:livedown_open = 1 
" the port on which Livedown server will run
let g:livedown_port = 1337
"-----------------------------------------------------------------------------------------------------
" Local Vimrc:
let g:local_vimrc = {'names':['.vimrc'],'hash_fun':'LVRHashOfFile'}
"-----------------------------------------------------------------------------------------------------
" PHPcomplete:
" Enables use of tags when the plugin tries to find variables. 
" When enabled the plugin will search for the variables in the tag files with kind 'v', 
" lines like $some_var = new Foo; but these usually yield highly inaccurate results and can be fairly slow.
let g:phpcomplete_search_tags_for_variables = 1

" When enabled the preview window's content will include information extracted from 
" docblock comments of the completions. Enabling this option will add return types to the 
" completion menu for functions too.
let g:phpcomplete_parse_docblock_comments = 1

"When enabled the taglist() lookups will be cached and subsequent searches for the same pattern will 
"not check the tagfiles any more, thus making the lookups faster. Cache expiration is based on 
"the mtimes of the tag files.
let g:phpcomplete_cache_taglists = 1
"-----------------------------------------------------------------------------------------------------
" PHP Pdv:
let g:pdv_template_dir = $HOME ."/.vim/tools/pdv_templates"
nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>
"-----------------------------------------------------------------------------------------------------
" PHPCSFixer:
let g:php_cs_fixer_path = "~/.composer/vendor/bin/php-cs-fixer"	" define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "psr2"							" which level ?
let g:php_cs_fixer_config = "default"						" configuration
let g:php_cs_fixer_php_path = "/usr/local/bin/php"			" Path to PHP
let g:php_cs_fixer_fixers_list = ""							" List of fixers
let g:php_cs_fixer_enable_default_mapping = 1				" Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0								" Call command with dry-run option
let g:php_cs_fixer_verbose = 1

" call PHPCSFixer on current directory:
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
" call PHPCSFixer on current buffer:
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
"-----------------------------------------------------------------------------------------------------
" PHPFolding:
map <F5> <Esc>:EnableFastPHPFolds<Cr>
map <F6> <Esc>:EnablePHPFolds<Cr>
map <F7> <Esc>:DisablePHPFolds<Cr>
" disable auto folding
let g:DisableAutoPHPFolding = 1
"-----------------------------------------------------------------------------------------------------
" PHP Namespace:
"Expands the class name under the cursor to its fully qualified name in insert mode:
inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
"Expands the class name under the cursor to its fully qualified name in normale:
noremap <Leader>e :call PhpExpandClass()<CR>

"Automatically adds the corresponding use statement for the class under the cursor in insert mode:
inoremap <Leader>un <C-O>:call PhpInsertUse()<CR>
"Automatically adds the corresponding use statement for the class under the cursor in normal mode:
noremap <Leader>un :call PhpInsertUse()<CR>
"-----------------------------------------------------------------------------------------------------
" PHPUnit:
" function to run Unittest against current buffer
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

" runs PHPUnit test:
nnoremap <leader>pu :call RunPHPUnitTest()<cr>
"-----------------------------------------------------------------------------------------------------
" PHP Vim:
function! PhpSyntaxOverride()
  "hi! def link phpDocTags  phpDefine
  "hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
"-----------------------------------------------------------------------------------------------------
" Rainbow Parantheses:
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
if has('autocmd') && exists('RainbowParenthesesToggle')
	au VimEnter * RainbowParenthesesToggle
	au Syntax * RainbowParenthesesLoadRound
	au Syntax * RainbowParenthesesLoadSquare
	au Syntax * RainbowParenthesesLoadBraces
endif
"-----------------------------------------------------------------------------------------------------
" RBTags:
let g:rebtags_root_markers = ['.git', '.project', '.idea']
let g:rebtags_ctags_config_file = '.ctags'
"-----------------------------------------------------------------------------------------------------
" SpellBad:
if has("gui_running")
	highlight SpellBad term=underline gui=undercurl guisp=Orange
endif
"-----------------------------------------------------------------------------------------------------
" Syntastic: 
"settings:
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_auto_jump=0
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1
let g:syntastic_loc_list_height=4
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
"let s:javascript_executable = "/usr/local/share/npm/bin/jshint"
let s:javascript_executable = "/usr/local/bin/jsxhint"
let g:syntastic_php_exec = "/usr/local/bin/php"
let g:syntastic_ruby_exec = "/usr/local/bin/ruby"
let g:syntastic_json_exec = "/usr/local/share/npm/bin/jsonlint"
let g:syntastic_python_exec = "/usr/local/bin/python3.4"
"checkers:
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_python_checkers=['/usr/local/bin/python3.4']
" Ignore Angular ng-* attributes error
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_php_phpmd_post_args = "text unusedcode"

"force PSR-2 standard 
let g:syntastic_php_phpcs_args = "--report=csv --standard=PSR2"
" Read the clang complete file
"let g:syntastic_objc_config_file = '.clang_complete'
" Tell it to use clang instead of gcc
"let g:syntastic_objc_checker = 'clang'

let g:syntastic_enable_balloons=0 

" stausline formatting
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
nnoremap <silent> ` :Errors<CR>
" run Syntasitc syntax check manualy:
map <Leader>SC :SyntasticCheck<CR>
"-----------------------------------------------------------------------------------------------------
" Tagbar:
" toggle TagBar:
nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin='ctags'
let g:tagbar_phpctags_bin='phpctags'
let g:tagbar_phpctags_memory_limit = '512M'

let g:tagbar_type_javascript = {
\ 'ctagsbin' : 'jsctags'
\ }
"-----------------------------------------------------------------------------------------------------
" Ultisnips:
let g:UltiSnipsEnableSnipMate= 0
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsEnableSnipmate=0
let g:UltiSnipsSnippetsDir = $HOME.'/.vim/snippets/Ultisnips'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/snippets/UltiSnips']

" Don't use TAB if YCM is installed
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Edit snippts file for current filetype:
noremap <leader>use :UltiSnipsEdit<CR>
"-----------------------------------------------------------------------------------------------------
" Vim Go: 
let g:go_auto_type_info = 1
let g:go_fmt_fail_silently = 1
let g:go_highlight_structs = 1
"-----------------------------------------------------------------------------------------------------
" Webdev Icons:
let g:webdevicons_enable_airline_tabline = 0
let g:webdevicons_enable_airline_statusline = 0

"-----------------------------------------------------------------------------------------------------
" YCM:
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_auto_trigger = 0

let g:ycm_key_list_previous_completion=['<Up>']

"-----------------------------------------------------------------------------------------------------
" XDEBUG:
"-----------------------------------------------------------------------------------------------------
let g:dbgWaitTime = 30

"-----------------------------------------------------------------------------------------------------
" Post Setup:
"-----------------------------------------------------------------------------------------------------
" setupt colorscheme and background
let myCs='base16-ocean'
call SetCurrentColorScheme(myCs, 'dark')

"-----------------------------------------------------------------------------------------------------
" Helper Functions:
"-----------------------------------------------------------------------------------------------------
" setupt colorscheme and background
" trailing spaces
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
