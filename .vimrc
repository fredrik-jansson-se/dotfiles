" ./configure --with-features=huge --enable-pythoninterp
" -with-python-config-dir=/usr/lib/python2.7/config/ --prefix=XXX

syntax on

" Vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" :BundleList
" :BundleInstall
set nocompatible 
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'

filetype plugin indent on  " required for vundle

set hlsearch " highlight search results
set is " incsearch, i.e. show partial matches when typing

" Indent 4 spaces
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

