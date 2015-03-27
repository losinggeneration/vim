" Some more white space checks
function ShowSpaces(...)
	let @/="\\v(\\s+$)|( +\\ze\\t)"
	let oldhlsearch=&hlsearch
	if !a:0
		let &hlsearch=!&hlsearch
	else
		let &hlsearch=a:1
	end
	return oldhlsearch
endfunction

function TrimSpaces() range
	let oldhlsearch=ShowSpaces(1)
	execute a:firstline.",".a:lastline."substitute ///gec"
	let &hlsearch=oldhlsearch
endfunction

function! ShowWhitespace()
	" show tabs and whitespace at eol
	let b:showWS = 1
	syntax match STab " \t" containedin=ALL
	syntax match TabS "\t " containedin=ALL
	syntax match LineEndWS "\s\+$" containedin=ALL
	echo "show Whitespace"
endfunction

function! HideWhitespace()
	" hide tabs and whitespace at eol
	let b:showWS = 0
	syntax clear TabS
	syntax clear STab
	syntax clear LineEndWS
	echo "hide Whitespace"
endfunction

function! ToggleShowWhitespace()
	if !exists('b:showWS')
		let b:showWS = 0
	endif
	" toggle variable
	let b:showWS = !b:showWS
	if b:showWS == 1
		call ShowWhitespace()
	else
		call HideWhitespace()
	endif
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
"nnoremap <F12>     :ShowSpaces 1<cr>
nnoremap <S-F12>   m`:TrimSpaces<cr>``
vnoremap <S-F12>   :TrimSpaces<cr>
nnoremap <F12>	:call ToggleShowWhitespace()<CR>

if has("autocmd")
	au VimEnter,BufRead * silent call ShowWhitespace()
endif


