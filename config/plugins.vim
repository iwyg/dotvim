""" Unite: {{{
""" fuzzy searching
nmap <C-p> :Unite file_rec/async<CR>
nnoremap <C-p> :Unite file_rec/async<CR>
""" content search lile Ack/Ag
nmap <space>/ :Unite grep:.<CR>
nnoremap <space>/ :Unite grep:.<CR>
""" search for open buffers
nmap <leader>b :Unite buffer<CR>
nnoremap <leader>b :Unite buffer<CR>
nmap <C-space> :Unite buffer<CR>
nnoremap <C-space> :Unite buffer<CR>
"""}}}

""" Ack: {{{
""" if silver searcher is installed, use Ag instread of Ack:
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

"""}}}
""" Vim Grepper: {{{
if executable('ag')
	nnoremap <leader>ack :Grepper! -tool ag -open -switch<CR>
else
	nnoremap <leader>ack :Grepper! -tool ack -open -switch<CR>
endif
"""}}}

""" Airline: {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
"""}}}

""" Color Pickers: {{{
""" Show RGB colors:
nmap <leader>rgb :ColorRGB<CR>
""" Show HEX colors:
nmap <leader>hex :ColorHEX<CR>
"""}}}

""" Composer: {{{
let g:composer_cmd = $COMPOSER_BIN
"""}}}
""" GunDo: {{{
nmap <leader>gdt GundoToggle<CR>
nmap <leader>gdo GundoOpen<CR>
nmap <leader>gdc GundoClose<CR>
"""}}}

""" Eclim: {{{
let g:EclimCompletionMethod = 'omnifunc'
""" enable syntastic
let g:EclimPhpSyntasticEnabled = 1
""" disable js/jsx validation
let g:eclim_javascript_jsl_warn = 0
let g:EclimJavascriptLintEnabled = 0 
"""}}}

""" EasyTags: {{{
let g:easytags_async = 1
""" vim tag based tagfiles
let g:easytags_dynamic_files = 1
""" Update tags on buffer write
""" will mess up syntax
"let g:easytags_events = ['BufWritePost']

""" languages: 
if !exists('g:easytags_languages')
    let g:easytags_languages = {}
endif

if !exists('g:easytags_languages.javascript')
    let g:easytags_languages.javascript = {}
endif

let g:easytags_languages.javascript.cmd = 'jsctags'
let g:easytags_languages.javascript.args = []
let g:easytags_languages.javascript.fileoutput_opt = '-f'
let g:easytags_languages.javascript.stdout_opt = '-f-'
let g:easytags_languages.javascript.recurse_flag = '-R'

if !exists('g:easytags_languages.php')
    let g:easytags_languages.php = {}
endif

let g:easytags_languages.php.cmd = 'ctags'
let g:easytags_languages.php.args = ['--fields=+aimS']
let g:easytags_languages.php.fileoutput_opt = '-f'
let g:easytags_languages.php.stdout_opt = '-f-'
let g:easytags_languages.php.recurse_flag = '-R'

if !exists('g:easytags_languages.jsx')
    let g:easytags_languages.jsx = {}
endif

let g:easytags_languages.jsx.cmd = 'jsx'
"""}}}

""" NetRW: {{{
let g:netrw_liststyle=3
"""}}}

