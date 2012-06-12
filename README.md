# Instructions:

## Clone repository

- `git clone git://github.com/iwyg/dotvim ~/.vim --recursive`
- `git submodule update --init`

## after installation

- create symbolic link to vimrc `ln -s ~/.vimrc ~/.vim/vimrc`
- create symbolic link to gvimrc `ln -s ~/.gvimrc ~/.vim/gvimrc`
- create symbolic link to jshintrc `ln -s ~/.jshintrc ~/.vim/jshintrc`

## dependencies

- vim or graphical vim with PERL Support
- NodeJS with NPM 
- jshint: `npm install jshin -g`
- jsctags: `npm install jsctags -g` 
- exuberant ctags: `brew install ctags`
- lessc: `brew install lesscss`
- PHP_Codesniffer: see http://pear.php.net/package/PHP_CodeSniffer/  
