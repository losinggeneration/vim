local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.g.completion = 'cmp' -- one of ['deoplete', 'cmp'] or unset

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
    after = {'gruvbox-material'},
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
    'ciaranm/securemodelines',
    {'Shougo/echodoc.vim', run = 'make'},
    'vim-autoformat/vim-autoformat',
    'is0n/fm-nvim',
  }

  -- snippets used by the snippet plugins
  use {
    'Shougo/neosnippet-snippets',
    'honza/vim-snippets',
  }

  -- completion
  if vim.g.completion == 'deoplete' then
    use {
      'Shougo/deoplete.nvim',
      tag = '6.1',
      run = ':UpdateRemotePlugins',
      requires = {
        'Shougo/neosnippet',
        -- deoplete code completion language support
        {'neovim/nvim-lspconfig', config = function() require("cfg.lspconfig") end},
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
      },
    }

    use {'fatih/vim-go', run = ':GoInstallBinaries', ft = 'go'}
  elseif vim.g.completion == 'cmp' then
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-nvim-lsp', -- LSP integration
        'hrsh7th/cmp-buffer', -- open buffer suggestions
        'hrsh7th/cmp-path', -- filesystem paths
        'hrsh7th/cmp-cmdline', -- command line suggestions
        'hrsh7th/cmp-omni', -- Vim's omnifunc
        {'neovim/nvim-lspconfig', config = function() require("cfg.lspconfig") end}, -- nvim's LSP server specific configuration

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
        {'dcampos/nvim-snippy', config = function() require("cfg.snippy") end},

        -- neosnippet
        --'notomo/cmp-neosnippet',
        --'Shougo/neosnippet-snippets',

        {'hrsh7th/cmp-nvim-lua', ft = {'lua', 'vim'}}, -- Nvim API completions
        --'f3fora/cmp-spell', -- spelling suggestions
        {'windwp/nvim-autopairs', config = function() require("cfg.autopairs") end},
        {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require("cfg.treesitter") end},
        {'reasonml-editor/vim-reason-plus', ft = 'reason'},
        {'ray-x/go.nvim', ft = 'go', config = function() require("cfg.languages.go") end},
      },
	  config = function() require("cfg.cmp") end,
    }

    use {
      'ray-x/navigator.lua',  -- LSP code navigation
      requires = {
        'ray-x/guihua.lua', -- GUI utils, not completions
        run = 'cd lua/fzy && make',
      },
      config = function() require("cfg.navigator") end,
    }

    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      }
    }

    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    }

    use {
      'jose-elias-alvarez/null-ls.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
	  config = function()
        require 'cfg.null-ls'
      end,
    }
  end

  -- editing improvements
  use {
    'christoomey/vim-sort-motion',
    'terryma/vim-expand-region',
    'tpope/vim-abolish',
    'tpope/vim-repeat',
    'tpope/vim-sensible',
    {
      'tpope/vim-sleuth',
      -- This can cause some issues with file types not respecting the
      -- desired global indentation. This also is what causes the
      -- initial text when nvim is open to go away without input.
      -- Because this also messes with the filetype, it can also
      -- cause color scheme colors to not load correctly.
      disable = true,
    },
    'tpope/vim-surround',
    'xolox/vim-misc',
    'AndrewRadev/sideways.vim',
    --'ackyshake/VimCompletesMe',
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
    'severin-lemaignan/vim-minimap',
    use {
      'ibhagwan/fzf-lua',
      -- optional for icon support
      requires = {
        'kyazdani42/nvim-web-devicons',
        { 'junegunn/fzf', run = './install --bin', },
      }
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    disable = false,
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require("cfg.lualine") end,
  }
  use {
    'windwp/windline.nvim',
    disable = true,
    requires = {
      'nvim-lua/plenary.nvim',
      { 'kyazdani42/nvim-web-devicons', opt = true },
    },
    config = function() require("cfg.windline") end,
  }

  -- utilities
  use 'robertbasic/vim-hugo-helper'

  use {
    'wthollingsworth/pomodoro.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('pomodoro').setup {
         time_work = 25,
         time_break_short = 5,
         time_break_long = 20,
         timers_to_long_break = 4,
      }
    end
  }

  -- git shit
  use {
    {
      'lewis6991/gitsigns.nvim',
      config = function() require("cfg.gitsigns") end,
    },
    'tpope/vim-fugitive',
    'tpope/vim-git',
  }

  -- common languages
  use {
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
  use {'google/vim-jsonnet',
    config = function()
	  vim.go.jsonnet_fmt_on_save = 0
    end,
    ft = 'jsonnet',
  }

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