""" VimFiler: {{{
nnoremap <leader>fe :VimFilerExplorer<CR>
""" let vimfiler be the default file explorer
let g:vimfiler_as_default_explorer = 1
""" tree icons
let g:vimfiler_tree_leaf_icon = ""
let g:vimfiler_tree_opened_icon = "▼"
let g:vimfiler_tree_closed_icon = "▶︎"
""" auto open vimfiler explorer if no startfiles are present 
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exec ':VimFilerExplorer' | endif
"""}}}

if exists(':NERDTree')
    """ NERDTree: {{{
    let NERDTreeHijackNetrw=1 " Use NERDTree as split explorer 
    let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', '\.DS_*', '*.swp']
    let NERDTreeShowHidden = 1
    let NERDTreeAutoDeleteBuffer = 1
    let NERDTreeChDirMode = 1

    set guioptions-=L

    " open NERDTree automatically when vim starts up if no files were specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

    " close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

    " find current buffer in NERDTree:
    map <Leader>nf :NERDTreeFind<CR>
    " find current Working Directory in NERDTree:
    map <Leader>ncwd :NERDTreeCWD<CR>
    " open NERDTree:
    map <Leader>n :NERDTree<CR>
    " toggle NERDTree:
    map <Leader>nt :NERDTreeToggle<CR>
    """}}}

    """ NERDTree Git Plugin: {{{
    """ icon mapping:

    let g:NERDTreeMapNextHunk = 'c'
    let g:NERDTreeMapPrevHunk = 'c'

    let g:NERDTreeIndicatorMapCustom = {
                \ "Modified"  : "✹",
                \ "Staged"    : "✚",
                \ "Untracked" : "✭",
                \ "Renamed"   : "➜",
                \ "Unmerged"  : "═",
                \ "Deleted"   : "✖",
                \ "Dirty"     : "✗",
                \ "Clean"     : "✔︎",
                \ "Unknown"   : "?"
                \ }
    """}}}
endif

""" CssColor: {{{
let g:cssColorVimDoNotMessMyUpdatetime = 1
"""}}}

""" JSBeautify: {{{
let g:JSLintHighlightErrorLine = 1                          " Turn on JSLint error highlighting
let g:Jsbeautify_jslint_whitespace = 1                      " JSbreautyfy JSlint
let g:Jsbeautify_jslint_expandtab = 1                       " expand tabs to spaces
"""}}}
"""-----------------------------------------------------------------------------------------------------
""" Jsx: {{{
""" allow jsx in .js files
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0

""" disable folding for js/jsx files
function! <SID>SetFoldState()
	exec ':redir => s:fold_state'
	exec ':silent set foldenable?'
	exec ':redir END'
	let s:fold_state=substitute(s:fold_state, '\n', '', '')
endfunction
""" toggle fold states
function! <SID>SetNoFold()
	exec ':call <SID>SetFoldState()'
	set nofoldenable
endfunction
""" reset previous fold state
function! <SID>ResetFoldState(state)
	exec ':set '.a:state
endfunction

if has('autocmd')
	au BufNewFile,BufRead,BufEnter *.jsx :call <SID>SetNoFold()
	au BufLeave,BufDelete *.jsx :call <SID>ResetFoldState(s:fold_state)
endif
"""}}}

"""}}}

""" Javascript: {{{
"let javascript_fold = 0
"let b:javascript_fold = 0
"let g:javascript_fold = 0
let javascript_enable_domhtmlcss = 1
let javascript_ignore_javaScriptdoc = 0
"""}}}

""" JsDoc: {{{
""" allow es6 syntax
let g:jsdoc_enable_es6 = 1
""" promt for interfactive input
let g:jsdoc_allow_input_prompt = 1
"""}}}

