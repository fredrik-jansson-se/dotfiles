augroup java
  autocmd!
  autocmd FileType java set tabstop=4|set shiftwidth=4
augroup end

augroup html
  autocmd!
  autocmd FileType html set tabstop=4|set shiftwidth=4
augroup end

augroup sh
  autocmd!
  autocmd FileType sh set tabstop=4|set shiftwidth=4
augroup end

augroup yaml
  autocmd!
  autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 sts=2 expandtab
augroup end

augroup adoc
  autocmd!
  autocmd BufNewFile,BufRead *adoc set tw=80
augroup end

augroup javascript
  autocmd!
  autocmd FileType javascript set tabstop=4|set shiftwidth=4
augroup end

augroup json
  autocmd!
  autocmd FileType json set tabstop=4|set shiftwidth=4
augroup end

" augroup Erlang
"   autocmd!
"   autocmd FileType erlang set tabstop=4|set shiftwidth=4
" augroup end

augroup ncs.conf
  autocmd!
  au BufRead,BufNewFile ncs.conf setfiletype xml
augroup end

augroup xml
  autocmd!
  autocmd FileType xml set tabstop=2|set shiftwidth=2
  autocmd FileType xml let g:xml_syntax_folding=1
  autocmd FileType xml setlocal foldmethod=syntax
  autocmd FileType xml :syntax on
  autocmd FileType xml :%foldopen!
augroup end

augroup vim
  autocmd!
  autocmd FileType vim set tabstop=2|set shiftwidth=2
augroup end

augroup go
  autocmd!
  autocmd FileType go set tabstop=2|set shiftwidth=2|set noexpandtab
  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>b <Plug>(go-build)
augroup end

augroup toml
  autocmd!
  autocmd BufRead,BufNewFile *.toml setlocal commentstring=#\ %s
augroup end

augroup haskell
  " https://monicalent.com/blog/2017/11/19/haskell-in-vim/
  autocmd!
  nnoremap <Leader>ht :GhcModType<cr>
  nnoremap <Leader>htc :GhcModTypeClear<cr>
  autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>
  autocmd FileType haskell set shiftwidth=2|set tabstop=2|set smarttab|set smartindent|set autoindent
augroup end

augroup YANG
  autocmd!
  autocmd FileType yang set expandtab
augroup end

augroup Rust
  autocmd!
  autocmd BufReadPost *.rs setlocal filetype=rust
augroup end

augroup Asm
  autocmd!
  autocmd FileType asm set shiftwidth=2|set tabstop=2|set smarttab|set smartindent|set autoindent
  autocmd BufRead,BufNewFile *.asm setlocal commentstring=;\ %s
augroup end

augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap|set shiftwidth=2|set tabstop=2|set smarttab|set smartindent|set autoindent
augroup end
