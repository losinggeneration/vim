let g:deoplete#enable_at_startup = 1

" go options
let g:deoplete#sources#go#gocode_binary = $HOME . '/Programs/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = $HOME . '/.deoplete/cache/go'
let g:deoplete#sources#go#cgo = 0

" rust options
let g:deoplete#sources#rust#racer_binary = $HOME . '/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/usr/src/rust/src'