""" Json: {{{
""" prettyfy json:
map <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>
"""}}}

""" Livedown: {{{
nmap gm :LivedownToggle<CR>
"Autorun markdown preview
let g:livedown_autorun = 1
""" should the browser window pop-up upon previewing
let g:livedown_open = 1 
""" the port on which Livedown server will run
let g:livedown_port = 1337
"""}}}

""" Limelight: {{{
""" You can invoke :Limelight for a visual range. There are also <Plug> mappings
""" for normal and visual mode for the purpose.
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

nmap <Leader>ll :Limelight<CR>
xmap <Leader>ll :Limelight<CR>

""" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

""" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

""" Default: 0.5
let g:limelight_default_coefficient = 0.7

""" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

""" Beginning/end of paragraph
"""   When there's no empty line between the paragraphs
"""   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

""" Highlighting priority (default: 10)
"""   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
"""}}}

""" Markdown: {{{
let g:vim_markdown_folding_disabled=0
""" extensions
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
"""}}}

""" DeoPlete: {{{
if has('nvim') 
	let g:acp_enableAtStartup = 0
	let g:deoplete#enable_at_startup = 1
	""" Enables at startup
		let g:deoplete#enable_at_startup = 1
	""" Enable smartcase
	let g:deoplete#enable_smart_case = 1
	""" set minimal keyword trigger length
	let g:deoplete#sources#syntax#min_keyword_length = 2

	""" force Enable Heavy Completion
	if !exists('g:deoplete#force_omni_input_patterns')
		let g:deoplete#force_omni_input_patterns = {}
	endif
	let g:deoplete#force_omni_input_patterns.php = '[^. \t]->\h\w*\|\h\w*::|use\s|namespace\s'
	let g:deoplete#force_omni_input_patterns.javascript = '[^. \t]\.\h\w*\|umport\s'
	let g:deoplete#force_omni_input_patterns.c = '[^.[:digit:]*\t]\%(\.\|->\)'
	let g:deoplete#force_omni_input_patterns.cpp = '[^.[:digit:]*\t]\%(\.\|->\)\|\h\w*::'
endif
"""}}}
""" NeoComplete: {{{
if !has('nvim') 
	""" Disable AutoComplPop.
	let g:acp_enableAtStartup = 0
	""" Enables at startup
		let g:neocomplete#enable_at_startup = 1
	""" Enable smartcase
	let g:neocomplete#enable_smart_case = 1
	""" set minimal keyword trigger length
	let g:neocomplete#sources#syntax#min_keyword_length = 2

	""" force Enable Heavy Completion
	if !exists('g:neocomplete#force_omni_input_patterns')
		let g:neocomplete#force_omni_input_patterns = {}
	endif
	let g:neocomplete#force_omni_input_patterns.php = '[^. \t]->\h\w*\|\h\w*::|use\s|namespace\s'
	let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\h\w*\|umport\s'
	let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:]*\t]\%(\.\|->\)'
	let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:]*\t]\%(\.\|->\)\|\h\w*::'
endif
"""}}}

""" GoYo: {{{
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nmap <leader>fuckit :Goyo<CR>
nmap <leader>gt :Goyo<CR>

let g:goyo_width=120
""" }}}

""" Local Vimrc: {{{
let g:local_vimrc = {'names':['.vimrc'],'hash_fun':'LVRHashOfFile'}
""" }}}

""" Padawan: {{{
let g:padawan#composer_command = $COMPOSER_BIN
"""}}}

""" PHPcomplete: {{{
""" Enables use of tags when the plugin tries to find variables. 
""" When enabled the plugin will search for the variables in the tag files with kind 'v', 
""" lines like $some_var = new Foo; but these usually yield highly inaccurate results and can be fairly slow.
let g:phpcomplete_search_tags_for_variables = 0

""" When enabled the preview window's content will include information extracted from 
""" docblock comments of the completions. Enabling this option will add return types to the 
""" completion menu for functions too.
let g:phpcomplete_parse_docblock_comments = 1

""" When enabled the taglist() lookups will be cached and subsequent searches for the same pattern will 
""" not check the tagfiles any more, thus making the lookups faster. Cache expiration is based on 
""" the mtimes of the tag files.
let g:phpcomplete_cache_taglists = 1

""" This option controls the number of characters the user needs to type before the tags will be searched 
""" for namespaces and classes in typed out namespaces in "use ..." context. Setting this to 0 is not 
""" recommended because that means the code have to scan every tag, and vim's taglist() function runs 
""" extremly slow with a "match everything" pattern.
let g:phpcomplete_min_num_of_chars_for_namespace_completion = 2

""" When enabled the <C-]> will be mapped to phpcomplete#JumpToDefinition() which will try to make a more 
""" educated guess of the current symbol's location than simple tag search. If the symbol's location cannot 
""" be found the original <C-]> functionality will be invoked
let g:phpcomplete_enhance_jump_to_definition = 1

let g:phpcomplete_mappings = {
            \ 'jump_to_def': '<C-ü>',
            \ }
"""}}}

