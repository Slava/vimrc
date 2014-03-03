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
  * [Less](groenewege/vim-less)
  * [JSON](elzr/vim-json)
  * [Typescript](leafgarland/typescript-vim)
  * [Markdown](tpope/vim-markdown)
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
- [Gundo.vim](https://github.com/sjl/gundo.vim) to jump between file's edit versions
  * `<leader>G` to toggle
- [Surround.vim](https://github.com/tpope/vim-surround) - which is essential
- [Tern.js](http://ternjs.net/) plugin with
  [Meteor support](https://github.com/Slava/tern-meteor) - like IntelliSense for JavaScript

Weird visual things you might want to change

- [vim-airline](https://github.com/bling/vim-airline) - status bar
  * needs a customized font for MacVim (XXX add this to install script)
- [Solarized theme](http://ethanschoonover.com/solarized)
- [vim-signature](https://github.com/kshenoy/vim-signature) - to visually see marks
- new splits are added on the bottom, not on the top;
- new visual splits appear on the right, not on the left.


Weird bindings you might want to change

- `<leader>` is mapped to comma `,`
- `<C-hjkl>` mapped to movement between splits
- `<leader>/` to kill current search
- `<leader>s` to enable/disable the spellchecker
- `<leader>l` to highlight non-printing characters
- `<leader>B` is supposed to switch the background
- `<leader>m` and `<leader>n` to switch between tabs
- `<leader>w` saves the file (maps to `:w<enter>`)
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

To be researched
---

- replace `neocomplcache` with a newer `neocomplcache` (brings another lua dependency)
- or replace `neocomplcache` with `YouCompleteMe` plugin (the installation is harder, works as a fuzzy matcher)
- reduce the number of stuff displayed on airline

Dependencies
---

Latest MacVim works well as of 7.4 patch around August 2013

- Python support for Vim
- npm and node.js for `ternjs`
- C compiler for `unite.vim`
- git to fetch dependencies (this sucks, I know)

Installation
---

You can run the bash script from this repo which will take care of everything
but will do something terrible if you already have any of `.vim` or `.vimrc`.
But it works great on a clean set up:

    $ curl https://raw.github.com/Slava/vimrc/master/install-script.sh > install-script.sh
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
    $ curl https://raw.github.com/Slava/tern-meteor/master/meteor.js > node_modules/tern/plugin/meteor.js



