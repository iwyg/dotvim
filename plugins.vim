""" Vim Plug: {{{
call plug#begin('~/.vim/plugged')
""" Vim Ariline: {{{
Plug 'bling/vim-airline'
"""}}}
""" ColorV: {{{
Plug 'vim-scripts/colorv.vim'
"""}}}
""" Goyo: {{{
Plug 'junegunn/goyo.vim'
"""}}}
""" Limelight: {{{
Plug 'junegunn/limelight.vim'
"""}}}
""" Vim Autocorrect: {{{
Plug 'panozzaj/vim-autocorrect'
"""}}}
""" Vim Multiple Cursors: {{{
Plug 'terryma/vim-multiple-cursors'
"""}}}
""" Vim Test: {{{
Plug 'janko-m/vim-test'
"""}}}
""" Vim Quickrun: {{{
Plug 'thinca/vim-quickrun'
"""}}}
""" Vim SourceExplorer: {{{
Plug 'wesleyche/SrcExpl'
"""}}}
""" Vim RainbowParentheses: {{{
Plug 'vim-scripts/rainbow_parentheses.vim'
"""}}}
""" Vim Tagbar: {{{
Plug 'majutsushi/tagbar'
"""}}}
""" Vim Tlib: {{{
Plug 'tomtom/tlib_vim'
"""}}}
""" Vim Tabular: {{{
Plug 'godlygeek/tabular'
"""}}}
""" Vim Gundo: {{{
Plug 'sjl/gundo.vim'
"""}}}
""" Vim Gundo: {{{
Plug 'sjl/gundo.vim'
"""}}}
""" VimRoom: {{{
"Plug 'mikewest/vimroom'
"""}}}
""" VimFiler: {{{
Plug 'Shougo/vimfiler.vim'
"""}}}
""" VimShell: {{{
Plug 'Shougo/vimshell.vim'
"""}}}
""" Vimux: {{{
Plug 'benmills/vimux'
"""}}}
""" Vdebug: {{{
Plug 'joonty/vdebug'
"""}}}
""" Vim Ack: {{{
Plug 'mileszs/ack.vim'
"""}}}
""" Vim Follow My Lead: {{{
Plug 'ktonga/vim-follow-my-lead'
"""}}}
""" NeoMRU: {{{
Plug 'Shougo/neomru.vim'
"""}}}
""" Emmet: {{{
Plug 'mattn/emmet-vim'
"""}}}
""" NerdCommenter: {{{
Plug 'scrooloose/nerdcommenter'
"""}}}
""" Vim Fugitive: {{{
Plug 'tpope/vim-fugitive'
"""}}}
""" Vim Surround: {{{
Plug 'tpope/vim-surround'
"""}}}
""" Vim Vinegar: {{{
Plug 'tpope/vim-vinegar'
"""}}}
""" Vim Dispatch: {{{
Plug 'tpope/vim-dispatch'
"""}}}
""" Vim Ultisnips: {{{
Plug 'SirVer/ultisnips'
"""}}}
""" Vim Base16: {{{
Plug 'chriskempson/base16-vim'
"""}}}
""" Vim EasyTags: {{{
Plug 'xolox/vim-easytags' | Plug 'xolox/vim-misc'
"""}}}
""" Unite: {{{
Plug 'Shougo/unite.vim'
"""}}}
""" Proc: {{{
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
"""}}}
""" Local Vimrc: {{{
Plug 'MarcWeber/vim-addon-local-vimrc'
"""}}}
""" Matchit: {{{
Plug 'vim-scripts/matchit.zip'
"""}}}
""" SudoVim: {{{
Plug 'vim-scripts/sudo.vim'
"""}}}
""" SudoEdit: {{{
Plug 'chrisbra/SudoEdit.vim'
"""}}}
""" Syntastic: {{{
Plug 'scrooloose/syntastic'
"""}}}
""" SyntaxComplete: {{{
Plug 'vim-scripts/SyntaxComplete'
"""}}}
""" YouCompleteMe: {{{
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
"""}}}

""" NeoComplete: {{{
Plug 'Shougo/neocomplete.vim'
"""}}}
""" DeoPlete: {{{
Plug 'Shougo/deoplete.nvim'
"""}}}

""" Snippets {{{
Plug 'honza/vim-snippets'
Plug 'iwyg/vim-snippets', { 'dir': $HOME.'/.vim/plugged/mysnippets' }
Plug 'justinj/vim-react-snippets', { 'for': 'javascript' }
"""}}}
""" Languages {{{
""" Dart: {{{
Plug 'bartlomiejdanek/vim-dart'
"""}}}
""" Docker: {{{
Plug 'ekalinin/Dockerfile.vim'
"""}}}
""" Elixir: {{{
Plug 'elixir-lang/vim-elixir'
"""}}}
""" Swift: {{{
Plug 'kballard/vim-swift'
"""}}}
""" Objective C: {{{
Plug 'b4winckler/vim-objc'
"""}}}
""" Objective J: {{{
Plug 'nanki/vim-objj'
"""}}}
""" IOS: {{{
Plug 'eraserhd/vim-ios'
"""}}}
""" Groovy: {{{
Plug 'rdolgushin/groovy.vim'
Plug 'tfnico/vim-gradle'
"""}}}
""" Go: {{{
Plug 'fatih/vim-go'
Plug 'garyburd/go-explorer', { 'for': 'go' }
"""}}}
""" CSS: {{{
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color', { 'for': 'css' }
"""}}}
""" SASS: {{{
Plug 'cakebaker/scss-syntax.vim'
"""}}}
""" LESS: {{{
Plug 'groenewege/vim-less'
"""}}}
""" PList: {{{
Plug 'darfink/vim-plist'
"""}}}
""" Rust: {{{
Plug 'wting/rust.vim'
"""}}}
""" Javascript: {{{
Plug 'othree/yajs.vim' | Plug 'othree/javascript-libraries-syntax.vim' 
Plug 'digitaltoad/vim-jade'
Plug 'mklabs/grunt.vim'
Plug 'aaronj1335/underscore-templates.vim'
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
Plug 'claco/jasmine.vim', { 'for': 'javascript' }
Plug 'marijnh/tern_for_vim', { 'for': 'javascript', 'do': 'npm install -g tern' }
"""}}}
""" JSX: {{{
Plug 'mxw/vim-jsx'
"""}}}
""" JSON: {{{
Plug 'elzr/vim-json'
"""}}}
""" Typescript: {{{
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi', { 'for': 'typescript', 'do': 'npm install -g typescript' }
"""}}}
""" AnsiEscapeVBA: {{{
Plug 'powerman/vim-plugin-AnsiEsc'
if !has('nvim') 
" Plug 'vim-scripts/AnsiEsc.vim', { 'do' : 'vim AnsiEsc.vba.gz -c \':so %\' -c \':q\'' }
else 
" Plug 'vim-scripts/AnsiEsc.vim', { 'do' : 'nvim AnsiEsc.vba.gz -c \':so %\' -c \':q\'' }
endif
"""}}}
""" HTML: {{{
Plug 'othree/html5.vim'
"""}}}
""" XML: {{{
Plug 'othree/xml.vim'
Plug 'sukima/xmledit', { 'for': 'xml' }
"""}}}
""" TOML: {{{
Plug 'cespare/vim-toml'
"""}}}
""" Latex: {{{
Plug 'jcf/vim-latex'
"""}}}
""" Database Access: {{{
Plug 'vim-scripts/dbext.vim'
"""}}}
""" MonogDB: {{{
Plug 'robu3/vimongous'
"""}}}
""" RC: {{{
Plug 'vim-scripts/rcshell.vim'
"""}}}
""" Sql: {{{
Plug 'shmup/vim-sql-syntax'
Plug 'cosminadrianpopescu/vim-sql-workbench', { 'for': 'sql' }
"""}}}
""" Markdown: {{{
Plug 'plasticboy/vim-markdown'
Plug 'shime/vim-livedown', { 'for': 'markdown', 'do': 'npm install -g livedown' }
"""}}}
""" Mustache: {{{
Plug 'tobyS/vmustache'
Plug 'mustache/vim-mustache-handlebars'
"""}}}
""" Vagrant: {{{
Plug 'vim-scripts/vim-vagrant'
"""}}}
""" Puppet: {{{
Plug 'rodjek/vim-puppet'
"""}}}
""" PHP: {{{
"Plug 'mkusher/padawan.vim', { 'for': 'php', 'do': 'composer global require mkusher/padawan --no-interaction' }    " use eclim completion
Plug 'StanAngeloff/php.vim' | Plug 'shawncplus/phpcomplete.vim'
Plug 'dantleech/vim-phpunit', { 'for': 'php' }
Plug 'dantleech/vim-phpnamespace', { 'for': 'php' }
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
Plug 'tobyS/pdv', { 'for': 'php' }
Plug 'vim-php/vim-composer'
Plug 'adoy/vim-php-refactoring-toolbox', { 'for': 'php' }
Plug 'vim-scripts/phpfolding.vim', { 'for': 'php' }
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php', 'do': 'composer global require squizlabs/php_codesniffer techlivezheng/phpctags fabpot/php-cs-fixer --no-interaction' }
Plug 'Janiczek/vim-latte'
Plug 'xsbeats/vim-blade'
Plug 'evidens/vim-twig' 
Plug 'tokutake/twig-indent', { 'for': 'twig' }
"""}}}

call plug#end()
"""}}}
