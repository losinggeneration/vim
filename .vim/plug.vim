call plug#begin()
" my settings and extensions
Plug '~/.vim/local'

" coding improvments
Plug 'scrooloose/syntastic'
Plug 'Shougo/echodoc.vim', { 'do': 'make' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" deoplete code completion language support
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }
Plug 'zchee/deoplete-zsh'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }
Plug 'wokalski/autocomplete-flow', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }
Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp', 'objc', 'objcpp'] }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'pbogut/deoplete-elm', { 'do': 'npm install -g elm-oracle', 'for': 'elm' }

" editing improvements
Plug 'christoomey/vim-sort-motion'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-misc'
Plug 'AndrewRadev/sideways.vim'

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
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }

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
