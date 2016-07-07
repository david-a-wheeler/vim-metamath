# vim-metamath

This is vim-metamath, a vim mode for editing [metamath](http://metamath.org/)
files by David A. Wheeler.  It provides immediate feedback, which
should help you detect and fix defects before you even save your file.
It is Free / libre / open source software, released under the MIT license.

This mode has the same goals, but is otherwise unrelated
and much more ambitious, than
[marnix/metamath.vim mode](https://github.com/marnix/metamath.vim).
It handles much more, e,g., it specially highlights different kinds of comments.

## Installation

If you're running Unix/Linux (including MacOS) and have "make",
just run "make install" to install it.

This doesn't do any serious magic, it just copies the files in the
vim/ directory into your local vim files directory
(it will create your local vim files directory if you don't have one).
On Unix/Linux systems (including MacOS) the local vim files directory
is "${HOME}/.vim", while on Windows it is "%userprofile%\vimfiles".

Advanced users can add parameters to make.
Just set VIMDIR to the vim files directory to install to, and/or
CP\_OPTIONS to set additional options to "cp" when copying.
The Makefile does respect the DESTDIR convention, and it also
supports "make uninstall".  Here's an example:

> make VIMDIR="${HOME}/.vim-alt".

## Screenshots

Here are a few screenshots.
Note that vim-metamath and vim are extremely configurable, so you
can make your display look very different if you want it to.
By default this mode uses a range of different colors to
maximize feedback (which can help you avoid defects).

Here's an example of text-based vim (withi :set background=dark):

![Vim metamath screenshot](https://github.com/david-a-wheeler/vim-metamath/blob/master/vim-metamath-screenshot.png)

Here's an example of GUI-based gvim (withi :setcolor elflord):

![GVim metamath screenshot](https://github.com/david-a-wheeler/vim-metamath/blob/master/gvim-metamath-elflord.png)
