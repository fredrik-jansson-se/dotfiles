

syntax on

" Vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
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
