
""" Disable Vi Compatibility:
"""-----------------------------------------------------------------------------------------------------
set nocompatible
filetype off
""" Vim Plug {{{
if !exists('s:my_plugins_loaded')
	let s:my_plugins_loaded = 1
endif

source $HOME/.vim/plugins.vim
"""}}}

""" Pathogen {{{
"""-----------------------------------------------------------------------------------------------------
"runtime bundle/vim-pathogen/autoload/pathogen.vim
"let g:pathogen_disabled = ['vim-jsx']
"execute pathogen#infect('bundles_loaded/{}')
filetype plugin indent on
syntax on
"""-----------------------------------------------------------------------------------------------------
"""}}}

"""-----------------------------------------------------------------------------------------------------
""" Behaviour And Settings {{{
"""-----------------------------------------------------------------------------------------------------
""" set leaderkey to ,:
let mapleader=","

""" enable mouse interaction:
if has('mouse') && !has('nvim')
    set mouse=a
    set ttymouse=xterm2
endif
""" remove timeout for escape sequence:
set timeoutlen=1000 ttimeoutlen=0
""" set the working shell:
set shell=/bin/zsh

set ruler
set cursorline
set undofile
set undolevels=10000
set history=10000
set nobackup
set directory=.,$TMPDIR

""" enables edit and movement in virtual spaces
set virtualedit=all

""" set omicimpletion
set ofu=syntaxcomplete#Complete

""" Status bar
set laststatus=2
"disable statusline for poweline
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

""" Cool tab completion stuff
set wildmenu
set wildmode=longest:list,full
set whichwrap=b,s,h,l,<,>,[,]

""" encoding:
if has('vim_starting')
	set encoding=utf8
endif
"set fileencoding=utf8

""" format:
set title
set backspace=indent,eol,start
set wrap
set textwidth=80
set linespace=2
set formatoptions=qrn1
set autowrite
set hidden
set autoindent

set cpoptions+=$

set relativenumber
set number

""" hide scrollbars
set guioptions-=l
set guioptions-=r

""" formatting:
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
""" use tabs by default:
set noexpandtab


""" split new windows on the right
set splitbelow
""" set completeopt+=longest,menu ",preview
set completeopt=longest,menuone
set pumheight=15
set complete-=i
""" make <Enter> key behave like <C-y> if the completion menu is visible
""" see http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

""" auto close preview
if has("autocmd")
    autocmd CompleteDone * pclose
endif

""" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:›\ ,eol:¬,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

set scrolljump=4
set scrolloff=3

""" code folding: {{{
set foldenable
"fold based on indent 
set foldmethod=syntax       
"deepest fold is 10 levels 
set foldnestmax=10          
"dont fold by default 
"set nofoldenable            
" default folding level
set foldlevel=2
"""}}}


""" ctags {{{
set tags=./tags,tags
"""}}}

""" searching: {{{ 
set ignorecase
set smartcase
set incsearch
set showmatch "show matching brackets
set hlsearch
set gdefault
set grepprg=ack
"""}}}
"runtime macros/matchit.vim

""" wrap text: {{{
command! -nargs=* Wrap set wrap linebreak nolist
"""}}}
""" Cursor: {{{
""" enables cursor shape in NeoVim
if has('nvim')
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif
""" set cursor shape in terminal (iterm) and Tmux:
""" see http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
elseif &term =~ '^xterm'
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
"""}}}


"""-------------------------------------------------------------------------------------
"""}}}

""" Powerline {{{
"""-------------------------------------------------------------------------------------
"set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
"let g:Powerline_symbols = 'unicode'
"set fillchars+=stl:\ ,stlnc:\
"" troubleshooting Powerline loosing color on saveing buffers
"let g:miniBufExplForceSyntaxEnable = 1
"""-------------------------------------------------------------------------------------
"""}}}

""" Auto Cmd {{{
"""-------------------------------------------------------------------------------------
if has("autocmd")
    " auto source vimrc on save:
    autocmd! BufWritePost $MYVIMRC nested :source $MYVIMRC
    " toggle line highlighting on insert mode
    autocmd InsertEnter,InsertLeave * set cul!
endif
"""}}}

""" Php {{{
"""-------------------------------------------------------------------------------------
let php_sql_query = 1
let php_htmlInStrings = 1
"""-------------------------------------------------------------------------------------
"""}}}

"""-----------------------------------------------------------------------------------------------------
""" Basic Mappings {{{
"""-----------------------------------------------------------------------------------------------------
""" System Clipboard Copy And Paste
set pastetoggle=<F2> "F2 before pasting to preserve indentation
""" Copy paste to/from clipboard
vnoremap <D-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"
map <silent><D-v> :set paste<CR>o<esc>"*]p:set nopaste<cr>"

""" nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
nnoremap <silent> <F5> :call StripTrailingWhitespaces()<CR>

""" disable arrow keys:
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
"""-----------------------------------------------------------------------------------------------------
"""}}}

nnoremap <leader>fe :VimFilerExplorer<CR>

""" Omnicompletion {{{
"inoremap <leader>oc <C-X><C-O>
"imap <leader>oc <C-X><C-O>
"nnoremap <C-Space> <C-X><C-O><CR>
"""}}}

""" Edit Open Vimrc:
nmap <leader>v :e $MYVIMRC<CR>

""" tag jump to next tag:
nnoremap ü <C-]>
""" tag jump to previous tag:
nnoremap Ü <C-O>

""" switch between current and previous buffer
nmap <S-TAB> :b#<CR>
vmap <S-TAB> :b#<CR>

""" next buffer
nmap <C-L> :bn<CR>
vmap <C-L> :bn<CR>
nnoremap <C-L> :bn<CR>
vnoremap <C-L> :bn<CR>

""" previous buffer
nmap <C-h> :bp<CR>
vmap <C-h> :bp<CR>
nnoremap <C-h> :bp<CR>
vnoremap <C-h> :bp<CR>

""" next tab
nmap <leader>tn :tabnext<CR>
vmap <leader>tn :tabnext<CR>

""" previous tab
nmap <leader>tp :tabprevious<CR>
vmap <leader>tp :tabprevious<CR>

""" toggle line numbers:
nmap <Leader>N :set number!<CR>

""" toggle relative line numbers:
nmap <Leader>RN :set relativenumber!<CR>

""" Shortcut to rapidly toggle `set list`
nmap <leader>L :set list!<CR>

""" terminal mode

if has('nvim')
	nmap <leader>term :terminal<CR>
endif

if !exists('s:sources_loaded')
	source $HOME/.vim/config/variables.vim
	source $HOME/.vim/config/functions.vim
	source $HOME/.vim/config/filetypes.vim
	source $HOME/.vim/config/syntax.vim
	source $HOME/.vim/config/plugins.vim
	let s:sources_loaded = 1
endif


"""-----------------------------------------------------------------------------------------------------
""" Post Setup:
call SetCurrentColorScheme(myCs, myBg)
""" Php Syntax Override:
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

"augroup phpSyntaxOverride
"  autocmd!
"  autocmd FileType php call PhpSyntaxOverride()
"augroup END
