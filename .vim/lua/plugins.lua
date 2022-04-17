local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- my settings and extensions
  use {
    '~/.vim/local',
    as = 'local.nvim',
    after = {'nvim-lspconfig', 'gruvbox'},
  }

  -- color schemes
  use {
    'morhetz/gruvbox',
    'sainnhe/gruvbox-material',
    'tomasr/molokai',
    'veloce/vim-aldmeris',
  }

  -- coding improvments
  use {
    --'scrooloose/syntastic',
    'ciaranm/securemodelines',
    'dense-analysis/ale',
    {'Shougo/echodoc.vim', run = 'make'},
    'Shougo/neosnippet-snippets',
    'honza/vim-snippets',
    'Chiel92/vim-autoformat',
    'is0n/fm-nvim',
  }

  -- completion
  if vim.g.use_deoplete then
    use {
      'Shougo/deoplete.nvim',
      tag = '6.1',
      run = ':UpdateRemotePlugins',
      requires = {
        'Shougo/neosnippet',
        -- deoplete code completion language support
        'neovim/nvim-lspconfig',
        {'zchee/deoplete-zsh', ft = 'zsh'},
        {'Shougo/neco-vim', ft = 'vim'},
        {'zchee/deoplete-jedi', ft = 'python'},

        {'carlitux/deoplete-ternjs', run = 'yarn global add tern', ft = {'javascript', 'javascript.jsx'}},
        {'wokalski/autocomplete-flow', ft = {'javascript', 'javascript.jsx'}},

        {'zchee/deoplete-go', run = 'make', ft = 'go'},
        {'sebastianmarkow/deoplete-rust', ft = 'rust'},

        {'slashmili/alchemist.vim', ft = 'elixir'},

        {'pbogut/deoplete-elm', run = 'yarn global add elm-oracle', ft = 'elm'},
        {'reasonml-editor/vim-reason-plus', ft = 'reason'},

        {'kristijanhusak/deoplete-phpactor', ft = 'php'},

        --{'autozimu/LanguageClient-neovim', branch = 'next', run = 'bash install.sh'},
        --{'roxma/LanguageServer-php-neovim',  run = 'composer install && composer run-script parse-stubs', ft = 'php'},
      }
    }
  elseif vim.g.use_cmp then
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-nvim-lsp', -- LSP integration
        'hrsh7th/cmp-buffer', -- open buffer suggestions
        'hrsh7th/cmp-path', -- filesystem paths
        'hrsh7th/cmp-cmdline', -- command line suggestions
        'hrsh7th/cmp-omni', -- Vim's omnifunc
        'neovim/nvim-lspconfig', -- nvim's LSP configuration

        -- vsnip
        --'hrsh7th/cmp-vsnip',
        --'hrsh7th/vim-vsnip',

        -- luasnip
        --'saadparwaiz1/cmp_luasnip',
        --'L3MON4D3/LuaSnip',

        -- ultasnips
        --'quangnguyen30192/cmp-nvim-ultisnips'
        --'SirVer/ultisnips',

        -- snippy
        'dcampos/cmp-snippy',
        'dcampos/nvim-snippy',

        -- neosnippet
        --'notomo/cmp-neosnippet',
        --'Shougo/neosnippet-snippets',

        {'hrsh7th/cmp-nvim-lua', ft = {'lua', 'vim'}}, -- Nvim API completions
        --'f3fora/cmp-spell', -- spelling suggestions
        {'windwp/nvim-autopairs'},
        {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
        {'reasonml-editor/vim-reason-plus', ft = 'reason'},
        {'ray-x/go.nvim', ft = 'go'},
      },
    }

    use {
      'ray-x/navigator.lua',  -- LSP code navigation
      requires = {
        'ray-x/guihua.lua', -- GUI utils, not completions
        run = 'cd lua/fzy && make',
      },
    }
  end

  -- editing improvements
  use {
    'christoomey/vim-sort-motion',
    'terryma/vim-expand-region',
    'tpope/vim-abolish',
    'tpope/vim-repeat',
    'tpope/vim-sensible',
    'tpope/vim-sleuth',
    'tpope/vim-surround',
    'xolox/vim-misc',
    'AndrewRadev/sideways.vim',
    'ajh17/VimCompletesMe',
    'Yggdroot/indentLine',
    'pedrohdz/vim-yaml-folds',
    'tpope/vim-endwise',
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    ft = {'md', 'markdown'},
  }

  -- UI additions
  use {
    'szw/vim-ctrlspace',
    'majutsushi/tagbar',
    'scrooloose/nerdcommenter',
    'scrooloose/nerdtree',
    --'vim-airline/vim-airline',
    --'vim-airline/vim-airline-themes',
    'severin-lemaignan/vim-minimap',
    {'junegunn/fzf', run = function() fn['fzf#install'](0) end},
    'junegunn/fzf.vim',
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- utilities
  -- TODO add pomodoro timer
  use 'robertbasic/vim-hugo-helper'

  -- git shit
  use {
    'airblade/vim-gitgutter',
    'tpope/vim-fugitive',
    'tpope/vim-git',
  }

  -- common languages
  use {
    --{'fatih/vim-go', tag = 'v1.25', run = ':GoInstallBinaries', ft = 'go' },
    {'fatih/vim-go', run = ':GoInstallBinaries', ft = 'go'},
    --{'zchee/nvim-go', run = 'make PKG=.', ft = 'go'},
    {'ziglang/zig.vim', ft = 'zig'},
    {'luishdez/vim-less', ft = 'less'},
    {'elzr/vim-json', ft = 'json'},
    {'mxw/vim-jsx', ft = {'javascript', 'javascript.jsx'}},
    {'pangloss/vim-javascript', ft = {'javascript', 'javascript.jsx'}},
    {'cespare/vim-toml', ft = 'toml'},
    {'maralla/vim-toml-enhance', ft = 'toml'},
    {'mattn/vim-sqlfmt', ft = {'sql', 'mysql'}, run = 'go get -u github.com/jackc/sqlfmt/cmd/sqlfmt'},
    {'teal-language/vim-teal', ft = 'teal'},
  }

  -- Typescript
  use {
    {'leafgarland/typescript-vim', ft = 'typescript'},
    {'Quramy/tsuquyomi', ft = 'typescript'},
  }

  -- Vue
  use {'leafOfTree/vim-vue-plugin', ft = 'vue'}
  use 'mattn/emmet-vim'

  -- Python
  use {
    {'vim-scripts/indentpython.vim', ft = 'python'},
    {'nvie/vim-flake8', ft = 'python'},
    {'python-mode/python-mode', branch = 'develop', ft = 'python'},
  }

  -- Mostly employment project languages
  use {'hashivim/vim-terraform', ft = 'terraform'}
  use {'cappyzawa/starlark.vim', ft = 'starlark'}

  -- Mostly personal project languages
  use {'jdonaldson/vaxe', ft = 'haxe'}
  use {'leafo/moonscript-vim', ft = 'moon'}
  use {'rust-lang/rust.vim', ft = 'rust'}
  use {'ElmCast/elm-vim', ft = 'elm'}
  use {'jansenm/vim-cmake', ft = 'cmake'}
  use {'elixir-lang/vim-elixir', ft = 'elixir'}

  -- Reason
  --use {'reasonml-editor/vim-reason-plus', ft = 'reason' }
  use {'jordwalke/vim-reasonml', ft = 'reason'}
  use {'rescript-lang/vim-rescript', ft = 'rescript'}

  -- Random just in case languages
  -- PHP
  use {
    {'StanAngeloff/php.vim', ft = 'php'},
    {'vim-php/tagbar-phpctags.vim', ft = 'php'},
    {'phpactor/phpactor' ,  run = 'composer install', ft = 'php'},
  }

  -- Ruby
  use {
    {'tpope/vim-bundler', ft = 'ruby'},
    {'tpope/vim-rails', ft = 'ruby'},
    {'vim-ruby/vim-ruby', ft = 'ruby'},
  }

  use {'fatih/vim-nginx', ft = 'nginx'}
  use {'rhysd/vim-crystal', ft = 'crystal'}
  use {'derekwyatt/vim-scala', ft = 'scala'}
  use {'kchmck/vim-coffee-script', ft = 'coffee'}
  use {'peterhoeg/vim-qml', ft = 'qml'}
  use {'aklt/plantuml-syntax', ft = 'plantuml'}


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

