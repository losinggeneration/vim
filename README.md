# VIM configuration

My personal VIM settings. A lot (but not all) assumes NeoVIM. Really, it's
basically just code completion that will break without. Some plugins also
require a fairly new version of VIM. I believe the default OS X Sierra
bundled VIM isn't isn't new enough (as an example.)

# Requirements

* NeoVIM v0.2.0+ is mostly what I've tested with.
* Git

# Install

```shell
git clone https://github.com/losinggeneration/vim.git ~/.vim.git
ln -s ~/.vim.git/.vim ~/
ln -s ~/.vim.git/.vimrc ~/
ln -s ~/.vim.git/.gvimrc ~/
```

# Features

* Per-language configuration & loading via `local`
  [plugin](.vim/local/plugin/languages.vim)
* Helpers to [select, copy, & delete](.vim/local/plugin/helpers.vim) C-style
  code blocks & functions.
* Helper to [trim whitespace](.vim/local/plugin/spaces.vim) line problems.
* Helper to change [current working directory](.vim/local/plugin/dir.vim).
* Makes the cmdline height [taller](.vim/local/plugin/echodoc.vim) to allow
  function declarations to correctly show up there.
* Window movement [helpers](.vim/local/plugin/window.vim).
* Run macros against a [visual block](.vim/local/plugin/visual-at.vim).
* [Work around](.vim/local/plugin/nvim.vim) for some weird behavior in nvim
  front-ends.
