" this has to be set outside of the function
let s:languages_path=expand('<sfile>:p:h')

" quick and dirty sourcing based on this file's path
function Src_type(type, filename)
	exec printf('au FileType %s exec "source %s%s"', a:type, s:languages_path, a:filename)
endfunction

augroup lazy_languages
call Src_type('css', '/languages/css.vim')
call Src_type('less', '/languages/css.vim')
call Src_type('sass', '/languages/css.vim')
call Src_type('scss', '/languages/css.vim')

call Src_type('elm', '/languages/elm.vim')
call Src_type('go', '/languages/go.vim')
call Src_type('haxe', '/languages/vaxe.vim')
call Src_type('javascript', '/languages/jsx.vim')
call Src_type('javascript.jsx', '/languages/jsx.vim')
call Src_type('moon', '/languages/moon.vim')
call Src_type('php', '/languages/php.vim')
call Src_type('php', '/languages/phpcomplete.vim')
call Src_type('python', '/languages/python.vim')
call Src_type('ruby', '/languages/ruby.vim')
call Src_type('scala', '/languages/scala.vim')
augroup END

" cleanup as it's not needed
:delfunction Src_type
