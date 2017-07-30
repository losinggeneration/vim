" quick and dirty sourcing based on this file's path
function Src_type(type, filename)
	au FileType type exec 'source ' . expand('<sfile>:p:h') . filename
endfunction

call Src_type('elm', '/languages/elm.vim')
call Src_type('go', '/languages/go.vim')
call Src_type('haxe', '/languages/vaxe.vim')
call Src_type('javascript', '/languages/jsx.vim')
call Src_type('javascript.jsx', '/languages/jsx.vim')
call Src_type('php', '/languages/php.vim')
call Src_type('php', '/languages/phpcomplete.vim')
call Src_type('ruby', '/languages/ruby.vim')
call Src_type('scala', '/languages/scala.vim')
call Src_type('moon', '/languages/moon.vim')

" cleanup as it's not needed
:delfunction Src_type
