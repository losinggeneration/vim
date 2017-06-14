call plug#begin()
" my settings and extensions
Plug '~/.vim/local'

" coding improvments
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --gocode-completer --tern-completer --racer-completer --clang-completer' }
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" editing improvements
Plug 'christoomey/vim-sort-motion'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-misc'
Plug 'AndrewRadev/sideways.vim'
Plug 'ervandew/supertab'

" UI additions
Plug 'szw/vim-ctrlspace'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'severin-lemaignan/vim-minimap'

" git shit
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

" color schemes
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'veloce/vim-aldmeris'

" every day languages
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'luishdez/vim-less', { 'for': 'less' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" used but not common anymore
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
Plug 'vim-php/tagbar-phpctags.vim', { 'for': 'php' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

" less used languages
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixer' }
Plug 'jdonaldson/vaxe', { 'for': 'haxe' }
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }
Plug 'leafo/moonscript-vim', { 'for': 'moon' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'jansenm/vim-cmake', { 'for': 'cmake' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
call plug#end()
