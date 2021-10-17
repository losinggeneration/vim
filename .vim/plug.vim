call plug#begin()
" my settings and extensions
Plug '~/.vim/local'

Plug 'ciaranm/securemodelines'

" coding improvments
"Plug 'scrooloose/syntastic'
Plug 'dense-analysis/ale'
Plug 'Shougo/echodoc.vim', { 'do': 'make' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Chiel92/vim-autoformat'

if !exists("g:use_deoplete")
	let g:use_deoplete = 0
endif

if has("nvim") || v:version >= 800
	if g:use_deoplete
		Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

		" deoplete code completion language support
		Plug 'zchee/deoplete-zsh'
		Plug 'Shougo/neco-vim', { 'for': 'vim' }
		Plug 'zchee/deoplete-jedi', { 'for': 'python' }

		Plug 'carlitux/deoplete-ternjs', { 'do': 'yarn global add tern', 'for': ['javascript', 'javascript.jsx'] }
		Plug 'wokalski/autocomplete-flow', { 'for': ['javascript', 'javascript.jsx'] }

		"Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }
		Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }

		Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

		Plug 'pbogut/deoplete-elm', { 'do': 'yarn global add elm-oracle', 'for': 'elm' }
		Plug 'reasonml-editor/vim-reason-plus', { 'for': 'reason' }
		Plug 'rescript-lang/vim-rescript', { 'for': 'rescript' }

		Plug 'kristijanhusak/deoplete-phpactor', { 'for': 'php' }

		Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
		Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs', 'for': 'php' }
	else
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
	endif
elseif v:version >= 704 && has('patch1578')
	Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --go-completer --rust-completer --java-completer --ts-completer' }
endif

if !has("nvim") && v:version >= 800
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif


" editing improvements
Plug 'christoomey/vim-sort-motion'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-misc'
Plug 'AndrewRadev/sideways.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'Yggdroot/indentLine'

" UI additions
Plug 'szw/vim-ctrlspace'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'severin-lemaignan/vim-minimap'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Shougo/denite.nvim'

" utilities
" TODO add pomodoro timer
Plug 'robertbasic/vim-hugo-helper'

" git shit
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

" color schemes
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'veloce/vim-aldmeris'

" common languages
"Plug 'fatih/vim-go', { 'tag': 'v0.19', 'do': ':GoInstallBinaries', 'for': 'go' }
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
Plug 'ziglang/zig.vim', { 'for': 'zig' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'luishdez/vim-less', { 'for': 'less' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'maralla/vim-toml-enhance', { 'for': 'toml' }
Plug 'mattn/vim-sqlfmt', { 'for': ['sql', 'mysql'], 'do': 'go get -u github.com/jackc/sqlfmt/cmd/sqlfmt' }

" Typescript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }

" Vue
Plug 'leafOfTree/vim-vue-plugin', { 'for': 'vue' }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'python-mode/python-mode', { 'branch': 'develop', 'for': 'python' }

" Mostly personal project languages
Plug 'jdonaldson/vaxe', { 'for': 'haxe' }
Plug 'leafo/moonscript-vim', { 'for': 'moon' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
Plug 'jansenm/vim-cmake', { 'for': 'cmake' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixer' }

" Reason
Plug 'reasonml-editor/vim-reason-plus', { 'for': 'reason' }
Plug 'jordwalke/vim-reasonml', { 'for': 'reason' }

" Random just in case languages
" PHP
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'vim-php/tagbar-phpctags.vim', { 'for': 'php' }
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}

" Ruby
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

Plug 'fatih/vim-nginx', { 'for': 'nginx' }
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'peterhoeg/vim-qml', { 'for': 'qml' }
Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }

call plug#end()
