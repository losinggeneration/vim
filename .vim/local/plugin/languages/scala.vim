if empty(&filetype)
	finish
endif

" Sort scala imports into 3 main groups, Core, 3rd party, & 1st party
let g:scala_sort_across_groups=1