"" PHP Pdv: {{{
let g:pdv_template_dir = $HOME ."/.vim/tools/pdv_templates"

if has("autocmd")
    autocmd FileType php nnoremap <leader>doc :call pdv#DocumentWithSnip()<CR>
endif

"""}}}

""" PHPCSFixer: {{{
let g:php_cs_fixer_path = "~/.composer/vendor/bin/php-cs-fixer" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "psr2"                           " which level ?
let g:php_cs_fixer_config = "default"                       " configuration
let g:php_cs_fixer_php_path = "/usr/local/bin/php"          " Path to PHP
let g:php_cs_fixer_fixers_list = ""                         " List of fixers
let g:php_cs_fixer_enable_default_mapping = 1               " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                              " Call command with dry-run option
let g:php_cs_fixer_verbose = 1

""" call PHPCSFixer on current directory:
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
""" call PHPCSFixer on current buffer:
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
"""}}}

""" PHPFolding: {{{
map <F5> <Esc>:EnableFastPHPFolds<Cr>
map <F6> <Esc>:EnablePHPFolds<Cr>
map <F7> <Esc>:DisablePHPFolds<Cr>
""" disable auto folding
let g:DisableAutoPHPFolding = 1
""" }}}

""" PHP Namespace: {{{
"Expands the class name under the cursor to its fully qualified name in insert mode:
inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
"Expands the class name under the cursor to its fully qualified name in normale:
noremap <Leader>e :call PhpExpandClass()<CR>

"Automatically adds the corresponding use statement for the class under the cursor in insert mode:
inoremap <Leader>un <C-O>:call PhpInsertUse()<CR>
"Automatically adds the corresponding use statement for the class under the cursor in normal mode:
noremap <Leader>un :call PhpInsertUse()<CR>
"""}}}

""" PHPNamespace: {{{
nnoremap <silent><leader>nsi :call PhpNamespaceInsert()<CR>
inoremap <silent><leader>nsg :call PhpNamespaceGet()<CR>
"""}}}

""" PHPUnit: {{{
""" function to run Unittest against current buffer
"function! <SID>RunPHPUnitTest()
"   "cd %:p:h
"   pwd
"   let result = system("vendor/bin/phpunit " . bufname("%"))
"   split __PHPUnit_Result__
"   normal! ggdG
"   setlocal buftype=nofile
"   call append(0, split(result, '\v\n'))
"   cd -
"endfunction
"
"""" runs PHPUnit test:
"nnoremap <leader>pu :call <SID>RunPHPUnitTest()<cr>

let g:phpunit_namespace_prefix='Tests'
let g:phpunitpath='vendor/bin/phpunit'

nnoremap <silent><leader>pug :call PhpunitGenerate()<CR>
nnoremap <silent><leader>pur :call PhpunitRun()<CR>

"""}}}

""" Vim Test: {{{
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tv :TestVisit<CR>
"""}}}

""" Rainbow Parantheses: {{{
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
"""}}}

""" AutoCorrect: {{{
if has('autcmd')
	autocmd FileType text call AutoCorrect()
endif
"""}}}

""" SpellBad: {{{
if has('gui_running')
    highlight SpellBad term=underline gui=undercurl guisp=Orange
endif
"""}}}

""" NeoMake: {{{
""" auto check syntax on filewrite
if has('autocmd')
	autocmd! BufWritePost * Neomake
endif

""" open list without moving the cursor; use :ll to jump to current error
let g:neomake_open_list = 2
""" verbose behaviour
let g:neomake_verbose=1
""" error log file
let g:neomake_logfile=$HOME.'/.vim/log/neomake.log'
""" define error symbols in gutter
"let g:neomake_warning_sign = {
"  \ 'text': '✹',
"  \ 'texthl': 'WarningMsg',
"  \ }

