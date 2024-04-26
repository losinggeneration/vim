# Neovim configuration

My personal Neovim settings using LazyVim to cut down on the amount of
configuration I have to manually write/maintain. 

# Requirements

* Neovim v0.9.0+ is mostly what I've tested with.
* Git

# Install

```shell
git clone https://github.com/losinggeneration/vim.git ~/.vim.git
ln -s ~/.vim.git/.vim ~/
```

## Neovim initial setup

This is only really needed on a fresh install with Neovim not setup yet.

```shell
mkdir -p ~/.config
ln -s ~/.vim/.in ~/.config/nvim
# install neovim for python 2 & 3
pip install neovim
pip3 install neovim
```

Running nvim for the first time should go through and download all plugins.

# Features

* Additional plugins & additional configuration. Such as peek_definition to
  treesitter-textobjects to have a preview popup of the code definition.
  * Lots of quality of life plugins, such as oil.neovim
* Switched color scheme to gruvbox
* Option to quickly disable all (as of this writing) LazyVim plugins. This can
  be useful for troubleshooting an issue with plugins. For instance, a short
  time ago, vim-illuminate was having serious issues with medium sized and
  larger files. Using this, I was more easily able to narrow that down.
* go.nvim configuration for my usage.
