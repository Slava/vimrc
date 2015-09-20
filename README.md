Slava's vim setup
===

This is my setup I've been using for the last 6 month or so. This configuration wasn't meant
to be used on remote hosts where you edit your configs over ssh, because nobody does it.
Likely, this config can be used for day-to-day development if you are brave enough to use
someone's config on your Vim (I am not). However, it can act as a good learning material to someone.

Features
---

- Syntax highlighting for common things in webdev
  * [JavaScript](https://github.com/pangloss/vim-javascript)
  * [Less](https://github.com/groenewege/vim-less)
  * [JSON](https://github.com/elzr/vim-json)
  * [Typescript](https://github.com/leafgarland/typescript-vim)
  * [Coffee](https://github.com/kchmck/vim-coffee-script)
  * [Markdown](https://github.com/tpope/vim-markdown)
- [Unite.vim](https://github.com/Shougo/unite.vim) with awesome fuzzy search features
  * `<C-N>` to open a file in the current directory
  * `<leader><C-N>` to open a file in some subdirectory recursively using an
    external program for speed. (uses `find` by default, install `ag` for
    speed, will be used if available).
  * `<C-P>` to open a buffer
  * `<leader>D` to change the current directory
  * [`:VimShell`](https://github.com/Shougo/vimshell.vim) to open a shell written in vimscript.
    It is not the best shell ever but is good enough to run tests quickly
    + You will probably need to change the default vim command from `mvim` to what you want (`gvim` or `vim`)
  * `<leader>p` to paste a segment from yank history
  * `<leader>j` to open a list of other menu items (editable in vimrc)
- [Gundo.vim](https://github.com/sjl/gundo.vim) to jump between file's edit versions
- [Surround.vim](https://github.com/tpope/vim-surround) - to surround text with
  tags, brackets, parentheses or quotes
- [Fugitive.vim](https://github.com/tpope/vim-fugitive) - git wrapper
- [Tern.js](http://ternjs.net/) plugin with
  [Meteor support](https://github.com/Slava/tern-meteor) - like IntelliSense for JavaScript

Weird visual things you might want to change

- [vim-airline](https://github.com/bling/vim-airline) - status bar
  * needs a customized font for MacVim (XXX add this to install script)
- [Tomorrow Night Theme](https://github.com/Slava/vim-tomorrow-js) -
  specifically, a fork extended for JS
- [vim-signature](https://github.com/kshenoy/vim-signature) - to visually see marks
- new splits are added on the bottom, not on the top;
- new visual splits appear on the right, not on the left.


Weird bindings you might want to change

- `<leader>` is mapped to comma `,`
- `<C-hjkl>` mapped to movement between splits
- `<leader>/` to kill current search
- `<leader>s` to enable/disable the spellchecker
- `<leader>l` to highlight non-printing characters
- `<leader>m` and `<leader>n` to switch between tabs
- `<leader>w` saves the file (maps to `:w<enter>`)
- `<leader>j` to open a list of menu items
- `;` in the normal mode enters the command mode (just like `:`). The original
  action of `;` (repeat the last `t`) is not preserved.
- quick `jk` in insert mode is mapped to `ESC` to avoid pressing `ESC`


What sucks
---

I will be honest, the following things suck and I didn't fix them yet:

- formatting is broken for a lot of things
- plugins are written in JavaScript, Python and VimScript - 3 different
  languages
- everything is `<C-n>` and `<C-p>` centric. Because I mapped them to my thumb
  on Kinesis doesn't mean it is great for everyone

Feature requests
---

- Fixed identation for JS, Handlebars and CSS
- no dependency on fonts
- install script should take into consideration the existing `.vimrc` and `.vim`
  folders not to override someone's setup accidentally

Dependencies
---

Latest MacVim works well as of 7.4 patch around August 2013

- Vim built with `+python` for `ternjs` and `gundo`
- Vim built with `+lua` for `neocomplete.vim`
- npm and node.js for `ternjs`
- C compiler for `unite.vim`
- `make` for `vimproc`
- `git` to fetch dependencies (this sucks, I know)
- `ag` (optional) for the speedy subdirectory search (see [the repo](https://github.com/ggreer/the_silver_searcher))

Installation
---

First of all be sure to have a compatible version of Vim. The easiest way to
install a full-featured Vim on Mac OS X with homebrew is to run
`brew install macvim -v --override-system-vim --with-lua --with-luajit` in your
terminal. (Instructions for other platforms satisfying the
[dependencies](#dependencies) are welcome)

After you can run the bash script from this repo which will take care of
everything but will do something terrible if you already have any of `.vim` or
`.vimrc`. But it works great on a clean set up:

    $ curl https://raw.githubusercontent.com/henry-hz/vimrc/master/install-script.sh > install-script.sh
    $ bash ./install-script.sh

Manual installation
---

Download `.vimrc` file.

    $ curl https://raw.github.com/Slava/vimrc/master/.vimrc > ~/.vimrc

Install `neobundle`

    $ mkdir -p ~/.vim/bundle
    $ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

Open `vim`, install all the packages, quit vim:

    $ vim -c "NeoBundleInstall" -c "q"

Finish installation by installing `tern-meteor`:

    $ cd ~/.vim/bundle/tern_for_vim/
    $ npm install
    $ curl https://raw.githubusercontent.com/Slava/tern-meteor/master/meteor.js > node_modules/tern/plugin/meteor.js



