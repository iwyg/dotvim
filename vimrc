"-----------------------------------------------------------------------------------------------------
" Disable Vi Compatibility:
"-----------------------------------------------------------------------------------------------------
set nocompatible
filetype off

"-----------------------------------------------------------------------------------------------------
" Pathogen:
"-----------------------------------------------------------------------------------------------------
runtime bundle/vim-pathogen/autoload/pathogen.vim
let g:pathogen_disabled = ['vim-jsx']
execute pathogen#infect('bundles_loaded/{}')
filetype plugin indent on
syntax on

"-----------------------------------------------------------------------------------------------------
" Behaviour And Settings:
"-----------------------------------------------------------------------------------------------------
" set leaderkey to ,:
let mapleader=","

" enable mouse interaction:
if has("mouse")
	set mouse=a
endif
set shell=/bin/zsh
" remove timeout for escape sequence:
set timeoutlen=1000 ttimeoutlen=0

set ruler
set cursorline
set undofile
set undolevels=10000
set history=10000
set nobackup
set directory=.,$TMPDIR

" enables edit and movement in virtual spaces
set virtualedit=all

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
"set fileencoding=utf8

" format:
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

" hide scrollbars
set guioptions-=l
set guioptions-=r

" formatting:
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
" use tabs by default:
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


" ctags
set tags=./tags,tags

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

" set cursor shape in terminal (iterm) and Tmux:
" see http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
elseif &term =~ '^xterm'
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"-------------------------------------------------------------------------------------
" Powerline:
"-------------------------------------------------------------------------------------
"set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
"let g:Powerline_symbols = 'unicode'
"set fillchars+=stl:\ ,stlnc:\
"" troubleshooting Powerline loosing color on saveing buffers
"let g:miniBufExplForceSyntaxEnable = 1


if has("autocmd")
	" auto source vimrc on save:
	autocmd! BufWritePost $MYVIMRC nested :source $MYVIMRC
	" toggle line highlighting on insert mode
	autocmd InsertEnter,InsertLeave * set cul!
endif


"-------------------------------------------------------------------------------------
"PHP: 
let php_sql_query = 1
let php_htmlInStrings = 1

"-----------------------------------------------------------------------------------------------------
" Basic Mappings:
"-----------------------------------------------------------------------------------------------------

"nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
nnoremap <silent> <F5> :call StripTrailingWhitespaces()<CR>

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

source $HOME/.vim/config/variables.vim
source $HOME/.vim/config/functions.vim
source $HOME/.vim/config/filetypes.vim
source $HOME/.vim/config/syntax.vim
source $HOME/.vim/config/plugins.vim

"-----------------------------------------------------------------------------------------------------
" Post Setup:
call SetCurrentColorScheme(myCs, myBg)
