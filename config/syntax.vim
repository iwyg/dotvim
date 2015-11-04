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
	au BufNewFile,BufRead *.less       set ft=less
	au BufNewFile,BufRead *.scss       set ft=scss
	au BufNewFile,BufRead *.sass       set ft=sass
	" Typescript And Dart:
	au BufNewFile,BufRead *.ts         set ft=typescript
	au BufRead,BufNewFile *.dart       set ft=dart
	" PHP: 
	"au BufRead,BufNewFile *.{php,phar} set ft=php
	" md, markdown, and mk are markdown and define buffer-local preview
	"-------------------------------------------------------------------------------------
	au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown
	au BufRead,BufNewFile .*{rc} set ft=sh
	"au BufRead,BufNewFile *.{jshintrc,*rc} set ft=rc
	au BufRead,BufNewFile *.{vimrc,gvimrc} set ft=vim

	" Json:
	"-------------------------------------------------------------------------------------
	"au BufNewFile,BufRead *.json set ft=javascript

	"	au BufRead,BufNewFile *.txt call s:setupWrapping()
	" Typoscript:
	"	au BufNewFile,BufRead mozex.textarea.* setlocal filetype=typoscript
	"	au BufNewFile,BufRead *.ts setlocal filetype=typoscript 	
	" Templateing:
	"au BufRead,BufNewFile *.twig       set filetype=htmljinja
	"au BufRead,BufNewFile *.twig       set filetype=twig
	au BufRead,BufNewFile *.handlebars set ft=html
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