let g:neomake_warning_sign = {
  \ 'text': '▶︎',
  \ 'texthl': 'DiffText',
  \ }

let g:neomake_error_sign = {
  \ 'text': '✹',
  \ 'texthl': 'ErrorMsg',
  \ }

""" jump to next error
nnoremap <leader>ne :ll<CR>
""" linters {{{
"let g:neomake_go_gofmt_maker = {
"	\ 'exe': 'gofmt',
"	\ 'args': [],
"	\ 'append_file': ' -1 > ' . neomake#utils#DevNull(),
"	\ 'errorformat': '%f:%l:%c: %m,%-G%.%#',
"	\ }

let g:neomake_javascript_flow_maker = {
		\ 'exe': 'flow',
		\ 'args': ['check', '--one-line', '--old-output-format'],
		\ 'errorformat': '%f:%l:%c\,%n: %m',
		\ 'mapexpr': 'substitute(v:val, "\\\\n", " ", "g")',
		\ }

""" allow new es6 features for js files
let g:neomake_javascript_jscs_maker = {
	\ 'exe': 'jscs',
	\ 'args': ['--no-color', '--preset', 'crockford', '--reporter', 'inline', '--esnext'],
	\ 'errorformat': '%f: line %l\, col %c\, %m',
	\ }

"let g:neomake_javascript_jsx_eslint_maker = {
"		\ 'args': ['-f', 'compact'],
"		\ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
"		\ '%W%f: line %l\, col %c\, Warning - %m'
"		\ }
"

let g:neomake_go_enabled_makers = ['gofmt', 'golint']
let g:neomake_go_enabled_makers = ['go', 'golint']
"let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_php_enabled_makers = ['phpcs', 'php', 'phpmd']
let g:neomake_typescript_enabled_makers = ['tsc', 'tsclint']
let g:neomake_javascript_enabled_makers = ['flow', 'eslint']


"let g:neomake_javascript_jsx_enabled_makers = ['eslint']

"""}}}
"""}}}

""" Syntastic: {{{
""" settings:
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump=0
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1
let g:syntastic_loc_list_height=4
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
""" executables:
let g:syhtastic_javascript_executable = "/usr/local/bin/eslint"
let g:syhtastic_jsx_executable = "/usr/local/bin/eslint"
let g:syntastic_php_exec = "/usr/local/bin/php"
let g:syntastic_ruby_exec = "/usr/local/bin/ruby"
let g:syntastic_json_exec = "/usr/local/share/npm/bin/jsonlint"
let g:syntastic_python_exec = "/usr/local/bin/python3.4"
""" checkers:
let g:syntastic_php_checkers=['phpcs', 'php', 'phpmd']
let g:syntastic_jsx_checkers = ['eslint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_html_checkers = ['tidy', 'jshint']
let g:syntastic_python_checkers=['/usr/local/bin/python3.4']
let g:syntastic_go_checkers=['gofmt', 'go']
let g:syntastic_sass_checkers=['sassc']
let g:syntastic_scss_checkers=['sassc']
""" Ignore Angular ng-* attributes error
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_php_phpmd_post_args = "text unusedcode"

""" PHP force PSR-2 standard 
let g:syntastic_php_phpcs_args = "--report=csv --standard=PSR2"
""" Read the clang complete file
"let g:syntastic_objc_config_file = '.clang_complete'
""" Tell it to use clang instead of gcc
"let g:syntastic_objc_checker = 'clang'
let g:syntastic_enable_balloons=0 

""" stausline formatting
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
nnoremap <silent> ` :Errors<CR>
""" run Syntasitc syntax check manualy:
map <Leader>SC :SyntasticCheck<CR>
"""}}}

""" Tagbar: {{{
""" toggle TagBar:
nmap <Leader>tb :TagbarToggle<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin='ctags'
let g:tagbar_type_php = {
            \ 'ctagstype' : 'php',
            \ 'ctagsbin' : 'ctags',
            \ 'ctagsargs': '-R --fields=+aimS -f -',
            \ 'kinds'     : [
            \ 'd:Constants:0:0',
            \ 'v:Variables:0:0',
            \ 'f:Functions:1',
            \ 'i:Interfaces:0',
            \ 'c:Classes:0',
            \ 'p:Properties:0:0',
            \ 'm:Methods:0:0',
            \ 'n:Namespaces:0',
            \ 't:Traits:0',
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
            \ 'c' : 'class',
            \ 'm' : 'method',
            \ 'f' : 'function',
            \ 'i' : 'interface',
            \ 'n' : 'namespace',
            \ 't' : 'trait',
            \ },
            \ 'scope2kind' : {
            \ 'class'     : 'c',
            \ 'method'    : 'm',
            \ 'function'  : 'f',
            \ 'interface' : 'i',
            \ 'namespace' : 'n',
            \ 'trait'     : 't',
            \ }
            \ }

let g:tagbar_type_typescript = {
            \ 'ctagstype': 'typescript',
            \ 'kinds': [
            \ 'c:classes',
            \ 'n:modules',
            \ 'f:functions',
            \ 'v:variables',
            \ 'v:varlambdas',
            \ 'm:members',
            \ 'i:interfaces',
            \ 'e:enums',
            \ ]
            \ }

let g:tagbar_type_javascript = {
            \ 'ctagsbin' : 'jsctags'
            \ }
"""}}}

""" Ultisnips: {{{
let g:UltiSnipsEnableSnipMate= 0
let g:UltiSnipsUsePythonVersion=2
let g:UltiSnipsEnableSnipmate=0
let g:UltiSnipsSnippetsDir = $HOME.'/.vim/snippets/UltiSnips'
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'snips', 'snippets/UltiSnips']
""" Don't use TAB if YCM is installed
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
""" Edit snippts file for current filetype:
noremap <leader>snp :UltiSnipsEdit<CR>
"""}}}

""" Vim Go: {{{
let g:go_auto_type_info = 1
let g:go_fmt_fail_silently = 1
let g:go_highlight_structs = 1
nnoremap <leader>go :GoRun<CR>
"""}}}

""" Devicons {{{
let g:webdevicons_enable_unite = 0
let g:webdevicons_enable_airline_statusline = 0
let g:webdevicons_enable_airline_tabline = 0
""" enable devicons for NERDTree
if exists(':NERDTree')
    let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
    let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
endif

""" enable devicons for vimfiler
if exists(":VimFiler")
    let g:webdevicons_enable_vimfiler = 1
endif
"""}}}

""" VimShell: {{{
nnoremap <leader>vs :VimShell<CR>
"""}}}

""" Vim Test: {{{

let test#php#phpunit#executable = './vendor/bin/phpunit'
""" if running in neovim, use :terminal to run tests.
if has('nvim')
    let test#strategy = 'neovim'
""" if running in a tmux session, use vimux to handle testruns
elseif exists('$TMUX')
    let test#strategy = 'vimux'
else
""" else use Dispatch
    let test#strategy = 'dispatch'
endif
"""}}}

""" YCM: {{{
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_auto_trigger = 0
"
"""" Helps with language specific completion
let g:ycm_semantic_triggers = {}

if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.php = ['->', '::', '(', 'use ', 'namespace ', '\', 'return ']
let g:ycm_semantic_triggers.javascript = ['.', 'import ', 'let ', '= ', 'var ', 'const ', 'return ']
let g:ycm_semantic_triggers.go = ['.', 'import ', 'var ', ':= ', 'return ']
"""}}}

""" XDEBUG: {{{
let g:dbgWaitTime = 30
"""}}}

""" Xml: {{{
" setting this variable breaks js/jsx syntax and indentation
"let g:xml_syntax_folding = 0
"""}}}
""" GitGutter: {{{
nnoremap <leader>gg :GitGutterToggle<CR>
let g:gitgutter_enabled = 0
let g:gitgutter_readltimr = 0
let g:gitgutter_eager = 0
"""}}}
